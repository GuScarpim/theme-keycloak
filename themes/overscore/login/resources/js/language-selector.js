document.addEventListener("DOMContentLoaded", () => {
  const languageDropdown = document.getElementById("kc-locale-dropdown");

  if (languageDropdown) {
    languageDropdown.addEventListener("change", () => {
      document.body.classList.add("language-transition");

      setTimeout(() => {
        window.location.href = languageDropdown.value;
      }, 200);
    });
  }
});
