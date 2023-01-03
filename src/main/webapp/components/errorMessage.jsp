<%
//java in jsp using scriplet tag 
//displaying the message on UI

String errorMessage = (String) session.getAttribute("errorMessage");

if (errorMessage != null) {
	//prints output
	//out.println(message);
%>

<!-- desiging the page  -->

<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%= errorMessage %></strong> 
	
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>



<%

session.removeAttribute("errorMessage");
}
%>



