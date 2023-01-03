
<%
//java in jsp using scriplet tag 
//displaying the message on UI

String message = (String) session.getAttribute("message");

if (message != null) {
	//prints output
	//out.println(message);
%>

<!-- desiging the page  -->

<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong><%= message %></strong> 
	
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>



<%

session.removeAttribute("message");
}
%>



