<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@page import="com.karpagam.hospital.service.Administator"%>
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
		
		<script src="https://kit.fontawesome.com/e96d258b08.js" crossorigin="anonymous"></script>

		<!-- Title -->
        <title>Patient Home</title>
		
		<!-- Favicon -->
        <link rel="icon" href="img/Kcelogo.png">
		
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

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
		<header class="header" >
			 
			<div class="header-inner">
				<div class="container">
					<div class="inner">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-12">
								<div class="logo">
									<a href="index.html"><img src="img/KceLogo.png" alt="#" height="50px" width="50px"></a>
									<h4>Karpagam</h4>
								</div>
								<div class="mobile-nav"></div>
							</div>
							<div class="col-lg-7 col-md-9 col-12">
								<!-- Main Menu -->
								<div class="main-menu">
									<nav class="navigation">
										<ul class="nav menu">
											<li class="active"><a href="/patienthome">Home</a>
												 
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
													<li><a href="#">Call Ambulance</a></li>
												</ul>
											</li>
											<li><a href="#">Contact Us</a>
												 
											</li>
										</ul>
									</nav>
								</div>
								<!--/ End Main Menu -->
							</div>
							<div class="col-lg-2 col-12 profile_btn">
								<div class="get-quote">
									<% if(session.getAttribute("user")==null) {%>
										<a href="/signin" class="btn">View Appointment</a>
									<% }else { %>
										<a href="/ViewAppointment" class="btn">View Appointment</a>
									<% } %>
								</div>
								<% if(session.getAttribute("user")!=null) {%>
									<div class="get-quote">
										<a href="/patientprofile" class="btn"> <i class="icofont icofont-ui-user"></i>  </a>
									</div>
								<% }else{ %>
									<div class="get-quote">
										<a href="/signin" class="btn"> Login </a>
									</div>
								<% } %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Header Inner -->
		</header>
		<!-- End Header Area -->
		
		<!-- Slider Area -->
		<section class="slider">
			<div class="hero-slider">
				<!-- Start Single Slider -->
				<div class="single-slider" style="background-image:url('img/slider2.jpg')">
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="text">
									<h1>We Provide <span>Medical</span> Services That You Can <span>Trust!</span></h1>
									<p>Good health and good sense are two of life’s greatest blessings. </p>
									<div class="button">
										<% if(session.getAttribute("user")==null) {%>
											<a href="/signin" class="btn">Get Appointment</a>
										<% }else { %>
											<a href="#bookAppointment-block" class="btn">Get Appointment</a>
										<% } %>
										<a href="#" class="btn primary">Learn More</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Single Slider -->
				<!-- Start Single Slider -->
				<div class="single-slider" style="background-image:url('img/slider.jpg')">
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="text">
									<h1>We Provide <span>Medical</span> Services That You Can <span>Trust!</span></h1>
									<p>Good health and good sense are two of life’s greatest blessings. </p>
									<div class="button">
										<% if(session.getAttribute("user")==null) {%>
											<a href="/signin" class="btn">Get Appointment</a>
										<% }else { %>
											<a href="#bookAppointment-block" class="btn">Get Appointment</a>
										<% } %>
										<a href="#" class="btn primary">About Us</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Start End Slider -->
				<!-- Start Single Slider -->
				<div class="single-slider" style="background-image:url('img/slider3.jpg')">
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="text">
									<h1>We Provide <span>Medical</span> Services That You Can <span>Trust!</span></h1>
									<p>Good health and good sense are two of life’s greatest blessings. </p>
									<div class="button">
										<% if(session.getAttribute("user")==null) {%>
											<a href="/signin" class="btn">Get Appointment</a>
										<% }else { %>
											<a href="#bookAppointment-block" class="btn">Get Appointment</a>
										<% } %>
										<a href="#" class="btn primary">Conatct Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Single Slider -->
			</div>
		</section>
		<!--/ End Slider Area -->
		
		<!-- Start Schedule Area -->
		<section class="schedule">
			<div class="container">
				<div class="schedule-inner">
					<div class="row">
						<div class="col-lg-4 col-md-6 col-12 ">
							<!-- single-schedule -->
							<div class="single-schedule first">
								<div class="inner">
									<div class="icon">
										<i class="fa fa-ambulance"></i>
									</div>
									<div class="single-content">
									 
										<h4>Blood Donation</h4>
										<p>
											Donating blood: a simple yet profound gesture that can save lives and make a significant impact on healthcare.</p>
										<a href="http://www.blooddonors.gov.in/">LEARN MORE<i class="fa fa-long-arrow-right"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-12">
							<!-- single-schedule -->
							<div class="single-schedule middle">
								<div class="inner">
									<div class="icon">
										<i class="icofont-prescription"></i>
									</div>
									<div class="single-content">
									 
										<h4>Find Hospital</h4>
										<p>
											Find hospitals on Google Maps to locate nearby medical facilities and services quickly.</p>
										<a href="https://www.google.co.in/maps/place/Karpagam+Hospital/@10.8839956,77.0044891,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba85aaaedfbba6f:0xc9f8d55c7c27b355!8m2!3d10.8839956!4d77.007064!16s%2Fg%2F1hc2kczv_?entry=ttu">LEARN MORE<i class="fa fa-long-arrow-right"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-12">
							<!-- single-schedule -->
							<div class="single-schedule last">
								<div class="inner">
									<div class="icon">
										<i class="icofont-ui-clock"></i>
									</div>
									<div class="single-content">
									 
										<h4>Opening Hours</h4>
										<ul class="time-sidual">
											<li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
											<li class="day">Saturday <span>9.00-18.30</span></li>
											<li class="day">Sunday <span>9.00-15.00</span></li>
										</ul>
										<a href="https://www.google.co.in/maps/place/Karpagam+Hospital/@10.8839956,77.0044891,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba85aaaedfbba6f:0xc9f8d55c7c27b355!8m2!3d10.8839956!4d77.007064!16s%2Fg%2F1hc2kczv_?entry=ttu">LEARN MORE<i class="fa fa-long-arrow-right"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/End Start schedule Area -->

		<!-- Start Feautes -->
		<section class="Feautes section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>We Are Always Ready to Help You & Your Family</h2>
							<img src="img/section-img.png" alt="#">
							<p>"Within these walls, compassion is the heartbeat of healing, and caring hands guide the path to recovery."</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-12">
						<!-- Start Single features -->
						<div class="single-features">
							<div class="signle-icon">
								<i class="icofont icofont-ambulance-cross"></i>
							</div>
							<h3>Emergency Help</h3>
							<p>"When every second counts, know that we're here, ready to lend a helping hand and bring comfort in times of uncertainty."</p>
						</div>
						<!-- End Single features -->
					</div>
					<div class="col-lg-4 col-12">
						<!-- Start Single features -->
						<div class="single-features">
							<div class="signle-icon">
								<i class="icofont icofont-medical-sign-alt"></i>
							</div>
							<h3>Enriched Pharmecy</h3>
							<p>"Empowering health through our enriched pharmacy, where every prescription is a promise of care and well-being."</p>
						</div>
						<!-- End Single features -->
					</div>
					<div class="col-lg-4 col-12">
						<!-- Start Single features -->
						<div class="single-features last">
							<div class="signle-icon">
								<i class="icofont icofont-stethoscope"></i>
							</div>
							<h3>Medical Treatment</h3>
							<p>"Providing exemplary medical treatment, where expertise meets compassion, ensuring every patient's journey to wellness is supported with dignity and care."</p>
						</div>
						<!-- End Single features -->
					</div>
				</div>
			</div>
		</section>
		<!--/ End Feautes -->
		
		<!-- Start Fun-facts -->
		<div id="fun-facts" class="fun-facts section overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Start Single Fun -->
						<div class="single-fun">
							<i class="icofont icofont-home"></i>
							<div class="content">
								<span class="counter">3468</span>
								<p>Hospital Rooms</p>
							</div>
						</div>
						<!-- End Single Fun -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Start Single Fun -->
						<div class="single-fun">
							<i class="icofont icofont-user-alt-3"></i>
							<div class="content">
								<span class="counter">557</span>
								<p>Specialist Doctors</p>
							</div>
						</div>
						<!-- End Single Fun -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Start Single Fun -->
						<div class="single-fun">
							<i class="icofont-simple-smile"></i>
							<div class="content">
								<span class="counter">4379</span>
								<p>Happy Patients</p>
							</div>
						</div>
						<!-- End Single Fun -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Start Single Fun -->
						<div class="single-fun">
							<i class="icofont icofont-table"></i>
							<div class="content">
								<span class="counter">32</span>
								<p>Years of Experience</p>
							</div>
						</div>
						<!-- End Single Fun -->
					</div>
				</div>
			</div>
		</div>
 
		 
		<!-- Start service -->
		<section class="services section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>We Offer Different Services To Improve Your Health</h2>
							<img src="img/section-img.png" alt="#">
							<!-- <p>Lorem ipsum dolor sit amet consectetur adipiscing elit praesent aliquet. pretiumts</p> -->
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-prescription"></i>
							<h4>General Treatment</h4>
							<p>General treatment at our hospital offers comprehensive care for diverse health needs, ensuring patients receive personalized attention and effective solutions.</p>	
						</div>
						<!-- End Single Service -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-drug-pack"></i>
							<h4>Anesthesiology</h4>
							<p>"Anesthesiology ensures patient comfort and safety through expert pain management and sedation during surgical procedures." </p>	
						</div>
						<!-- End Single Service -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-tooth"></i>
							<h4>Dentistry</h4>
							<p>"Dentistry focuses on oral health, offering preventive, diagnostic, and treatment services for optimal dental well-being."</p>	
						</div>
						<!-- End Single Service -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-listening"></i>
							<h4>ENT</h4>
							<p>"ENT specializes in the diagnosis and treatment of ear, nose, and throat conditions, ensuring optimal hearing, breathing, and overall wellness." </p>	
						</div>
						<!-- End Single Service -->
					</div>
					
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-heart-beat"></i>
							<h4>Cardiology</h4>
							<p>"Cardiology is the medical specialty dedicated to diagnosing, treating, and preventing heart-related conditions, ensuring cardiovascular health and well-being." </p>	
						</div>
						<!-- End Single Service -->
					</div>
					
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-blood-test"></i>
							<h4>Diabetology</h4>
							<p>"Diabetology specializes in the comprehensive management and treatment of diabetes, aiming to improve patient outcomes and quality of life through personalized care and education."</p>	
						</div>
						<!-- End Single Service -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-brain"></i>
							<h4>Neurology</h4>
							<p>"Neurology explores the intricate workings of the nervous system, diagnosing and treating disorders to enhance neurological health and quality of life." </p>	
						</div>
						<!-- End Single Service -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-eye"></i>
							<h4>Opthalmology</h4>
							<p>"Ophthalmology is the medical specialty dedicated to the diagnosis, treatment, and management of eye disorders, preserving vision and enhancing ocular health." </p>	
						</div>
						<!-- End Single Service -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Service -->
						<div class="single-service">
							<i class="icofont icofont-eye"></i>
							<h4>Neurology</h4>
							<p>Neurology focuses on diagnosing and treating disorders of the nervous system, including the brain, spinal cord, nerves, and muscles. </p>	
						</div>
						<!-- End Single Service -->
					</div>
				</div>
			</div>
		</section>
		<!--/ End service -->
		
		 
		
		<!-- Start Appointment -->
		<section class="appointment" id="bookAppointment-block">
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
						<form class="form" action="BookAppointment" method="post">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input name="name" type="text" placeholder="Name" required>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input name="email" type="email" placeholder="Email" required ">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input name="number" type="text" placeholder="Phone" required>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">										
											<select  name="department"class="nice-select form-control wide current" tabindex="0" required >
												<option selected>Department</option>								
													<% for(String s : li) {%>
														<option value="<%=s%>"><%= s %></option>
													<% } %>											 
											</select>										
									</div>
								</div>
						 
								<div class="col-lg-12 col-md-6 col-12">
									<div class="form-group">
										<input name="date" type="text" placeholder="Date" id="datepicker" required>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-12">
									<div class="form-group">
										<textarea name="comment" placeholder="Write Your Message Here....." required></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-5 col-md-4 col-12">
									<div class="form-group">
										<div class="button">
											<button class="btn">Book An Appointment</button>
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
								<p>"Enhance healthcare coordination and accessibility with a comprehensive system enabling patient-doctor appointment scheduling, medical record access, and personalized notifications."</p>
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
											<li><a href="/patienthome"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>About Us</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Services</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Doctors</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Emergency</a></li>	
										</ul>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
										 
											<li><a href="#bookAppointment-block"><i class="fa fa-caret-right" aria-hidden="true"></i>Book Appoinment</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>FAQ</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact Us</a></li>	
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
									Please enter your comments below, including any details you'd like to include. If you have an email address you'd like to provide for further communication, please include it as well.</p>
								<form action="" method="get" target="_blank" class="newsletter-inner">
									<input name="email" placeholder="Email Address" class="common-input" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Your email address'" required="" type="email">
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
								<p>© Copyright 2024  |  All Rights Reserved by  CS/IT </p>
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
		<script>
        	const today = new Date().toISOString().split('T')[0];
        	document.getElementById('datepickerr').setAttribute('min', today);
        </script>
    </body>
</html>