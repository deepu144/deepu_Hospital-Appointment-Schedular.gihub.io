<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="Site keywords here">
<meta name="description" content="">
<meta name='copyright' content=''>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var closeIcon = document.getElementById("close_icon");
		var container = document.getElementById("PostponeAppointment");

		closeIcon.addEventListener("click", function() {
			container.style.display = "none";
		});
	});
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('.doctor_status_select').change(function() {
			var $row = $(this).closest('tr');
			var $saveBtn = $row.find('.save_btn');
			if ($(this).val() !== '') {
				$saveBtn.prop('disabled', false);
			} else {
				$saveBtn.prop('disabled', true);
			}
		});
	});
</script>


<script src="https://kit.fontawesome.com/e96d258b08.js"
	crossorigin="anonymous"></script>

<!-- Title -->
<title>Doctor Postpone</title>

<!-- Favicon -->
<link rel="icon" href="/img/Kcelogo.png">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/styles/PatientHome.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="/styles/nice-select.css">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="/styles/font-awesome.min.css">
<!-- icofont CSS -->
<link rel="stylesheet" href="/styles/icofont.css">
<!-- Slicknav -->
<link rel="stylesheet" href="/styles/slicknav.min.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="/styles/owl-carousel.css">
<!-- Datepicker CSS -->
<link rel="stylesheet" href="/styles/datepicker.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="/styles/animate.min.css">
<!-- Magnific Popup CSS -->
<link rel="stylesheet" href="/styles/magnific-popup.css">
<!-- Medipro CSS -->
<link rel="stylesheet" href="/styles/normalize.css">
<link rel="stylesheet" href="/styles/style.css">
<link rel="stylesheet" href="/styles/responsive.css">

</head>

