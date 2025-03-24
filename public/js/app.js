async function askAI() {
    const prompt = document.getElementById("prompt").value.trim();
    const chatBox = document.getElementById("chat-box");
  
    if (!prompt) return;
  
    // Affiche la question de l'utilisateur
    const userMessage = document.createElement("div");
    userMessage.className = "message user";
    userMessage.textContent = prompt;
    chatBox.appendChild(userMessage);
    document.getElementById("prompt").value = "";
  
    // Affiche le message "Chargement..."
    const botMessage = document.createElement("div");
    botMessage.className = "message bot";
    botMessage.textContent = "Chargement...";
    chatBox.appendChild(botMessage);
    chatBox.scrollTop = chatBox.scrollHeight;
  
    try {
      const res = await fetch("php/mixtral_proxy.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ prompt })
      });
  
      const data = await res.json();
      const reply = data?.[0]?.generated_text || "Erreur dans la réponse.";
      botMessage.textContent = reply;
  
    } catch (error) {
      botMessage.textContent = "Erreur lors de l'appel API.";
    }
  
    chatBox.scrollTop
}

const themeToggle = document.getElementById("theme-toggle");

// Appliquer le thème sauvegardé au chargement
const savedTheme = localStorage.getItem("theme");
if (savedTheme === "light") {
  document.body.classList.add("light-mode");
  themeToggle.textContent = "🌙 Mode sombre";
} else {
  document.body.classList.remove("light-mode");
  themeToggle.textContent = "☀️ Mode clair";
}

// Gérer le clic sur le bouton
themeToggle.addEventListener("click", () => {
  document.body.classList.toggle("light-mode");

  const isLight = document.body.classList.contains("light-mode");

  // Sauvegarder dans localStorage
  localStorage.setItem("theme", isLight ? "light" : "dark");

  // Modifier le texte du bouton
  themeToggle.textContent = isLight ? "🌙 Mode sombre" : "☀️ Mode clair";
});
