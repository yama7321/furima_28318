window.addEventListener("load", () => {
  const priceInput = document.getElementById("item_price");
  const productTax = document.getElementById("add-tax-price");
  const productProfit= document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = document.getElementById("item_price").value;
    productTax.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    productProfit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
  })
  }
);