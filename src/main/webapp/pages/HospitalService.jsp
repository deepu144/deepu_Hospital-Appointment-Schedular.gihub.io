<%@page import="com.karpagam.hospital.model.Doctor"%>
<%@page import="com.karpagam.hospital.model.Department"%>
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
		
		<script src="https://kit.fontawesome.com/e96d258b08.js" crossorigin="anonymous"></script>

		<!-- Title -->
        <title>Hospital Service</title>
		
		<!-- Favicon -->
        <link rel="icon" href="/img/Kcelogo.png">
		
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
									<a href="index.html"><img src="/img/KceLogo.png" alt="#" height="50px" width="50px"></a>
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
											<li><a href="/patientService">Doctos </a></li>
											<li class="active"><a href="/patientService">Services <i class="icofont-rounded-down"></i> </a>
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
											<li><a href="contact.html">Contact Us</a>
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
										<a href="/patienthome" class="btn">Get Appointment</a>
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
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed nisl pellentesque, faucibus libero eu, gravida quam. </p>
									<div class="button">
										<a href="/patienthome" class="btn">Get Appointment</a>
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
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed nisl pellentesque, faucibus libero eu, gravida quam. </p>
									<div class="button">
										<a href="/patienthome" class="btn">Get Appointment</a>
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
	 

		<!-- Start Feautes -->
		 <% Department dept = (Department)request.getAttribute("overView"); %>
		<div class="container pt-5 mb-0">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2><%= dept.getDepartment()+"  "+"Overview" %></h2>
                        <!-- <img src="img/section-img.png" alt="#"> -->
                        <p><%= dept.getOverView() %></p>
                    </div>
                </div>
            </div>
        </div>
		 
		
		<!-- Start service -->
		<section class="services section pt-1">
			<div class="container ">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2> Team Of Doctors</h2>
							<!-- <img src="img/section-img.png" alt="#"> -->
							<!-- <p>Lorem ipsum dolor sit amet consectetur adipiscing elit praesent aliquet. pretiumts Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam dolorem eius totam distinctio deserunt reprehenderit consequatur fugit cupiditate repudiandae fugiat. Eos perferendis repellat minima quidem nam exercitationem nulla animi ut!</p> -->
						</div>
					</div>
				</div>
				<% List<Doctor> docList = (List<Doctor>) request.getAttribute("DoctorList"); %>
				<form action="/viewDoctor">
				<div class="row">
				
					<% for(Doctor doc : docList) {%>
						<div class="col-lg-4 col-md-12 col-12">
	                        <!-- Start Single Service -->
	                        <div class="doctor_info">
	                            <div class="doctor_img">
	                                <img src=<%= doc.getDoctorLink().trim() %> alt="abc" class="doctor_image img-fluid custom-img">
	                            </div>
	                            <div class="doctor_details" style="margin-left: 25px;">
	                                <div class="doctor_name"  style="margin-top: 15px;">
	                                   <button id="doctor_name_id" class="dept_name_btn" name="doctorId" value="<%= doc.getId() %>" ><%= doc.getName() %></button> 
	                                </div>
	                                <div class="doctor_degree">
	                                    <%= doc.getDegeree() %>
	                                    <br>
	                                    <%="Consultant Medical "+dept.getDepartment() %>
	                                </div>
	                                
	                            </div>
	                        </div>
	                        <!-- End Single Service -->
	                    </div>
                    <% } %>
                    					 
				</div>
				</form>
			</div>
		</section>
	 
		 
		
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
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>About Us</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Services</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Doctors</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Emergency</a></li>	
										</ul>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
										 
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Book Appoinment</a></li>
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
								<form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
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
    </body>
</html>