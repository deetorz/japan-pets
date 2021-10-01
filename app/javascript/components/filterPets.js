const filterPets = () => {
  const button = document.querySelector(".submit");
  const animal = document.querySelector("#animal");
  const animalCards = document.querySelectorAll(".pet-container");
  button.addEventListener("click", () => {
    const animalText = animal.options[animal.selectedIndex].text;
    // console.log(animalText);
    animalCards.forEach(card => {
      if (card.querySelector(".animal").innerHTML.includes(animalText)) {
        card.classList.remove("toggle-card");
      } else {
        card.classList.add("toggle-card")
      }
    });
  });
};

export { filterPets };
