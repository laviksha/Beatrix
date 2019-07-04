<%@ page import="beatrix.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Logout</title>
	</head>
	<%
		HttpSession session=request.getSession();
		session.invalidate();
		session=request.getSession();
		response.sendRedirect("index.jsp");
	%>
	<body>
	</body>
</html>