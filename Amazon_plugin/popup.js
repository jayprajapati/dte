let intervalId = null;

document.getElementById("startBtn").addEventListener("click", () => {
  chrome.runtime.sendMessage({ action: "startQuery" });
});

document.getElementById("stopBtn").addEventListener("click", () => {
  chrome.runtime.sendMessage({ action: "stopQuery" });
});
