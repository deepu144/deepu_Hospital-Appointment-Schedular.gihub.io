<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="/styles/PatientSignIn.css">
</head>
<body>


<% String signUpStatus = (String)session.getAttribute("success"); %>
<% if(signUpStatus!=null) {%>
	<% if(signUpStatus.equals("yes")) {%>
	<div class="pop_alert_success text-center">
        Registered Successfully ! <span ><i class="fa-solid fa-xmark"></i></span>
    </div>
		<!-- SIGNUP SUCCESS -->
		<% session.removeAttribute("success"); %>
	<% } %>
<% } %>

<% String invalid = (String)session.getAttribute("invalid"); %>
<% if(invalid!=null) {%>
	<% if(invalid.equals("passwordWrong")) {%>
	<div class="pop_alert_error text-center">
        Password Incorrect ! <span ><i class="fa-solid fa-xmark"></i></span>
    </div>
		<!-- PASSWORD WRONG -->
	<% }else if(invalid.equals("notFound")) {%>
	<div class="pop_alert_error text-center">
        Opps! User Not Found <span ><i class="fa-solid fa-xmark"></i></span>
    </div>
		<!-- USER NOT FOUND -->
	<% } %>
	<% session.removeAttribute("invalid"); %>
<% } %>



<!-- Navbar-->
<header class="header">
  <nav class="navbar navbar-expand-lg navbar-light py-3">
      <div class="container">
          <!-- Navbar Brand -->
          <a href="#" class="navbar-brand Hospital_nav">
              <img src="/img/KceLogo.png" alt="logo" width="150" height="150px">
              <h1>Karpagam Hospital</h1>
          </a>
      </div>
       
  </nav>
</header>


<div class="container Hospital_login_body">
  <div class="row py-5 mt-4 align-items-center">
      <!-- For Demo Purpose -->
      <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
          <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
          <h3>Already has Account</h3>
          <p class="font-italic text-muted mb-0">Good health and good sense are two of life’s</p>
          <p class="font-italic text-muted"> greatest blessings. 
               
          </p>
      </div>
        
      <!-- Registeration Form -->
      <div class="col-md-7 col-lg-6 ml-auto">
        
          <form action="validateSignIn" method="post">
              <div class="row">

                <div class="header_content_login">
                    <h3 class="text-center p-5">Login</h3>
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
				  <!-- Password -->
                  <div class="input-group col-lg-12 mb-4">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-white px-4 border-md border-right-0">
                              <i class="fa fa-lock text-muted"></i>
                          </span>
                      </div>
                      <input id="password" type="password" name="password" placeholder="Password" class="form-control bg-white border-left-0 border-md">
                  </div>

                  <!-- Submit Button -->
                  <div class="form-group col-lg-12 mx-auto mb-0">
                      <button class="btn btn-success btn-block py-2">
                          <span class="font-weight-bold">Login</span>
                      </button>
                  </div>
                  
                  <!-- create new account -->
                  <div class="text-center w-100 pt-4">
                      <p class="text-muted font-weight-bold">Create new account? <a href="signup" class="text-primary ml-2">sign up</a></p>
                  </div>

              </div>
          </form>
      </div>
  </div>
</div>

</body>
</html>