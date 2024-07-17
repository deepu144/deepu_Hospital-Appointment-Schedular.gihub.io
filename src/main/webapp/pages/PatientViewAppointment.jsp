<%@page import="com.karpagam.hospital.model.Appointment"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script defer>
	 
    document.getElementById("postpone").addEventListener("click", function () {
        var closeIcon = document.getElementById("close_icon");
        var container = document.getElementById("PostponeAppointment");
        document.getElementById("PostponeAppointment").style.display="block"

        closeIcon.addEventListener("click", function () {
            container.style.display = "none";
        });
    });
 
  </script>
	<script src="https://kit.fontawesome.com/e96d258b08.js" crossorigin="anonymous"></script>

	<!-- Title -->
	<title>Patient ViewAppointment</title>

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
	<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); %>
	<% if(session.getAttribute("user")==null) {%>
			<jsp:forward page="/signin"/>
	<% } %>
	<!-- Preloader -->
	<div class="preloader">
		<div class="loader">
			<div class="loader-outter"></div>
			<div class="loader-inner"></div>

			<div class="indicator">
				<svg width="16px" height="12px">
					<polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
					<polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
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
								<a href="index.html"><img
										src="/img/KceLogo.png"
										alt="#" height="50px" width="50px"></a>
								<h4>Karpagam</h4>
							</div>
							<div class="mobile-nav"></div>
						</div>
						<div class="col-lg-7 col-md-9 col-12">
							<!-- Main Menu -->
							<div class="main-menu">
								<nav class="navigation">
									<ul class="nav menu">
										<li><a href="/patienthome">Home</a>
										</li>
										<li><a href="/patientService">Doctors </a></li>
											<li><a href="/patientService">Services <i class="icofont-rounded-down"></i> </a>
												<form action="HospitalService">
												<ul class="dropdown service_details">
													<% List<String> li = (List<String>) session.getAttribute("departmentList"); %>
													<% for(String s : li) {%>
														<li><button class="dept_name_btn" name="department" value="<%= s %>"> <%= s %></button></li>
													<% } %>
												</ul>
											</form>
											</li>

										<li><a href="#">Emergency <i class="icofont-rounded-down"></i></a>
											<ul class="dropdown">
												<li><a href="blog-single.html">Call Ambulance</a></li>
											</ul>
										</li>
										<li><a href="contact.html">Contact Us</a>

										</li>
									</ul>
								</nav>
							</div>
							<!--/ End Main Menu -->
						</div>
						<div class="col-lg-2 col-12">
							<div class="get-quote">
								<a href="#appointment_id" class="btn">Book Appointment</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Header Inner -->
	</header>
         <div class="container Postpone p-4" id="PostponeAppointment">
		<div class="row">
			<div class="col-lg-4 col-sm-12 col-md-8 p-2">
				<h4 id="postpone_name">Postpone</h4>
				<div class="text-center p-4 Postpone_div">
					<span id="close_icon">x</span>
					<div class="postpone_date">
						<label for="">PostPone Date</label>
						<input type="date" name="postpone_date" id="">
					</div>
					<div class="postpone_time">
						<label for="">PostPone Time</label>
						<input type="time" name="postpone_time">
					</div>
					<button class="btn-primary p-2 ml-5">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Header Area -->
	<h4 class="text-center pt-5">Recent Appoinments</h4>

	<div class="container-fluid">
		
		<div class="row  ">
			<div class="col-12 col-lg-10 col-sm-10 col-md-10 text-center  mx-auto pt-5">
			<% List<Appointment> rApp = (List<Appointment>) request.getAttribute("AllAppointment"); %>
				<form action="cancelAppoinment" method="post">
				<table class="table table-striped text-dark">
					<thead>
						<tr>
							<th>Appoinment Id</th>
							<th>Doctor</th>
							<th>Department</th>
							<th>Date</th>
							<th>Timing</th>
							<th>Status</th>
							<th>Edit</th>

						</tr>
					</thead>
					<tbody>
						<% for(Appointment a : rApp) { %>
							<tr>
									<td><%= a.getId() %></td>
									<td><%= a.getDoctorName() %></td>
									<td><%= a.getDepartment() %></td>
									<td><%= a.getDate() %></td>
									<td><%= a.getFromTime()+ " - " +a.getToTime() %></td>
									<td><%= a.getStatus() %></td>
									<td><button class="btn-danger p-2" name="cancelId" value="<%=a.getId()%>">Cancel</button></td>
	 						</tr>
						<% } %>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>

