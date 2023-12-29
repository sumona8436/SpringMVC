<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.spring.servicePage.CartDetails"%>
<%@ page import="com.spring.servicePage.ProductDetails"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale=1.e">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEST ONLINE CAFE DELIVERY SERVICE | indiecafe.com</title>
<style>
body {
	background-size: cover;
}

#con-header {
	background-image: linear-gradient(rgba(4, 9, 60, 0.7),
		rgba(4, 9, 60, 0.7)),
		url("<c:url value='/resources/images/add-to-cart-note-box.jpg' />");
}
</style>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<section id="con-header">
		<nav id="navbar">
			<div id="logo">
				<img src="<c:url value="/resources/images/s1.jpg" />"
					alt="indiecafe.com" width="200" height="100">
			</div>
			<ul>
				<!--eta likhe enter korle nicher gulo asbe,emmet li.item(<a></a>)*5-->
				<li class="item"><a href="index">HOME</a></li>
				<li class="item"><a href="services">SERVICES</a></li>
				<li class="item"><a href="index.jsp #log">LOG IN</a></li>
				<li class="item"><a href="contact">CONTACT DETAILS</a></li>
				<li class="item"><a href="cart">CART</a></li>
				<li class="item"><a href="index.jsp #about">ABOUT US</a></li>
			</ul>
		</nav>
	</section>

	<%-- <%
	// Retrieve the JSON string from the URL(coming from checknow page ajax call)
	String jsonData = URLDecoder.decode(request.getParameter("jsonData"), "UTF-8");

	// Parse the JSON string into a JavaScript object
	JSONObject dataOfResponseServiceAjax = new JSONObject(jsonData);

	// Create a new JSONObject with only id and name
	JSONObject selectedData = new JSONObject();
	selectedData.put("Product_ID", dataOfResponseServiceAjax.get("id"));
	selectedData.put("Product_Name", dataOfResponseServiceAjax.get("product_Name"));

	// Convert the Java object to a JSON string
	String jsonString = selectedData.toString();
	%> --%>

	<h1 style="color: #684BC5; text-align: center; margin-top: 20px;">Shopping
		Cart</h1>

	<div class="productTable">
		<table id=cartTable>
			<thead>
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Remove</th>
					<th>SubTotal</th>
				</tr>
			</thead>
			<tbody>
				<%-- <tr class="productTDStart">
					<td>
						<div class="product">
							<div class="productImage">
								<img src="<c:url value='/resources/images/icecream4.jpg' />">
							</div>
							<div class="product-details">
								<div class="product-title">
									<p>Dingo Dog Bones</p>
									<small>-63% One Item
										<div class="product-price">45.99</div>
									</small>
								</div>
							</div>
						</div>
					</td>
					<td class="product-quantity"><input type="number" value="1"
						min="1"></td>
					<td class="product-removal">
						<button class="remove-product">Remove</button>
					</td>
					<td>
						<div class="product-line-price">45.99</div>
					</td>
				</tr> --%>
			</tbody>

		</table>
	</div>


	<div class="totals">
		<div class="totals-item">
			<label>Subtotal</label>
			<div class="totals-value" id="cart-subtotal">45.99</div>
		</div>
		<div class="totals-item">
			<label>Tax (5%)</label>
			<div class="totals-value" id="cart-tax">3.60</div>
		</div>
		<div class="totals-item">
			<label>Shipping</label>
			<div class="totals-value" id="cart-shipping">15.00</div>
		</div>
		<div class="totals-item totals-item-total">
			<label>Grand Total</label>
			<div class="totals-value" id="cart-total">90.57</div>
		</div>
		<button class="checkout" onclick="checkoutPageButton">Checkout</button>
	</div>


	<!--<div class="product">
			<div class="productImage">
				<img src="<c:url value='/resources/images/icecream4.jpg' />">
			</div>
			<div class="product-details">
				<div class="product-title">Dingo Dog Bones</div>
				<p class="product-description">The best dog bones of all time.
					Holy crap. Your dog will be begging for these things! I got curious
					once and ate one myself. I'm a fan.</p>
			</div>
			<div class="productPrice">12.99</div>
			<div class="productQuantity">
				<input type="number" value="2" min="1">
			</div>
			<div class="productRemoval">
				<button class="remove-product">Remove</button>
			</div>
			<div class="product-line-price">25.98</div>
		</div> 

	 <div class="product">
			<div class="product-image">
				<img
					src="https://s.cdpn.io/3/large-NutroNaturalChoiceAdultLambMealandRiceDryDogFood.png">
			</div>
			<div class="product-details">
				<div class="product-title">Nutro™ Adult Lamb and Rice Dog Food</div>
				<p class="product-description">Who doesn't like lamb and rice?
					We've all hit the halal cart at 3am while quasi-blackout after a
					night of binge drinking in Manhattan. Now it's your dog's turn!</p>
			</div>
			<div class="product-price">45.99</div>
			<div class="product-quantity">
				<input type="number" value="1" min="1">
			</div>
			<div class="product-removal">
				<button class="remove-product">Remove</button>
			</div>
			<div class="product-line-price">45.99</div>
		</div>
 -->






	<script language="javascript">
		var contextPath = '<c:url value="/" />';
		
		/* Set rates + misc */
		var taxRate = 0.05;
		var shippingRate = 15.00;
		var fadeTime = 300;
		
		 $(document).ready(function() { 
			 var subtotal;
			 $.ajax({
					type: "GET",
					url:"gettingAllDataFromCartTable",
					success: function(responseData){
						 console.log("Product details:", responseData);
						 
						 //responseData.forEach(addRowToTable);
						   subtotal = 0;
						 
						 responseData.forEach(function (item) {
					            // Make an additional AJAX call for each item in responseData
					            $.ajax({
					                type: "GET",
					                url: "addToCartButtonFromServicePage/" + item.product_ID,
					                success: function (productDetailsResponse) {
					                    // Handle the response from the addToCartButton API call
					                    console.log("Product details from addToCartButton API:", productDetailsResponse);
					                    // Add the item price to the subtotal
				                        subtotal += parseFloat(productDetailsResponse.product_Price);

					                   addRowToTable(productDetailsResponse);
					                   
					                   // Update the subtotal display
				                        updateSubtotalDisplay(subtotal);
					                },
					                error: function (error) {
					                    console.error("Error calling addToCartButton API:", error);
					                }
					            });
					        });
					},
					error: function(error){
						console.error("Error: ",error);
					}
				});
			 
			// Function to add rows to the table
			    function addRowToTable(item) {
			    	 console.log("addRowToTable function running......");
					 
				
			        const tableBody = document.querySelector("#cartTable tbody");

			        const newRow = document.createElement("tr");
			        newRow.classList.add("productTDStart");
			        
			        // Set data attribute for item ID,it will need for remove button
			        newRow.dataset.itemId = item.id;

			        newRow.innerHTML = `
			            <td>
			                <div class="product">
			                    <div class="productImage">
			                         <img src="${contextPath}${item.product_image}">
			                    </div>
			                    <div class="product-details">
			                        <div class="product-title">
			                            <p>${item.product_Name}</p>
			                            <small> -63% OFF on One Item
			                                <div class="product-price">${item.product_Price}</div>
			                            </small>
			                        </div>
			                    </div>
			                </div>
			            </td>
			            <td class="product-quantity"><input type="number" value="1" min="1"></td>
			            <td class="product-removal">
			                <button class="remove-product">Remove</button>
			            </td>
			            <td>
			                <div class="product-line-price">${item.product_Price}</div>
			            </td>
			        `;

			        tableBody.appendChild(newRow);
			    }
			
			
			    function updateSubtotalDisplay(subtotal) {
			        // Update the subtotal display
			         var tax = subtotal * taxRate;
			         var shipping = (subtotal > 0 ? shippingRate : 0);
			         var total = subtotal + tax + shipping;
			        $('#cart-subtotal').html(subtotal.toFixed(2));
			        $('#cart-tax').html(tax.toFixed(2));
					$('#cart-shipping').html(shipping.toFixed(2));
					$('#cart-total').html(total.toFixed(2));
			    }
			
			    /* Assign actions */
			    $('#cartTable').on('change', '.product-quantity input', function () {
		            updateQuantity(this);
		        });

		        $('#cartTable').on('click', '.product-removal button', function () {
		        	// Get the item ID from the data attribute
		            var itemId = $(this).closest('tr').data('item-id');
		            removeItem(this,itemId);
		        });

		 }); 
			
		
		
		/* Assign actions */
		/* $('.product-quantity input').change(function() {
			updateQuantity(this);
		});

		$('.product-removal button').click(function() {
			removeItem(this);
		}); */

		
		/* Recalculate cart */
		function recalculateCart() {
			var subtotal = 0;

			/* Sum up row totals */
			$('.productTDStart').each(
					function() {
						var linePrice = parseFloat($(this).find(
								'.product-line-price').text().trim());

						if (!isNaN(linePrice)) {
							subtotal += linePrice;
						} else {
							console.error('Invalid line price:', linePrice);
						}
					});

			/* Calculate totals */
			var tax = subtotal * taxRate;
			var shipping = (subtotal > 0 ? shippingRate : 0);
			var total = subtotal + tax + shipping;

			/* Update totals display */
			$('.totals-value').fadeOut(fadeTime, function() {
				$('#cart-subtotal').html(subtotal.toFixed(2));
				$('#cart-tax').html(tax.toFixed(2));
				$('#cart-shipping').html(shipping.toFixed(2));
				$('#cart-total').html(total.toFixed(2));
				if (total == 0) {
					$('.checkout').fadeOut(fadeTime);
				} else {
					$('.checkout').fadeIn(fadeTime);
				}
				$('.totals-value').fadeIn(fadeTime);
			});
		}

		/* Update quantity */
		function updateQuantity(quantityInput) {
			/*  Calculate line price  */
			var productRow = $(quantityInput).closest('tr'); // Use closest to find the closest 'tr' element
			var price = parseFloat(productRow.find('.product-price').text()); // Use find to locate the element
			var quantity = $(quantityInput).val();
			var linePrice = price * quantity;

			/*  Update line price display and recalc cart totals  */
			productRow.find('.product-line-price').each(function() {
				$(this).fadeOut(fadeTime, function() {
					$(this).text(linePrice.toFixed(2));
					recalculateCart();
					$(this).fadeIn(fadeTime);
				});
			});
		}

		/* Remove item from cart */
		function removeItem(removeButton,itemId) {
			//console.log("itemIdof remove button",itemId);
			/* Remove row from DOM and recalc cart total */
			var productRow = $(removeButton).parent().parent();
			//console.log("productRow of remove button",productRow);
			productRow.slideUp(fadeTime, function() {
				productRow.remove();
				recalculateCart();
			});
			
			 $.ajax({
					type: "DELETE",
					contentType: "application/json; charset=utf-8",
					url:"deleteDataFromCartTable/"+itemId,
					success: function(responseData){
						 console.log("Remove item ajax response:", responseData);
					},
			 
					error: function(error){
					console.error("Error: ",error);
					}
					});
						 
		}

		function checkoutPageButton() {
			console.log("under checkout function ");
			console.log(".....Implementation under in progres..... ");
		}
		
		
		
		
		
		<%-- <console.log("JSON Data:", <%= jsonData %>);
		console.log("jsonString Data:", <%= jsonString %>); 
		  console.log("JSON Data jsonData.id,:", <%= jsonData %>.id); --%>
		//parsing the response into variable
		//not required,cause jsonData is already a JSONobject,no need to create another object
		<%-- var parsedData = JSON.parse(<%= jsonData %>); 
		
		var ajaxData = <%=jsonString%>;
		 console.log("Data being sent in AJAX request:", ajaxData); 
		 $.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url:"storingCartItemFromCartPage",
				 data: JSON.stringify({
					 Product_ID: <%= jsonData %>.id,
					 Product_Name: <%= jsonData %>.product_Name
				    }), 
				 data: JSON.stringify(ajaxData), 
				success: function(responseData){
					 console.log("Product details:", responseData);
				},
				error: function(error){
					console.error("Error: ",error);
				}
			});--%>
	</script>
</body>
</html>