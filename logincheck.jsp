<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<script type="text/javascript">
			function check()
			{
				alert("Invalid user id or Password");
			}
		</script>
	</head>
	<body>
<!--  -->



	<%
					HttpSession session=request.getSession();
					session=request.getSession(false);

if(session.getAttribute("mail_id")!=null)
{
	Connection conn=null;
	PreparedStatement ps;
	ResultSet rst;
	String query;

	try
			{
				Class.forName("com.mysql.jdbc.Driver");

			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			try
			{
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/beatrix","root","");
				query="select * from user where mail_id=?";
				ps=conn.prepareStatement(query);
				ps.setString(1,session.getAttribute("mail_id").toString());
				rst=ps.executeQuery();
				if(rst.next())
				{
				%>
					<jsp:include page="index.jsp"></jsp:include>

				<%
				out.println("<h2>Invalid</h2><script>check();</script>");

				}
				
		}
			catch(SQLException e)
			{
				System.out.println(e);
			}
}
else
{%>
					<jsp:include page="index.jsp"></jsp:include>
<%				out.print("<script>check();</script>"); %>

<%

}
if("POST".equalsIgnoreCase(request.getMethod()))
{
	if(request.getParameter("login")!=null)
	{
		if(request.getParameter("login").equals("Login"))
		{
			String mail=request.getParameter("mailid");
			String pass=request.getParameter("pass");
			Connection conn=null;
			PreparedStatement ps;
			ResultSet rst;
			String query;

			try
			{
				Class.forName("com.mysql.jdbc.Driver");

			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			try
			{
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/beatrix","root","");
				query="select * from user where mail_id=? and password=? and user_type='critics'";
				ps=conn.prepareStatement(query);
				ps.setString(1,mail);
				ps.setString(2,pass);
				rst=ps.executeQuery();  
				
				if(rst.next())
				{
					String user_id=rst.getString(1);
					String rank_id=rst.getString(6);
					
					session=request.getSession();
					session.setAttribute("mail_id",mail);

					session.setAttribute("user_id",user_id);
				session.setAttribute("user_type","critics");
				session.setAttribute("user_name",rst.getString(4));
				response.sendRedirect("critics_dashboard.jsp?user_id="+user_id+"&rank_id="+rank_id);

				}
			}
			catch(SQLException e)
			{
				System.out.println(e);
			}
			try
			{
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/beatrix","root","");
				query="select * from user where mail_id=? and password=? and user_type='admin'";
				ps=conn.prepareStatement(query);
				ps.setString(1,mail);
				ps.setString(2,pass);
				rst=ps.executeQuery();  
				
				if(rst.next())
				{
					String user_id=rst.getString(1);

					session=request.getSession();
					session.setAttribute("mail_id",mail);

				session.setAttribute("user_id",user_id);
				session.setAttribute("user_type","admin");
				session.setAttribute("user_name",rst.getString(4));
				response.sendRedirect("dashboard.jsp?user_id="+user_id);

				}
			}
			catch(SQLException e)
			{
				System.out.println(e);
			}
		}
	}
}
	%>

	</body>
</html>