<h4 class="text-center pt-5">Appoinment History</h4>

	<div class="container-fluid">

		<div class="row  ">
			<div class="col-12 col-lg-10 col-sm-10 col-md-10 text-center  mx-auto pt-5">
			<% List<Appointment> his = (List<Appointment>) request.getAttribute("AppoinmentHistory"); %>
				<form action="#">
				<table class="table table-striped text-dark">
					<thead>
						<tr>
							<th>Appoinment Id</th>
							<th>Doctor</th>
							<th>Department</th>
							<th>Date</th>
							<th>Timing</th>
							<th>Status</th>

						</tr>
					</thead>
					<tbody>
						<% for(Appointment a : his) { %>
						<tr>
								<td><%= a.getId() %></td>
								<td><%= a.getDoctorName() %></td>
								<td> <%= a.getDepartment() %></td>
								<td><%= a.getDate() %></td>
								<td><%= a.getFromTime()+" - "+a.getToTime() %></td>
								
								<% if(a.getStatus().equalsIgnoreCase("Cancelled")) {%>
									<td><div class="btn-danger p-2"><%= a.getStatus() %></div> </td>							
								<% }else { %>
									<td><div class="btn-success p-2"><%= a.getStatus() %></div> </td>
								<% } %>							 
 						</tr>
						<% } %>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>


	<!-- Start Appointment -->
	<section class="appointment" id="appointment_id">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>We Are Always Ready to Help You. Book An Appointment</h2>
						<img src="img/section-img.png" alt="#">

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-12">
					<form class="form" action="#">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<input name="name" type="text" placeholder="Name" required>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<input name="email" type="email" placeholder="Email" required>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<input name="phone" type="text" placeholder="Phone" required>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<select  name="department"class="nice-select form-control wide current" tabindex="0" >
												<option selected>Department</option>								
													<% for(String s : li) {%>
														<option value="<%=s%>"><%= s %></option>
													<% } %>											 
											</select>
								</div>
							</div>

							<div class="col-lg-12 col-md-6 col-12">
								<div class="form-group">
									<input type="text" placeholder="Date" id="datepicker" required>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-12">
								<div class="form-group">
									<textarea name="message" placeholder="Write Your Message Here....." required></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5 col-md-4 col-12">
								<div class="form-group">
									<div class="button">
										<button type="submit" class="btn">Book An Appointment</button>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-8 col-12">
								<p>( We will be confirm by an Text Message )</p>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-6 col-md-12 ">
					<div class="appointment-image">
						<img src="img/contact-img.png" alt="#">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Appointment -->



	<!-- Footer Area -->
	<footer id="footer" class="footer ">
		<!-- Footer Top -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-footer">
							<h2>About Us</h2>
							<p>"Enhance healthcare coordination and accessibility with a comprehensive system enabling
								patient-doctor appointment scheduling, medical record access, and personalized
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
										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a>
										</li>
										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>About Us</a>
										</li>
										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Services</a>
										</li>
										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Doctors</a>
										</li>
										<li><a href="#"><i class="fa fa-caret-right"
													aria-hidden="true"></i>Emergency</a></li>
									</ul>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<ul>

										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Book
												Appoinment</a></li>
										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>FAQ</a></li>
										<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact
												Us</a></li>
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
							<p>
								Please enter your comments below, including any details you'd like to include. If you
								have an email address you'd like to provide for further communication, please include it
								as well.</p>
							<form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
								<input name="email" placeholder="Email Address" class="common-input"
									onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your email address'"
									required="" type="email">
								<button class="button"><i class="icofont icofont-paper-plane"></i></button>
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
							<p>© Copyright 2024 | All Rights Reserved by CS/IT </p>
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
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- Main JS -->
    <script src="/js/main.js"></script>
		 
	
</body>

</html>