<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="dao.ServiceDAO"%>
<%@ page import="bean.addServiceBean"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* Remove underline from footer links */
footer a {
	text-decoration: none;
}

/* About Us Section Styling */
.about-us {
	padding: 60px 0;
	background-color: #f8f9fa; /* Light gray background */
}

.about-us h2 {
	color: #333; /* Darker text color */
	font-size: 2.5rem;
	margin-bottom: 20px;
}

.about-us p {
	font-size: 1.125rem;
	color: #555; /* Darker gray text for readability */
	line-height: 1.6;
}

/* Carousel Image Styling */
.carousel-item img {
	width: 100%;
	height: 600px;
	object-fit: cover;
	/* Ensures the image covers the container without distortion */
}

/* Search Input Styling */
.search-input {
	position: relative;
}

.search-input input {
	padding-right: 2.5rem; /* Add space for the icon */
}

.search-input .fa-search {
	position: absolute;
	right: 0.5rem;
	top: 50%;
	transform: translateY(-50%);
	color: #6c757d;
	padding: 20px;
}
</style>
</head>
<body>
	<!-- Navbar Starts  -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><strong>VELVETVIBE</strong></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.html">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Services </a>
						<ul class="dropdown-menu">
							<%
								ServiceDAO dao = new ServiceDAO();
								List<addServiceBean> services = dao.getAllServices();
								if (services != null && !services.isEmpty()) {
									for (addServiceBean service : services) {
							%>
							<li><a class="dropdown-item" href="#"><%=service.getServiceName()%></a></li>
							<%
								}
								} else {
							%>
							<li><a class="dropdown-item" href="#">No services
									available</a></li>
							<%
								}
							%>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Appointment
							Booking</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Browse Services</a></li>
							<li><a class="dropdown-item" href="#">Book Appointment</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link " href="feedback.jsp">Feedback</a></li>
				</ul>
				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					<li class="nav-item search-input">
						<form class="d-flex ms-3" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search...." aria-label="Search"> <i
								class="fa-solid fa-search"></i>
						</form>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fas fa-heart"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="userProfile.jsp"> <i
							class="fas fa-user"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">
							<i class="fas fa-sign-out-alt"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar Ends  -->
	        <%
    HttpSession httpsession = request.getSession(false); // Retrieve existing session or null if none exists
    String role = null;

    if (httpsession != null) {
        role = (String) httpsession.getAttribute("role");
    }

    if (role == null || !"user".equals(role)) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in or not an admin
        return;
    }
%>



	<p>You have successfully logged in.</p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- About Us Section Starts -->
	<section class="about-us">
		<div class="container">
			<h2>About Us</h2>
			<p>Welcome to VelvetVibe : Your Premier Beauty Booking
				Destination</p>
			<p>At VelvetVibe, we are dedicated to simplifying your beauty
				experience by offering a seamless, online platform for booking
				top-notch salon services. Our goal is to connect you with the best
				beauty professionals, ensuring you receive exceptional service and
				stunning results every time.</p>
		</div>
	</section>
	<!-- About Us Section Ends -->
	<!-- Footer Starts  -->
	<footer class="bg-dark text-white pt-5 pb-3">
		<div class="container">
			<div class="row">
				<!-- Company Information -->
				<div class="col-md-3">
					<h5 class="text-uppercase">VELVETVIBE</h5>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white">About Us</a></li>
					</ul>
				</div>

				<!-- Customer Service -->
				<div class="col-md-3">
					<h5 class="text-uppercase">Customer Service</h5>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white">Contact Us</a></li>
					</ul>
				</div>

				<!-- Social Media Links -->
				<div class="col-md-3">
					<h5 class="text-uppercase">Follow Us</h5>
					<ul class="list-unstyled d-flex">
						<li class="me-3"><a href="#" class="text-white"><i
								class="fab fa-facebook-f"></i> Facebook</a></li>
						<li class="me-3"><a href="#" class="text-white"><i
								class="fab fa-twitter"></i> Twitter</a></li>
						<li class="me-3"><a href="#" class="text-white"><i
								class="fab fa-instagram"></i> Instagram</a></li>
						<li><a href="#" class="text-white"><i
								class="fab fa-youtube"></i> YouTube</a></li>
					</ul>
				</div>
			</div>

			<div class="text-center mt-4">
				<p class="mb-0">&copy; 2024 VELVETVIBE. All rights reserved.</p>
			</div>
		</div>
	</footer>
	<!-- Footer Ends -->
</body>
</html>