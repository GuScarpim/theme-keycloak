// Script para melhorar a experiência do seletor de idiomas
document.addEventListener("DOMContentLoaded", () => {
  const languageDropdown = document.getElementById("kc-locale-dropdown");

  if (languageDropdown) {
    // Adiciona uma transição suave ao mudar de idioma
    languageDropdown.addEventListener("change", () => {
      // Adiciona uma classe para fade-out antes de navegar
      document.body.classList.add("language-transition");

      // Pequeno atraso para permitir a animação antes de navegar
      setTimeout(() => {
        window.location.href = languageDropdown.value;
      }, 200);
    });
  }
});
