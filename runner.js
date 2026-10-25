import { runWasi } from "./wasi.js?v=ba49882";

// The browser Worker and Deno acceptance tests use this exact compile/run path.
export async function compileAndRun(
  compiler,
  { source, args = [], files = {}, stdin = "", sourcePath = "/workspace/main.mc" },
) {
  const outputPath = "/workspace/program.wasm";
  const inputs = { ...files, [sourcePath]: source };
  delete inputs[outputPath];
  const compiled = await runWasi(compiler, {
    args: [
      "/workspace/compiler",
      "build",
      sourcePath,
      "--backend",
      "native",
      "--target",
      "wasm",
      "-o",
      outputPath,
    ],
    files: inputs,
  });
  if (compiled.exitCode !== 0) {
    return {
      phase: "compile",
      stdout: compiled.stdout,
      stderr: compiled.stderr,
      exitCode: compiled.exitCode,
    };
  }
  const program = compiled.files[outputPath];
  if (!program) {
    return {
      phase: "compile",
      stdout: compiled.stdout,
      stderr: compiled.stderr +
        "Playground: compiler produced no output module.\n",
      exitCode: 1,
    };
  }
  // Each execution has its own filesystem, descriptors and memory, even on rerun.
  const executed = await runWasi(program, {
    args: ["program", ...args],
    files,
    stdin,
  });
  return {
    phase: "run",
    stdout: executed.stdout,
    stderr: executed.stderr,
    exitCode: executed.exitCode,
  };
}

// Browsers first run a module in a baseline tier (Safari: an interpreter) whose stack frames are much larger
// than optimized code, and a Worker's stack is small. The deeply recursive selfhost compiler can then overflow
// on its first compiles and succeed once the engine has tiered it up (reproduced in V8 at a 130 KB stack).
// The compiler is deterministic, so a compile that failed this way is retried; a user program that
// overflows while running is not.
const STACK_OVERFLOW = /maximum call stack size exceeded|too much recursion/i;
const pause = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

export function isCompilerStackOverflow(result) {
  return result.phase === "compile" && STACK_OVERFLOW.test(result.stderr);
}

export async function compileAndRunRetrying(compiler, request, { retries = 8, delayMs = 100 } = {}) {
  let result = await compileAndRun(compiler, request);
  for (let attempt = 1; attempt <= retries && isCompilerStackOverflow(result); attempt++) {
    await pause(delayMs * attempt);
    result = await compileAndRun(compiler, request);
  }
  return result;
}

// Formatting is an ordinary minc program, compiled from the editable source.
// Its location keeps the formatter's own relative parser imports valid.
export async function formatSource(compiler, { formatter, source, files = {} }) {
  return await compileAndRunRetrying(compiler, {
    source: formatter,
    sourcePath: "/workspace/tools/fmt.mc",
    stdin: source,
    files,
  });
}

// Compiles each source (the bundled examples) until it compiles without a stack overflow, so the engine has
// tiered up the compiler paths those programs use before the first real Run. Overflows are cheap (they fail
// within milliseconds); the total is capped. Returns the number of compiles used.
export async function warmUp(compiler, files, sources, { maxCompiles = 60, delayMs = 20 } = {}) {
  let used = 0;
  for (const source of sources) {
    while (used < maxCompiles) {
      used++;
      if (!isCompilerStackOverflow(await compileAndRun(compiler, { source, files }))) break;
      await pause(delayMs);
    }
  }
  return used;
}
