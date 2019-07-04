<%@ page import="beatrix.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Custom Audio Player Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/cssnew.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
		function preventBack()
		{
			window.history.forward();
		}
		setTimeout("preventBack()",0);
		window.onunload = function () {null};
	</script>

 	<title>Dashboard</title>
	<%
		DConnection dc=new DConnection();
		String user=request.getParameter("user_id");
		out.print(user);
  		beatrix.CommonMethods cm=new beatrix.CommonMethods();
  		String userName=cm.getCriticsName(user);
  		beatrix.AdminDisplay s1=new beatrix.AdminDisplay();
		//Vector<String []> v = s1.showRecordAll();
			String rank_id=request.getParameter("rank_id");
	Vector<String []> v = s1.showRecordAllToCritic(rank_id);	// to show details of song and it's rankk given by the critic. 

		String user_id=request.getParameter("user_id");
	%>
	<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","Sat, 01 Jan 1990 00:00:00 GMT"); 
response.setDateHeader("Expires",-1); 
%> 

</head>
<body>
<%
		HttpSession session=request.getSession(false);
		if(session==null)
		{
	%>
			<jsp:forward page="index.jsp"></jsp:forward>
	<%	
			return;		
		}
		
	%>

<div class="w3-container w3-top w3-black w3-large w3-padding" style="z-index:4;height: 50px;">
<span class="w3-right" style=""><img src="images/Beatrix.png" height="20" width="105"></span>
          <form action="logout.jsp" method="post">
	<button type="submit" class="btn btn-danger" aria-label="Left Align">
		<span class="glyphicon glyphicon glyphicon-off" aria-hidden="true"></span> Logout
	</button>
<a href="critics_password.jsp?user_id=<%=user_id%>&rank_id=<%=rank_id%>&mode=change" class="btn btn-primary btn-md">
    	
    			<span class="glyphicon glyphicon glyphicon-th-list" aria-hidden="true"></span> Change Password
    	</a>
 </form>

          
</div>

<div>
<br><br><h1>Welcome <%=userName%></h1>
</div>


<center>
		<div class="panel-group" id="accordion" style="margin-top:10px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Song Details </a> </h3>
</div></center>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
<%
  int a=s1.maxId();
		if(a<1)
	{
%>
	<h1>Empty Table</h1>
	<%
}
	else
{
	%>
			<div class="w3-responsive">

			<table border="1" width="500px" class="table table-bordered table-striped" >
				<tr>
		
		<th>Release Date</th>	<th>Album</th>	<th>Album Cover</th>	<th>Rank</th> <th>Song Name</th>	<th></th></tr>
<%		
		for(int i=0;i<v.size();i++)
		{
%>
			<tr>
<%			
			String s[]=(String [])v.elementAt(i);
			for(int j=2;j<4;j++)
			{
%>
				<td><%=s[j] %></td>
<%				
			}
%>
				<td><img src="/./beatrix/songimages/<%=s[4]%>" alt="song_img" style="width:40px;height:40px" /></td>
				<td><%=s[5]%></td>
				<td><a href=""><%=s[6]%></a></td>
				<td><a href="criticdisplay.jsp?song_id=<%=s[0]%>&song_name=<%=s[6]%>&rank=<%=s[5]%>&mode=	edit&user_id=<%=user_id%>&rank_id=<%=rank_id%>" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-pencil"></span> Edit</a></td>
			</tr>
<%
		}
%>
		</table>
		<% } %>
		</div>
		</div>
		</div>
		</div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.0.js"></script>
        <script src="js/audioPlayer.js"></script>


</body>
</html>