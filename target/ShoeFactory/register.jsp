<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>
<!-- To add common css and JS -->

<style>

	body{
	
  background-image: url('images/loginImage.jpg');
  background-repeat: no-repeat;
  background-attachment:fixed;;
  /* 100% 100%; */
  background-size: 1080px; 
  background-position: center;
   
}

</style>	

</head>

<body>
	<%@include file="components/navbar.jsp"%><!-- adding navbar -->
	<%@include file="components/common_css_js.jsp"%>

	<!-- To add icons to Register pages  -->
	<script src="https://kit.fontawesome.com/24615d6d6b.js"
		crossorigin="anonymous"></script>

	<div class="row mt-5">
		<!-- mt = margin top 5 -->
		<div class="col-md-3 offset-md-4">
			<!-- md-4 = width equal to 4 column  -->

			<div class="card">
				<!-- to enclose form in card -->

				<%@include file="components/message.jsp"%>  
				
				

				<div class="card-body px:5">
					<!--adding padding-->

					<div class="container center fa-2x ">
						<!-- Bring image in center -->
						<!-- <i class="fa-solid fa-user-plus center fa-2x"></i> -->

						<img src="images/Login.png" style="max-width: 60px;"
							class="img-fluid">

					</div>
					<h3 class="text-center my-3">Sign up here</h3>


					<form action="register" method="post">

						<div class="form-group">

							<td class="icon"><i class="fa-solid fa-user"></i></i></td> <label
								for="name">User Name</label> <input name="user_name" type="text"
								class="form-control" id="name" aria-describedby="emailHelp"
								placeholder="Enter here">
						</div>

						<div class="form-group">

							<td class="icon"><i class="fa-solid fa-envelope"></i></i></i></td> <label
								for="email">User email</label> <input name="user_email"
								type="email" class="form-control" id="email"
								aria-describedby="emailHelp" placeholder="Enter here">
						</div>

						<div class="form-group">

							<td class="icon"><i class="fa-solid fa-lock"></i></i></i></td> <label
								for="password">User Password</label> <input name="user_password"
								type="password" class="form-control" id="password"
								aria-describedby="emailHelp" placeholder="Enter here">
						</div>

						<div class="form-group">

							<td class="icon"><i class="fa-solid fa-mobile"></i></td> <label
								for="phone">Phone Number</label> <input name="user_phone"
								type="number" class="form-control" id="phone"
								aria-describedby="emailHelp" placeholder="Enter here">
						</div>

						<div class="form-group">

							<td class="icon"><i class="fa-solid fa-location-pin"></i></td> <label
								for="address">User Address</label>
							<textarea name="user_address" style="height: 100px;"
								class="form-control" placeholder="Enter your address"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>

						</div>



					</form>


				</div>


			</div>

		</div>

	</div>

</body>


</html>