<body>
<%
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	
	 if(session.getAttribute("doctor")==null)
	 {
		 response.sendRedirect("/doctor/signin");
	 }
	%>
	<!-- Preloader -->
	<div class="preloader">
		<div class="loader">
			<div class="loader-outter"></div>
			<div class="loader-inner"></div>

			<div class="indicator">
				<svg width="16px" height="12px">
                    <polyline id="back"
						points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                    <polyline id="front"
						points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                </svg>
			</div>
		</div>
	</div>

	<header class="header">

		<div class="header-inner">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-12">
							<div class="logo">
								<a href="index.html"><img src="/img/KceLogo.png" alt="#"
									height="50px" width="50px"></a>
								<h4>Karpagam</h4>
							</div>
							<div class="mobile-nav"></div>
						</div>
						<div class="col-lg-7 col-md-9 col-12">
							<!-- Main Menu -->
							<div class="main-menu">
								<nav class="navigation">
									<ul class="nav menu">
										<li><a href="/doctor/home">Home </i></a></li>
										<li class="active"><a href="/doctor/home">Services <i
												class="icofont-rounded-down"></i>
										</a>
											<form action="/doctor/ViewDepartment">
												<ul class="dropdown service_details">
													<%
													List<String> li = (List<String>) session.getAttribute("departmentList");
													%>
													<%
													for (String s : li) {
													%>
													<li><button class="dept_name_btn" name="department"
															value="<%=s%>">
															<%=s%></button></li>
													<%
													}
													%>
												</ul>
											</form></li>

										<li><a href="#">Consulted Appoinment <i
												class="icofont-rounded-down"></i></a></li>


										</li>
									</ul>
								</nav>
							</div>
							<!--/ End Main Menu -->
						</div>
						<div class="col-lg-2 col-12 profile_btn">
							<div class="get-quote">
								<a href="appointment.html" class="btn">View Appointment</a>
							</div>
							<div class="get-quote">
								<form action="/doctor/logout">
									<button  class="btn">Logout</button>
									</form>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Header Inner -->
	</header>

	<form action="/doctor/postpone" method="post">
		<div class="container Postpone_byDoctor p-4"
			id="PostponeAppointment_byDoctor">
			<div class="row  border_postpone">
				<div class="col-lg-4 col-sm-12 col-md-8 p-2">
					<h4 id="postpone_name">Postpone</h4>
					<div class="text-center p-4 Postpone_div">
						<!-- <span id="close_icon">x</span> -->
						<div class="postpone_date">
							<label for="">PostPone Date</label> <input type="date"
								name="date" id="">
						</div>
						<div class="postpone_time">
							<label for="">PostPone Time</label> <input type="time"
								name="time">
						</div>
						<button class="btn-primary p-2 ml-5" name="id"
							value="<%=request.getAttribute("id")%>">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Footer Area -->
	<footer id="footer" class="footer pt-5">
		<!-- Footer Top -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-footer">
							<h2>About Us</h2>
							<p>"Enhance healthcare coordination and accessibility with a
								comprehensive system enabling patient-doctor appointment
								scheduling, medical record access, and personalized
								notifications."</p>
							<!-- Social -->
							<ul class="social">
								<li><a href="#"><i class="icofont-facebook"></i></a></li>
								<li><a href="#"><i class="icofont-google-plus"></i></a></li>
								<li><a href="#"><i class="icofont-twitter"></i></a></li>
								<li><a href="#"><i class="icofont-instagram"></i></a></li>
								<li><a href="#"><i class="icofont-pinterest"></i></a></li>
							</ul>
							<!-- End Social -->
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-footer f-link">
							<h2>Quick Links</h2>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<ul>
										<li><a href="/doctor/validateSignIn"><i
												class="fa fa-caret-right" aria-hidden="true"></i>Home</a></li>
										<li><a href="/doctor/validateSignIn"><i
												class="fa fa-caret-right" aria-hidden="true"></i>Doctors</a></li>
										<li><a href="/doctor/validateSignIn"><i
												class="fa fa-caret-right" aria-hidden="true"></i>Services</a></li>
										<li><a href="/doctor/viewAppoinment"><i
												class="fa fa-caret-right" aria-hidden="true"></i>Consulted
												Appoinments</a></li>
									</ul>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<ul>
										<li><a href="/doctor/viewAppoinment"><i
												class="fa fa-caret-right" aria-hidden="true"></i>Today
												Appointments</a></li>
										<li><a href="#"><i class="fa fa-caret-right"
												aria-hidden="true"></i>Emergency</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-footer">
							<h2>Open Hours</h2>
							<p>Hospitality Duration</p>
							<ul class="time-sidual">
								<li class="day">Monday - Friday <span>8.00-20.00</span></li>
								<li class="day">Saturday <span>9.00-18.30</span></li>
								<li class="day">Sunday <span>9.00-15.00</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-footer">
							<h2>Comments</h2>
							<p>Please enter your comments below, including any details
								you'd like to include. If you have an email address you'd like
								to provide for further communication, please include it as well.</p>
							<form action="mail/mail.php" method="get" target="_blank"
								class="newsletter-inner">
								<input name="email" placeholder="Email Address"
									class="common-input" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Your email address'" required=""
									type="email">
								<button class="button">
									<i class="icofont icofont-paper-plane"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Footer Top -->
		<!-- Copyright -->
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-12">
						<div class="copyright-content">
							<p>� Copyright 2024 | All Rights Reserved by CS/IT</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Copyright -->
	</footer>
	<!--/ End Footer Area -->

	<!-- jquery Min JS -->
	<script src="/js/jquery.min.js"></script>
	<!-- jquery Migrate JS -->
	<script src="/js/jquery-migrate-3.0.0.js"></script>
	<!-- jquery Ui JS -->
	<script src="/js/jquery-ui.min.js"></script>
	<!-- Easing JS -->
	<script src="/js/easing.js"></script>
	<!-- Color JS -->
	<script src="/js/colors.js"></script>
	<!-- Popper JS -->
	<script src="/js/popper.min.js"></script>
	<!-- Bootstrap Datepicker JS -->
	<script src="/js/bootstrap-datepicker.js"></script>
	<!-- Jquery Nav JS -->
	<script src="/js/jquery.nav.js"></script>
	<!-- Slicknav JS -->
	<script src="/js/slicknav.min.js"></script>
	<!-- ScrollUp JS -->
	<script src="/js/jquery.scrollUp.min.js"></script>
	<!-- Niceselect JS -->
	<script src="/js/niceselect.js"></script>
	<!-- Tilt Jquery JS -->
	<script src="/js/tilt.jquery.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="/js/owl-carousel.js"></script>
	<!-- counterup JS -->
	<script src="/js/jquery.counterup.min.js"></script>
	<!-- Steller JS -->
	<script src="/js/steller.js"></script>
	<!-- Wow JS -->
	<script src="/js/wow.min.js"></script>
	<!-- Magnific Popup JS -->
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<!-- Counter Up CDN JS -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- Main JS -->
	<script src="/js/main.js"></script>

	</script>
</body>

</html>