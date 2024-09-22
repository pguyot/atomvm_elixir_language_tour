% Copyright 2023 Paul Guyot <pguyot@kallisys.net>
% SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later

-module(elixir_config).
-compile({no_auto_import, [get/1]}).
-export([new/1, warn/2, serial/1]).
-export([static/1, is_bootstrap/0, identifier_tokenizer/0]).
-export([delete/1, put/2, get/1, get/2, update/2, get_and_put/2]).

static(Map) when is_map(Map) -> Map.
is_bootstrap() -> false.
identifier_tokenizer() -> 'Elixir.String.Tokenizer'.

% Simple implementation where config values cannot be modified.
% We print unknown keys and modifications.
get(at_exit) -> [];
get(debug_info) -> false;
get(docs) -> false;
get(ignore_module_conflict) -> false;
get(no_halt) -> false;
get(no_warn_undefined) -> [];
get(on_undefined_variable) -> raise;
get(parser_options) -> [];
get(relative_paths) -> true;
get(tracers) -> [];
get(warnings_as_errors) -> false;
get(_Key) ->
    io:format("elixir_config:get(~p)\n", [_Key]),
    undefined.
get(_Key, Default) ->
    io:format("elixir_config:get(~p, ~p)\n", [_Key, Default]),
    Default.

put(Key, Value) ->
    case get(Key) =:= Value of
        true -> ok;
        false ->
            io:format("elixir_config:put(~p, ~p)\n", [Key, Value])
    end,
    Value.

get_and_put(Key, Value) ->
    case get(Key) =:= Value of
        true -> ok;
        false ->
            io:format("elixir_config:get_and_put(~p, ~p)\n", [Key, Value])
    end,
    Value.

update(_Key, _Fun) ->
    error(unimplemented).

new(_Opts) ->
    ok.

delete(?MODULE) ->
    ok.

%% MISC

serial(_Fun) ->
    error(unimplemented).

warn(_, _) ->
  false.

