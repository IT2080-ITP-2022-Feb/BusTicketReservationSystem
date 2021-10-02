<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Agency Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="webpage/assets/css/style.css" rel="stylesheet"> 
	<style>
		.border {
			padding: 35px;
			border-radius: 25px;
			background-color: #f5f5f5;
		}
		.navbar{
			position: relative;
			display: flex;
			flex-wrap:wrap;
			align-items: center;
			justify-content: space-between;
		}
	</style>
</head>
<body>

  
	
	
  <header id="header" class="header-top">
    <div class="container" >
      <h1><a href="index.html">OnlineBTRS</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
      <h2>We made booking <span>Bus Tickets </span> Revolutionary for Everyone</h2>

      <nav id="navbar" class="navbar" style="background-color:inherit">
        <ul style="background-color:inherit">
          <li><a class="nav-link active" href="TempHomepage.jsp">Home</a></li>
          <li><a class="nav-link" href="#about">About</a></li>
                <% Integer loginStatus = (Integer)session.getAttribute("userID");
		            String loginMode = (String)session.getAttribute("mode");
			 	if(loginStatus == null || loginMode == null){ %> 
          <li><a class="nav-link" href="#register">Register</a></li>
          <li><a class="nav-link" href="#login">Login</a></li>
             	<% }else if (loginMode == "passenger"){ %>  
          <li><a class="nav-link" href="#passengerManage">Manage Passenger</a></li>
                <% }else if (loginMode == "agency"){ %> 
          <li><a class="nav-link" onclick="autoAgency()">Manage Agency</a></li>
                <% } else { 
					session.removeAttribute("userID");
					session.removeAttribute("mode");
				 %> 
					 <script>
					  window.location.href = 'TempHomepage.jsp';
					 </script> 
				 <% } %>
        </ul>
        <script>
          function autoAgency(){
        	  <% String button = "Agency";
        	     request.setAttribute("Agency", button); %>
        	     window.location.href = 'TempHomepage.jsp';
          }
        </script>
        
        
        
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header>

<br><br><br>
	<br>
	<br>
	
	<!-- https://www.seekpng.com/png/full/168-1687539_transparent-white-sprinkle-black-and-white-sprinkles-pattern.png-->
	
	<div class="container">
		<div class="border" style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.9) 0%,rgba(0, 0, 0, 0.9) 0%), url(https://www.seekpng.com/png/full/46-463085_desktop-free-triangle.png)">
			<h2>Agency Registration</h2>
			<form class="form-horizontal" action="AgencyRegistrationServlet"
				method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Agent
						Name:</label>
					<div class="col-sm-9">
						<input type="text" name="agentName" placeholder="Enter name"
							class="form-control" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">agent
						NIC:</label>
					<div class="col-sm-9">
						<input type="text" name="agentNIC" placeholder="Enter your NIC" class="form-control" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">companyName:</label>
					<div class="col-sm-9">
						<input type="text" name="companyName" placeholder="Enter your company name" class="form-control" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">agentPhone:</label>
					<div class="col-sm-9">
						<input type="text" name="agentPhone" placeholder="Enter Your mobile phone" class="form-control" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">agentEmail:</label>
					<div class="col-sm-9">
						<input type="email" name="agentEmail" placeholder="Enter your email" class="form-control" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">agencyLocation:</label>
					<div class="col-sm-9">
						<input type="text" name="agencyLocation" placeholder="Enter agency location" class="form-control" required>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="email">password:</label>
					<div class="col-sm-9">
						<input type="password" id="psw" name="password"
							class="form-control"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							required>
					</div>
				</div>
				<div class="col-sm-offset-2 col-sm-10">
					<div id="message">
						<h3>Password must contain the following:</h3>
						<p id="letter" class="invalid">
							A <b>lowercase</b> letter
						</p>
						<p id="capital" class="invalid">
							A <b>capital (uppercase)</b> letter
						</p>
						<p id="number" class="invalid">
							A <b>number</b>
						</p>
						<p id="length" class="invalid">
							Minimum <b>8 characters</b>
						</p>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="email">confirmPassword:</label>
					<div class="col-sm-9">
						<input type="password" name="confirmPassword" id="cpws"
							class="form-control" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">userName:</label>
					<div class="col-sm-9">
						<input type="text" name="userName" placeholder="Enter username"
							class="form-control" required>
					</div>
				</div>


				<% String popup = (String)request.getAttribute("popup");
		if(popup == "1"){
			%><div class="" id="popupp">
					<div class="alert alert-danger alert-dismissible fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Username Exists!</strong> Username already exists. Please
						enter a different username or login.
					</div>
				</div>
				<%
		}else if(popup == "2"){
			%><div class="" id="popupp">
					<div class="alert alert-danger alert-dismissible fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Email Already Exists!</strong> Email already exists.
						Please enter a different email or login.
					</div>
				</div>
				<%
		}%>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" name="submit" value="Register"  class="btn btn-warning" onclick="return Validate()">
					</div>
				</div>
			</form>
		</div>
	</div>

<center> Already registered?<a href ="AgencyLogin.jsp"> Login now</a>

<style>
.border {
	padding: 35px;
	border-radius: 25px;
	background-color: #f5f5f5;
}

/* The message box is shown when the user clicks on the password field */
#message {
	display: none;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: green;
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
	color: red;
}

  .navbar {
    margin-bottom: 0;
    background-color: #202020;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #202020 !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }


</style>

	<script type="text/javascript">
	    function Validate() {
	        var password = document.getElementById("pws").value;
	        var confirmPassword = document.getElementById("cpws").value;
	        if (password != confirmPassword) {
	            alert("Passwords do not match.");
	            return false;
	        }
	        return true;
	    }
	    
	    var myInput = document.getElementById("psw");
	    var letter = document.getElementById("letter");
	    var capital = document.getElementById("capital");
	    var number = document.getElementById("number");
	    var length = document.getElementById("length");

	    myInput.onfocus = function() {
	      document.getElementById("message").style.display = "block";
	    }

	    myInput.onblur = function() {
	      document.getElementById("message").style.display = "none";
	    }
	    
	    myInput.onkeyup = function() {
	      var lowerCaseLetters = /[a-z]/g;
	      if(myInput.value.match(lowerCaseLetters)) {  
	        letter.classList.remove("invalid");
	        letter.classList.add("valid");
	      } else {
	        letter.classList.remove("valid");
	        letter.classList.add("invalid");
	      }
	      
	      var upperCaseLetters = /[A-Z]/g;
	      if(myInput.value.match(upperCaseLetters)) {  
	        capital.classList.remove("invalid");
	        capital.classList.add("valid");
	      } else {
	        capital.classList.remove("valid");
	        capital.classList.add("invalid");
	      }

	      var numbers = /[0-9]/g;
	      if(myInput.value.match(numbers)) {  
	        number.classList.remove("invalid");
	        number.classList.add("valid");
	      } else {
	        number.classList.remove("valid");
	        number.classList.add("invalid");
	      }
	      
	      if(myInput.value.length >= 8) {
	        length.classList.remove("invalid");
	        length.classList.add("valid");
	      } else {
	        length.classList.remove("valid");
	        length.classList.add("invalid");
	      }
	    }
	</script>

</body>
</html>



