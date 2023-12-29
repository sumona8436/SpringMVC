<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- resoures linking required url,search in google -> jstl url, copy the core standard syntax -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale=1.e">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEST ONLINE CAFE DELIVERY SERVICE | indiecafe.com</title>

<%-- <c:set var="imagePath" value="/resources/images/coffee-beans.jpg" />
<c:url value="${imagePath}"  var="backgroundImageURL" /> --%>
<%-- <c:url var="backGroundImageURL" value="/resources/images/coffee-beans.png" />  --%>

<style>
@import url('https://fonts.googleapis.com/css?family=Bad+Script');

body {
/* background-color: transparent; */
	background-image: linear-gradient(rgba(4, 9, 60, 0.5),
		rgba(4, 9, 60, 0.5)),
		url("<c:url value='/resources/images/coffee-beans.jpg' />");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>


<body>

	<nav id="navbar">
		<div id="logo">
			<img src="<c:url value="/resources/images/s1.jpg" />"
				alt="indiecafe.com" width="200" height="100">
		</div>
		<ul>
			<!--eta likhe enter korle nicher gulo asbe,emmet li.item(<a></a>)*5-->
			<li class="item"><a href="index">
					<div>
						<i class="fa fa-home" aria-hidden="true"></i>
					</div> HOME
			</a></li>
			<br>
			<li class="item"><a href="services">
					<div>
						<i class="fa fa-cutlery" aria-hidden="true"></i>
					</div> SERVICES
			</a></li>
			<br>
			<li class="item"><a href="#log">
					<div>
						<i class="fa fa-sign-in" aria-hidden="true"></i>
					</div> LOG IN
			</a></li>
			<li class="item"><a href="contact">
					<div>
						<i class="fa fa-map-marker" aria-hidden="true"></i>
					</div> CONTACT DETAILS
			</a></li>
			<br>
			<li class="item"><a href="cart">
					<div>
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>
					</div> CART
			</a></li>
			<br>
			<li class="item"><a href="#about">
					<div>
						<i class="fa fa-briefcase" aria-hidden="true"></i>
					</div> ABOUT US
			</a></li>
		</ul>


	</nav>

	<section id="glow">
		<h1>
			<span>I</span> <span>n</span> <span>d</span> <span>i</span> <span>e</span>
		</h1>
		<h2>
			<span>C</span> <span>a</span> <span>f</span> <span>e</span>
		</h2>
	</section>

	<section id="home">
		<h1 class="h-primary">
			Welcome to INDIE CAFETERIA
			<h1>
				<p>A all in one place to start your good day. Enjoy your
					precious moments with our warm hospitality.</p>
				<p>We provides online service as well as offline
				<p>
					<a href="services">
						<button class="btn">Check Now</button>
					</a>
	</section>



	<section id="log">
		<div id="log-box">
			<form id="log-box" method="post" action="">
				<h1 class="h">
					<b><i class="fa fa-sign-in"></i> Log In</b>
				</h1>
				<br> <br> <label for="userid"><b>Email: </b></label><br>
				<input type="email" name="uname" id="uname" autocapitalize="off"
					autocorrect="off" placeholder="Enter Your EmailID"><br>
				<br> <label for="psw"><b>Password: </b></label> <input
					type="password" placeholder="Enter Password" name="pass" id="pass"
					required><br> <input type="checkbox"
					onclick="myfunction()">Show Password <br> <br> <input
					type="button" name="but" id="but" value="Log in here"> <br>
				<br> <input type="checkbox" id="check"> <span>Remember
					me</span><br> <br> <span class="psw"><a href="#">Forgot
						Password</a></span> <a href="signup">
					<button type="button" id="cancbut">Sign Up</button>
				</a>


			</form>


		</div>
		<script language="javascript">
			function myfunction() {
				var x = document.getElementById("pass");
				if (x.type === "password") {
					x.type = "text";
				} else {
					x.type = "password";
				}
			}
		</script>
	</section>
	<br>
	<br>
	<br>

	</section>
	<br>
	<br>
	<br>
	<section id="about">
		<div class="about-wrapper container">
			<div class="about-text">
				<p class="small">
					<u>About Us</u>
				</p>
				<h2>we've been making healthy food for last ten years</h2>
				<p>We began during 2021 as Brothers Coffee, preparing the
					shockingly smooth espresso with only a 12-pound shelled nut roaster
					on Seattle’s Pier 70. We soon exceeded our little roaster and moved
					to excellent Vashon Island.We entered opposition to name the “some
					espresso in Seattle” and when our quite smooth taste earned us the
					espresso crown & we changed our name to Indie Cafe.</p>

			</div>
			<div class="about-img">
				<img src="<c:url value="/resources/images/about-photo.jpg" />"
					alt="">
			</div>
		</div>
	</section>
	<section id="testimonials">
		<h2 class="testimonial-title">
			<u>What Our Customers Say</u>
		</h2>
		<div class="testimonial-container container">
			<div class="testimonial-box">
				<div class="star-ratting">
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span>
				</div>
				<p class="testimonial-text">This place is great! Atmosphere is
					chill and cool but the staff is also really friendly. You can tell,
					making the customers happy is their main priority. Food is pretty
					good and for their prices it’s 100% worth it.</p>
				<div class="customer-detail">
					<div class="customer-image">
						<img src="<c:url value="/resources/images/male-photo1.jpg" />"
							alt="">
					</div>
					<p class="customer-name">ALOK HALDER</p>
				</div>
			</div>

			<div class="testimonial-box">
				<div class="star-ratting">
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span>
				</div>
				<p class="testimonial-text">It’s a great experience. The
					ambiance is very welcoming and charming. Amazing wines, food and
					service. Staff are extremely knowledgeable and make great
					recommendations.</p>
				<div class="customer-detail">
					<div class="customer-image">
						<img src="<c:url value="/resources/images/male-photo2.jpg" />"
							alt="">
					</div>
					<p class="customer-name">BISSESWAR BERA</p>
				</div>
			</div>

			<div class="testimonial-box">
				<div class="star-ratting">
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span>
				</div>
				<p class="testimonial-text">We are so fortunate to have this
					place just a few minutes drive away from home.Food is stunning,
					both the tapas and downstairs cafe.Love this place and will
					continue to visit.!</p>
				<div class="customer-detail">
					<div class="customer-image">
						<img src="<c:url value="/resources/images/male-photo3.jpg" />"
							alt="">
					</div>
					<p class="customer-name">CHIRANJIT CHANGDAR</p>
				</div>
			</div>
		</div>
	</section>


	<footer id="foot">
		<div class="foot1">
			<div class="foot2">
				<div class="foot3">
					<h4>company</h4>
					<ul>
						<li><a href="foot.jsp #">our services</a></li>
						<li><a href="foot.jsp #privacy">privacy policy</a></li>
						<li><a href="foot.jsp #">affiliate program</a></li>
						<li><a href="foot.jsp #">business with us</a></li>
					</ul>
				</div>
				<div class="foot3">
					<h4>get help</h4>
					<ul>
						<li><a href="foot.jsp #faq">FAQ</a></li>
						<li><a href="foot.jsp#">shipping</a></li>
						<li><a href="foot.jsp #term">term and conditions</a></li>
						<li><a href="foot.jsp #">order status</a></li>
					</ul>
				</div>
				<div class="foot3">
					<h4>Payment help</h4>
					<ul>
						<li><a href="foot.jsp #payment">payment</a></li>
					</ul>
				</div>
				<div class="foot3">
					<h4>Follow us</h4>
					<div class="social">
						<a href=#><i class="fa fa-facebook-f"></i></a> <a href="#"><i
							class="fa fa-instagram"></i></a> <a href="#" target="_blank"><i
							class="fa fa-send"></i></a>

					</div>
				</div>
			</div>
		</div>
	</footer>


</body>
</html>