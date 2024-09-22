# atomvm_elixir_language_tour

An AtomVM demo running an Elixir Language tour in the browser.

## Demo

The static files are currently served from https://helpful-puffpuff-e82442.netlify.app

## Build

mix atomvm.packbeam currently fails because it doesn't know about the newer Elixir support.
So you need PackBeam which is part of AtomVM.

```sh
mix compile
PackBeam create html/bin/ElixirLanguageTour.avm _build/dev/lib/ElixirLanguageTour/ebin/Elixir.ElixirLanguageTour.beam _build/dev/lib/ElixirLanguageTour/ebin/elixir_config.beam
```

The following beams are also required:

From Elixir (tested with 1.17.2):
```
mkdir -p html/bin/elixir/ebin
ELIXIR_LIB=/opt/local/lib/elixir cp \
    ${ELIXIR_LIB}/ebin/elixir_aliases.beam \
    ${ELIXIR_LIB}/ebin/elixir_dispatch.beam \
    ${ELIXIR_LIB}/ebin/elixir_env.beam \
    ${ELIXIR_LIB}/ebin/elixir_erl_pass.beam \
    ${ELIXIR_LIB}/ebin/elixir_erl_var.beam \
    ${ELIXIR_LIB}/ebin/elixir_erl.beam \
    ${ELIXIR_LIB}/ebin/elixir_errors.beam \
    ${ELIXIR_LIB}/ebin/elixir_expand.beam \
    ${ELIXIR_LIB}/ebin/elixir_interpolation.beam \
    ${ELIXIR_LIB}/ebin/elixir_locals.beam \
    ${ELIXIR_LIB}/ebin/elixir_parser.beam \
    ${ELIXIR_LIB}/ebin/elixir_rewrite.beam \
    ${ELIXIR_LIB}/ebin/elixir_tokenizer.beam \
    ${ELIXIR_LIB}/ebin/elixir_utils.beam \
    ${ELIXIR_LIB}/ebin/elixir.beam \
    ${ELIXIR_LIB}/ebin/Elixir.Code.beam \
    ${ELIXIR_LIB}/ebin/Elixir.Kernel.beam \
    ${ELIXIR_LIB}/ebin/Elixir.Module.ParallelChecker.beam \
    ${ELIXIR_LIB}/ebin/Elixir.Path.beam \
    ${ELIXIR_LIB}/ebin/Elixir.String.beam \
    ${ELIXIR_LIB}/ebin/Elixir.String.Tokenizer.beam \
    html/bin/elixir/ebin/
```

From Erlang OTP (tested with 27.0):
```
mkdir -p html/bin/stdlib-6.0/ebin
ERLANG_LIB=/opt/local/lib/erlang/lib/ cp \
    ${ERLANG_LIB}/ebin/erl_eval.beam \
    ${ERLANG_LIB}/ebin/erl_scan.beam \
    ${ERLANG_LIB}/ebin/erl_anno.beam \
    ${ERLANG_LIB}/ebin/ordsets.beam \
    ${ERLANG_LIB}/ebin/erl_internal.beam \
    ${ERLANG_LIB}/ebin/eval_bits.beam \
    html/bin/stdlib-6.0/ebin/
```

Eventually, you need AtomVM emscripten. Currently this build: https://github.com/pguyot/AtomVM/releases/tag/f59be83

Copy `AtomVM.js`, `AtomVM.worker.js`, `AtomVM.wasm` and `atomvmlib.avm` into `html/bin/`
