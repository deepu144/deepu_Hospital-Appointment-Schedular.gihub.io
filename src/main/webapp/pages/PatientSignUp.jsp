<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign up</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="styles/PatientSignUp.css">
  <script src="https://kit.fontawesome.com/0394c808be.js" crossorigin="anonymous"></script>
</head>
<body>

<% String invalid = (String)session.getAttribute("invalid"); %>
<% if(invalid!=null) {%>
	<% if(invalid.equals("yes")) { %>
		<% System.out.println("INVALID DETAILS..........."); %>
		<!--ENTER VALID DETAILS -->
		<div class="pop_alert text-center">
        Enter Valid Details ! <span ><i class="fa-solid fa-xmark"></i></span>
    </div>
		<% session.removeAttribute("invalid"); %>
	<% } %>
<% } %>

<% String exists = (String)session.getAttribute("exist"); %>
<% if(exists!=null) {%>
	<% if(exists.equals("yes")) { %>
		<% System.out.println("Try another mail , user already exists..........."); %>
		<!--ENTER VALID DETAILS -->
		<div class="pop_alert text-center">
        User Aleady Exists ! <span ><i class="fa-solid fa-xmark"></i></span>
    </div>
		<% session.removeAttribute("exist"); %>
	<% } %>
<% } %>

<!-- Navbar-->
<header class="header">
  <nav class="navbar navbar-expand-lg navbar-light py-3">
      <div class="container">
          <!-- Navbar Brand -->
          <a href="#" class="navbar-brand Hospital_nav">
              <img src="img/KceLogo.png" alt="logo" width="150" height="150px">
              <h1>Karpagam Hospital</h1>
          </a>
      </div>
      <div class="header_content_login">
        <div class="text-center pl-3 pt-5">Sign up</div>
      </div>
  </nav>
</header>


<div class="container Hospital_login_body">
  <div class="row py-5 mt-4 align-items-center">
      <!-- For Demo Purpose -->
      <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
          <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
          <h1>Create an Account</h1>
          <p class="font-italic text-muted mb-0">Good health and good sense are two of life’s</p>
          <p class="font-italic text-muted"> greatest blessings. 
               
          </p>
      </div>
        
      <!-- Registeration Form -->
      <div class="col-md-7 col-lg-6 ml-auto">
        
          <form action="validateSignUp" method="post">
              <div class="row">

                  <!-- First Name -->
                  <div class="input-group col-lg-6 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa fa-user text-muted"></i>
                          </span>
                      </div>
                      <input id="firstName" type="text" name="fname" placeholder="First Name" class="form-control bg-white border-left-0 border-md">
                  </div>

                  <!-- Last Name -->
                  <div class="input-group col-lg-6 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa fa-user text-muted"></i>
                          </span>
                      </div>
                      <input id="lastName" type="text" name="lname" placeholder="Last Name" class="form-control bg-white border-left-0 border-md">
                  </div>

                  <!-- Email Address -->
                  <div class="input-group col-lg-12 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa fa-envelope text-muted"></i>
                          </span>
                      </div>
                      <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white border-left-0 border-md">
                  </div>

                  <!-- Phone Number -->
                  <div class="input-group col-lg-12 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa fa-phone-square text-muted"></i>
                          </span>
                      </div>
                      <select id="countryCode" name="countryCode" style="max-width: 80px" class="custom-select form-control bg-white border-left-0 border-md h-100 font-weight-bold text-muted">
                          <option value="">+91</option>
                          
                      </select>
                      <input id="phoneNumber" type="tel" name="number" placeholder="Phone Number" class="form-control bg-white border-md border-left-0 pl-3">
                  </div>.


                  <!-- dob -->
                 <div class="dob_gender">
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted"></i>
                            </span>
                        </div>
                        <input id="dob" type="number" name="age" placeholder="Age" class="form-control bg-white border-left-0 border-md">
                    </div>
                      <div class="input-group col-lg-6 mb-4">
                          <div class="input-group-prepend">
                              <span class="input-group-text bg-white px-4 border-md border-right-0">
                                  <i class="fa fa-black-tie text-muted"></i>
                              </span>
                          </div>
                          <select id="gender" name="gender" class="form-control custom-select bg-white border-left-0 border-md">
                              <option value="">Gender</option>
                              <option value="">Male</option>
                              <option value="">Female</option>
                              <option value="">Others</option>
                             
                          </select>
                      </div>
                 </div>
                 <div class="country_state">
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa-solid fa-earth-americas"></i>
                            </span>
                        </div>
                        <input id="country" type="text" name="country" placeholder="country" class="form-control bg-white border-left-0 border-md">
                    </div>
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa-solid fa-flag-usa"></i>
                            </span>
                        </div>
                        <input id="state" type="text" name="state" placeholder="State" class="form-control bg-white border-left-0 border-md">
                    </div>
                 </div>
               <div class="city_pincode">
                <div class="input-group col-lg-6 mb-4">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-white px-4 border-md border-right-0">
                            <i class="fa-solid fa-city"></i>
                        </span>
                    </div>
                    <input id="city" type="text" name="city" placeholder="City " class="form-control bg-white border-left-0 border-md">
                </div>
                <div class="input-group col-lg-6 mb-4">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-white px-4 border-md border-right-0">
                            <i class="fa-solid fa-hashtag"></i>
                        </span>
                    </div>
                    <input id=" pincode" type="number" name="pincode" placeholder="Pincode" class="form-control bg-white border-left-0 border-md">
                </div>

               </div>

                  <!-- Password -->
                  <div class="input-group col-lg-6 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa-solid fa-key"></i>
                          </span>
                      </div>
                      <input id="password" type="password" name="password1" placeholder="Password" class="form-control bg-white border-left-0 border-md">
                  </div>

                  <!-- Password Confirmation -->
                  <div class="input-group col-lg-6 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa-solid fa-key"></i>
                          </span>
                      </div>
                      <input id="passwordConfirmation" type="text" name="password2" placeholder="Confirm Password" class="form-control bg-white border-left-0 border-md">
                  </div>


               
                  <!-- Submit Button -->
                  <div class="form-group col-lg-12 mx-auto mb-0">
                      <button class="btn btn-success btn-block py-2">
                          <span class="font-weight-bold">Create your account</span>
                      </button>
                  </div>
                  
                  <!-- Already Registered -->
                  <div class="text-center w-100">
                      <p class="text-muted font-weight-bold">Already Registered? <a href="signin" class="text-primary ml-2">Login</a></p>
                  </div>

              </div>
          </form>
      </div>
  </div>
</div>

</body>
</html>