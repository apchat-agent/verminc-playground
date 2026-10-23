const $ = (id) => document.getElementById(id);
let worker;
let timer;
let examples = [];
let started;

function state(name, message) {
  document.body.dataset.state = name;
  $("status").textContent = message;
  $("run").disabled = !["ready", "done"].includes(name);
  $("stop").disabled = name !== "running";
  $("examples").disabled = ["loading", "running"].includes(name);
}
function stop(message = "Stopped. Reload the page to start a new session.") {
  clearTimeout(timer);
  worker?.terminate();
  state("stopped", message);
  $("exit-code").textContent = "—";
}
function run() {
  if ($("run").disabled) return;
  let args;
  try {
    args = JSON.parse($("arguments").value || "[]");
    if (
      !Array.isArray(args) ||
      !args.every((arg) => typeof arg === "string" && !arg.includes("\0"))
    ) {
      throw new Error(
        'Use a JSON array of strings, for example ["sample", "17"].',
      );
    }
  } catch {
    $("status").textContent =
      'Arguments must be a JSON array of strings, for example ["sample", "17"].';
    $("arguments").focus();
    return;
  }
  $("stdout").textContent = "";
  $("stderr").textContent = "";
  $("exit-code").textContent = "—";
  started = performance.now();
  state("running", "Compiling and running…");
  timer = setTimeout(
    () =>
      stop("Stopped after 30 seconds. Reload the page to start a new session."),
    30000,
  );
  worker.postMessage({ type: "run", source: $("source").value, args });
}
$("run").addEventListener("click", run);
$("stop").addEventListener("click", () => stop());
$("examples").addEventListener("change", () => {
  const example = examples.find((item) => item.id === $("examples").value);
  if (example) {
    $("source").value = example.source;
    $("arguments").value = JSON.stringify(example.args);
  }
});
document.addEventListener("keydown", (event) => {
  if ((event.metaKey || event.ctrlKey) && event.key === "Enter") {
    event.preventDefault();
    run();
  }
});

async function load() {
  const [compilerResponse, bundleResponse] = await Promise.all([
    fetch("./compiler.wasm"),
    fetch("./assets.json"),
  ]);
  if (!compilerResponse.ok || !bundleResponse.ok) {
    throw new Error(
      "Missing compiler assets. Run scripts/build_playground.py first.",
    );
  }
  const [compiler, bundle] = await Promise.all([
    compilerResponse.arrayBuffer(),
    bundleResponse.json(),
  ]);
  examples = bundle.examples;
  for (const example of examples) {
    const option = document.createElement("option");
    option.value = example.id;
    option.textContent = example.label;
    $("examples").append(option);
  }
  $("examples").dispatchEvent(new Event("change"));
  worker = new Worker("./worker.js", { type: "module" });
  worker.onmessage = ({ data }) => {
    if (data.type === "ready") {
      state("ready", "Ready. Everything needed is now in this tab.");
    } else if (data.type === "result") {
      clearTimeout(timer);
      $("stdout").textContent = data.result.stdout;
      $("stderr").textContent = data.result.stderr;
      $("exit-code").textContent = String(data.result.exitCode);
      const elapsed = ((performance.now() - started) / 1000).toFixed(2);
      state(
        "done",
        data.result.phase === "compile"
          ? "Compilation failed."
          : `Finished in ${elapsed}s.`,
      );
    } else if (data.type === "error") {
      $("stderr").textContent = data.message;
      stop("The playground host stopped. Reload to restart.");
    }
  };
  worker.onerror = () =>
    stop(
      "Could not start the playground host. Serve this directory with a local static server.",
    );
  worker.postMessage({
    type: "init",
    compiler,
    files: bundle.files,
    warmup: examples.map((example) => example.source),
  }, [
    compiler,
  ]);
}
load().catch((error) => state("stopped", `Unable to load: ${error.message}`));
