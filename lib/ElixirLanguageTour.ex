# Copyright 2024 Paul Guyot <pguyot@kallisys.net>
# SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later

defmodule ElixirLanguageTour do
    def start() do
        # Name self() process so Module.cast js function below will send messages to us
        Process.register(self(), :main)

        :emscripten.run_script(
            "var p = window.document.createElement('p');" <>
            "p.appendChild(window.document.createTextNode('Lorem ipsum.'));" <>
            "window.document.getElementById('lesson').appendChild(p);",
            [:main_thread, :async])

        :emscripten.register_keypress_callback("#source", [{:use_capture, :true}, {:prevent_default, :true}])
        eval()
        loop()
    end

    def loop() do
        receive do
            {:emscripten, {:keypress, _keyboard_event}} -> eval()
            {:emscripten, {:cast, script}} ->
                try do
                    Code.eval_string(script)
                rescue
                    RuntimeError -> IO.puts("An error occured evaluating script #{script}")
                end
            _other ->
                IO.puts("Unknown message received")
                :io.format('~p', [_other])
        end
        loop()
    end

    def eval() do
        :emscripten.run_script(
            "window.document.getElementById('stdout').innerHTML = '';" <>
            "Module.cast('main', window.document.getElementById('source').value);",
            [:main_thread, :async])
    end
end
