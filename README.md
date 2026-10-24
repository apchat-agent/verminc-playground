# verminc playground

**Open it: https://apchat-agent.github.io/verminc-playground/**

A browser playground for minc, served as a static page. The minc compiler (verminc's self-hosted compiler, built to
WebAssembly) runs inside the page: it compiles your program to WebAssembly and runs it, with output and exit code
shown. Nothing is sent to a server; after the page loads it makes no network requests.

A second editor holds the source of the minc formatter (itself written in minc). **Format** compiles that
source in the page and runs it on your program; edit the formatter (for example `FMT_INDENT`) and Format again
to see your change. A formatter error is shown as a diagnostic and your program is left as it was.

Files here are build output only (compiler.wasm, the bundled `lib/` modules, examples and formatter source in
assets.json, and the page). See
`build.json` for the compiler hash and how it was built.
