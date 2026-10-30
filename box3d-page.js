import { createGraphicsHost } from "./gfx/host.js?v=469fe291";

const canvas = document.querySelector("#box3d-canvas");
const status = document.querySelector("#box3d-status");
const host = createGraphicsHost(canvas);

try {
  const response = await fetch("./box3d.wasm?v=469fe291");
  if (!response.ok) throw new Error(`could not load Box3D module (${response.status})`);
  await host.run(await response.arrayBuffer());
  window.box3dHost = host;
  document.body.dataset.state = "ready";
  status.textContent = "Running · choose Pyramid or Distance Joint from the Sample menu.";
  window.addEventListener("pagehide", () => host.dispose(), { once: true });
} catch (error) {
  host.dispose();
  document.body.dataset.state = "error";
  status.dataset.state = "error";
  status.textContent = `Box3D could not start: ${error.message || error}`;
}
