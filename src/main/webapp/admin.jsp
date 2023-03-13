
<%@page import="source_package.FactoryProvider"%>
<%@page import="com.entities.User"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%
//to protect Admin page 

//add User.java from com.entities
User user = (User) session.getAttribute("current-user");

//if trying to directly open admin.jsp page
if (user == null) {

	session.setAttribute("errorMessage", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");

	return;
} else {
	//if normal person tries to open admin page
	if (user.getUserType().equals("Normal")) {
		session.setAttribute("errorMessage", "You are not admin !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}

}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="components/common_css_js.jsp"%>
<!-- To add common css and JS -->





</head>


<body>
	<div class="bg-img">

		<%@include file="components/navbar.jsp"%><!-- adding navbar -->
		<%@include file="components/common_css_js.jsp"%>

		<div class="container admin">

			<!--to make heading in center-->
			<div class="row mt-4">
				<div class="col md-1 text-center">
					<h1 style="color: black; text-shadow: 2px 1px 2px white"
						class="text-uppercase">Welcome back Admin!!</h1>
				</div>
			</div>



			<!-- First row -->
			<div class="row mt-4">

				<!-- first col -->
				<div class="col-md-4">

					<div class="card">

						<div class="card-body text-center">

							<div class="container">
								<img style="max-width: 125px" class="img-fluid"
									src="images/users.png" alt="user_icon">
							</div>

							<h1>10</h1>
							<h2 class="text-uppercase text-muted">Users</h2>

						</div>

					</div>

				</div>


				<!-- Second col -->
				<div class="col-md-4">

					<div class="card">

						<div class="card-body text-center">

							<div class="container">
								<img style="max-width: 125px" class="img-fluid"
									src="images/categories.png" alt="user_icon">
							</div>


							<h1>5</h1>
							<h2 class="text-uppercase text-muted">Categories</h2>

						</div>

					</div>

				</div>



				<!-- Third col -->
				<div class="col-md-4">

					<div class="card">

						<div class="card-body text-center">

							<div class="container">
								<img style="max-width: 125px" class="img-fluid rounded-circle"
									src="images/products.png" alt="user_icon">
							</div>


							<h1>20</h1>
							<h2 class="text-uppercase text-muted">Products</h2>

						</div>

					</div>


				</div>


			</div>


			<!-- Second row -->
			<div class="row mt-5">

				<!-- Second row : first col   addCategory-->
				<div class="col-md-6">

					<div class="card" data-toggle="modal"
						data-target="#add-category-modal">
						<!-- category modal -->

						<div class="card-body text-center">

							<div class="container">
								<img style="max-width: 125px" class="img-fluid"
									src="images/addCategory.png" alt="user_icon">
							</div>

							<h1>10</h1>
							<p class="mt-2">Click here to add new category</p>
							<h2 class="text-uppercase text-muted">Add Category</h2>

						</div>

					</div>

				</div>


				<!-- Second row : Second col addProducts -->
				<div class="col-md-6">

					<div class="card" data-toggle="modal"
						data-target="#add-product-modal">

						<div class="card-body text-center">

							<div class="container">
								<img style="max-width: 125px" class="img-fluid"
									src="images/addProducts.png" alt="user_icon">
							</div>


							<h1>5</h1>
							<p class="mt-2">Click here to add new product</p>
							<h2 class="text-uppercase text-muted">Add Products</h2>

						</div>

					</div>

				</div>


			</div>



		</div>



	</div>


	<!-- Add category modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<div class="form-group">
							<!-- rule of bootstrap to put form in form-group  -->

							<!-- To give key while fetching in ProductOperationServlet-->
							<input type="hidden" name="operation" value="addCategory" /> <input
								type="text" class="form-control" name="CategoryTitle"
								placeholder="Enter category title" required />

						</div>

						<div class="form-group">
							<!-- rule of bootstrap to put form in form-group  -->

							<textarea style="height: 150px" class="form-control"
								placeholder="Enter category description" name="CategoryDesc"></textarea>

						</div>

						<div class="container">

							<button type="Submit" class="btn btn-outline-success">Add
								category</button>
							<button type="Reset" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</form>


				</div>

			</div>
		</div>
	</div>


	<!-- End category modal -->



	<!-- Add product modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

						<!-- To give key while fetching in ProductOperationServlet-->
						<input type="hidden" name="operation" value="addProduct" />

						<div class="form-group">
							<!-- rule of bootstrap to put form in form-group  -->

							<input type="text" class="form-control"
								placeholder="Enter Product Name" name="ProductName" required />

						</div>

						<div class="form-group">
							<!-- Product desc  -->

							<textarea style="height: 150px" class="form-control"
								placeholder="Enter product description" name="Productdesc"></textarea>

						</div>



						<div class="form-group">
							<!-- Product price -->

							<input type="text" class="form-control"
								placeholder="Enter product price" name="Productprice" />

						</div>


						<div class="form-group">
							<!-- Product discount -->
							<input type="text" class="form-control"
								placeholder="Enter product discount" name="Productdiscount" />
						</div>

						<div class="form-group">
							<!-- Product quantity -->

							<input type="text" class="form-control"
								placeholder="Enter product quantity" name="Productquantity" />

						</div>

						<!-- Product category -->

						<%
							CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
							List<Category> list=cdao.getCategory();
						%>

						<!-- Add product in which category -->
						<div class="form-group">
							<select name="categoryId" class="form-control" id="">


								<%
									for(Category c:list){
								%>
								 <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
								
								<%
									}
								%>

							</select>

						</div>

						<div class="form-group">
							<!-- Product Photo -->

							<input type="file" class="form-control"
								placeholder="Enter product photo" name="Productphoto"
								id="Productphoto" required />

						</div>

						<!-- submit button -->
						<div class="container">

							<button type="button" class="btn btn-outline-success">Add
								Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</form>


				</div>

			</div>
		</div>
	</div>


	<!-- End category modal -->







</body>


</html>