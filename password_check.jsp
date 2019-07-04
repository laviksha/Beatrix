<%@page import="java.sql.SQLException,java.util.*,java.sql.*,java.io.*" session="false"%>
<%@page import="beatrix.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title></title>
	</head>
	<body>
	



<% 
		
		
		String password= request.getParameter("pass");
		String new_password= request.getParameter("npass");
		String rank_id= request.getParameter("rank_id");
		String user_id= request.getParameter("user_id");

	
		
		beatrix.CommonMethods cm=new beatrix.CommonMethods();
		beatrix.UserUpdate usr=new beatrix.UserUpdate();
		
		
		int cnt=cm.passwordVerification(password,user_id);
				 
		 	if(cnt>0)// if current password exist
		 	{
		 		usr.updatePassword(new_password,user_id);
		 		
		 		out.print("<h1>Password Updated...</h1>");
		 		if("NULL".equals(rank_id))
		 		{
%>
				<jsp:forward page="dashboard.jsp">
					<jsp:param name="user_id" value="<%=user_id%>" />
					<jsp:param name="rank_id" value="<%=rank_id%>" />
				</jsp:forward>
<%	 			
				}
				else{
%>
				<jsp:forward page="critics_dashboard.jsp">
					<jsp:param name="user_id" value="<%=user_id%>" />
					<jsp:param name="rank_id" value="<%=rank_id%>" />
				</jsp:forward>
<%					
				}
		 	}	
		 	else if(cnt==0)
			{
%>				
				<jsp:include page="change_password.jsp">
					<jsp:param name="user_id" value="<%=user_id%>" />
					<jsp:param name="rank_id" value="<%=rank_id%>" />
					<jsp:param name="mode" value="change" />
				</jsp:include>

<%	
				out.print("<h3><center>Invalid Current password-"+password+",,"+out+"<center><h3>");
			} 	
			else{
			out.print("<h3><center>Current password-"+password+"<center><h3>");
		}
%>




	
	</body>
</html>