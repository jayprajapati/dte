const token = localStorage.getItem("sessionToken");
if (token) {
  chrome.storage.local.set({ sessionToken: token }, () => {
    console.log("Session token stored:", token);
  });
}

const token2 = localStorage.getItem("accessToken");
if (token2) {
  chrome.storage.local.set({ accessToken: token2 }, () => {
    console.log("Access token stored:", token2);
  });
}

