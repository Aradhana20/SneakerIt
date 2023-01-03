
<%@page import="source_package.FactoryProvider"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>SneakerIt - Home</title>
		<%@include file="components/common_css_js.jsp" %>  <!-- To add common css and JS -->
	
	</head>
	
	
	<body>

		<%@include file="components/navbar.jsp"  %><!-- adding navbar -->
		<h1>Hello World!</h1>
		<h1>Creating Session Factory</h1>
		
		<% 
	
			out.println(FactoryProvider.getFactory()+"<br>");
			out.println(FactoryProvider.getFactory()+"<br>");
			out.println(FactoryProvider.getFactory());
	
		%>
	

	
	</body>
</html>