<%@page import="java.sql.SQLException" session="false"%>
<%@page import="olx.*"%>

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
		
		String otp= request.getParameter("otp");
		String otp1= request.getParameter("generatedotp");
		
		
		if(!(otp.equals(otp1)))
		{
%>
			<jsp:forward page="user_signup.jsp"></jsp:forward>
<%			
		}

		String name= request.getParameter("sname");
		String pass= request.getParameter("pass");
		String mail= request.getParameter("email");
		int id=0;
		String msg="Welcome Critic your account created\nYour Id is "+mail +" and password is "+ pass;
		beatrix.CommonMethods cm=new beatrix.CommonMethods();
		//int sid=cm.getStateId(state);
		//c3.getStateId(state);
		//int cid=cm.getCityId(city);
		//c3.getCityId(city);
		//System.out.println(sid+","+cid+name);

		
		int cnt=cm.count(mail);
				 
		 	if(cnt==0)// if authorized
		 	{
		 		id=cm.maxId()+1;
		 		cm.addCritics(id,mail,pass,name);
%>
				<jsp:include page="mail.jsp?user_id=1">
					<jsp:param name="email" value="<%=mail%>" />
					<jsp:param name="subject" value="Account Created" />
					<jsp:param name="msg" value="<%=msg%>" />
				</jsp:include>

				<jsp:include page="dashboard.jsp?user_id=1>"></jsp:include>
				
<%	 		
		 	}	 	
%>




	
	</body>
</html>