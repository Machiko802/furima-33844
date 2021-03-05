function calculation (){ 
 const itemPrice = document.getElementById("item-price");
 itemPrice.addEventListener("keyup", () => {
   const itemPriceVal = itemPrice.value;
   const addTaxPrice = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
   const fee = itemPriceVal * 0.1;
   addTaxPrice.innerHTML = fee;
   profit.innerHTML = itemPriceVal - fee;
 }); 
} 
window.addEventListener('load', calculation);

