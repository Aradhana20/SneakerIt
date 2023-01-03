<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User-Login</title>
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


<body >
	<%@include file="components/navbar.jsp"%><!-- adding navbar -->
	
	<!-- To add icons to Register pages  -->
	<script src="https://kit.fontawesome.com/24615d6d6b.js" crossorigin="anonymous"></script>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6  offset-md-3">

				<div class="card mt-7">
				
					<%@ include file="components/errorMessage.jsp" %>

					<div class="card-header login-bg text-white">


						<h3 class="text-center my-3">Login Here</h3>
					</div>

					<div class="card-body">
					
						<form action="login" method="post">
							<div class="form-group">
							<td class="icon"><i class="fa-solid fa-user"></i></i></td>
								<label for="exampleInputEmail1">Email address</label>
								 <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							
							<div class="form-group">
							<td class="icon"><i class="fa-solid fa-lock"></i></i></i></td>
								<label for="exampleInputPassword1">Password</label> 
								<input name="password"
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<a  href="register.jsp" style="color:red;" class="text-center d-block mt-3 mb-3" > If not registered click here</a>
							<div class="container center">
								
								<button type="submit" class="btn btn-primary login-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary login-bg border-0">Reset</button>
							</div>
							
						</form>

					</div>


				</div>


			</div>

		</div>


	</div>

</body>


</html>