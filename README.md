# verminc playground

A browser playground for minc, served as a static page. The minc compiler (verminc's self-hosted compiler, built to
WebAssembly) runs inside the page: it compiles your program to WebAssembly and runs it, with output and exit code
shown. Nothing is sent to a server; after the page loads it makes no network requests.

Files here are build output only (compiler.wasm, the bundled `lib/` modules in assets.json, and the page). See
`build.json` for the compiler hash and how it was built.
