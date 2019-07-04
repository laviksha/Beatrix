<%@ page import="beatrix.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%
DConnection db=new DConnection();
beatrix.CommonMethods s1=new beatrix.CommonMethods();
String user_id=request.getParameter("user_id");

	s1.reduce_counter();
	s1.nullifycritics();
	s1.auto_deletion();
	
	response.sendRedirect("dashboard.jsp?user_id="+user_id);

%>
</body>
</html>