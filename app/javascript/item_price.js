window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTax = document.getElementById("add-tax-price");
    const addTaxnum = (Math.floor(inputValue * 0.1));
    addTax.innerHTML = addTaxnum

    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = (Math.floor(inputValue - addTaxnum));
  })
});