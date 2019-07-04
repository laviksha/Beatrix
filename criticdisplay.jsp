<%@page import="beatrix.AdminDisplay" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*,java.io.*"%>
    
<!DOCTYPE html>
<html>
<title>BEATRIX</title>
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

<script src="js/jquery-1.11.1.min.js"></script>

</head>
	<script>
     	   function check1()
     	   {
             var a=document.getElementById("addname").value;
             if(a.trim()=="")
             {
             alert("Song Name Is  Not Correct");
             return false;
             }
             var b=document.getElementById("picname").value;
             if(b.trim()=="")
             {
             alert("Song Is  Not Choosen");
             return false;
             }
             return true;
     	   }
</script>
<body>
<%
String msg="";
	int user_id=Integer.parseInt(request.getParameter("user_id"));
	int rank_id=Integer.parseInt(request.getParameter("rank_id"));
%>      
<div class="w3-container w3-top w3-black w3-large w3-padding" style="z-index:4;height: 50px;">
<span class="w3-right" style=""><img src="images/Beatrix.png" height="20" width="105"></span>
          <form action="logout.jsp" method="post">
	<button type="submit" class="btn btn-danger" aria-label="Left Align">
		<span class="glyphicon glyphicon glyphicon-off" aria-hidden="true"></span> Logout
	</button>
	<a href="critics_dashboard.jsp?user_id=<%=user_id%>&rank_id=<%=rank_id%>" class="btn btn-primary btn-md">
		<span class="glyphicon glyphicon glyphicon-th-large" aria-hidden="true"></span> DashBoard
	</a>	
</form>
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
	
          
</div>
	

<div>
<%
	String mode=request.getParameter("mode");
	String song_name=request.getParameter("song_name");
	
	int song_id=Integer.parseInt(request.getParameter("song_id"));
	
	
	beatrix.AdminDisplay s1=new beatrix.AdminDisplay();
	beatrix.CommonMethods s6=new beatrix.CommonMethods();
			
	if("edit".equals(mode))
	{
		  String rank=request.getParameter("rank");
  //		  String rank_id=request.getParameter("rank_id");

%>
		<form action="criticdisplay.jsp?user_id=<%=user_id%>&mode=update&rank_id=<%=rank_id%>" method="post" name="editform" onSubmit="return check1();">
		<center>
	<div class="panel-group" id="accordion" style="margin-top:70px;">
	<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-heading">
			<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Update Song Details </a> </h3>
	</div></center>
	<div id="collpaseone" class="panel-collapse collapse in">
	<div class="panel-body">
		<div class="w3-responsive">
		<table border="1" width="500px" class="table table-bordered table-striped" >
		
		<tr>
		<td>Song Id :</td>
		<td><input type="text" name="song_id" value="<%=song_id%>" readonly="readonly" /></td>
		</tr>
		<tr>
		<td>Song Name :</td>
		<td><input id="song_name" type="text" name="song_name" value="<%=song_name%>" readonly="readonly" /></td>
		</tr>
				<tr>
		<tr>
		<td>Rank* : </td>
		<td><input id="addname" type="text" name="rank" value="<%=rank%>" required="required" /></td>
		</tr>        
	</table>
		
		
		</div>
		</div>
		</div> 
		</div>
		</div>
		<center>
		<button type="submit" class="btn btn-primary btn-md"><%msg=s6.Check_Rank(rank,rank_id);%>
			<span class="glyphicon glyphicon-floppy-save"></span> Save
		</button>
		<h5><%=msg%></h5>

		<a href="critics_dashboard.jsp?user_id=<%=user_id%>&rank_id=<%=rank_id%>" class="btn btn-primary btn-md">
          <span class="glyphicon glyphicon-hand-left"></span> Back
        </a></center>
			<br><br><br><br>

	</form>
		
	<%
		return;
	}

	else if("update".equals(mode))
	{
		int rank=Integer.parseInt(request.getParameter("rank"));
		s1.updateRank(song_id, rank, user_id);  // update rank in critics_rating table
	}

%>
	<jsp:include page="critics_dashboard.jsp" >
					<jsp:param name="user_id" value="<%=user_id%>" />
					<jsp:param name="rank_id" value="<%=rank_id%>" />
	</jsp:include>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.0.js"></script>

</body>
</html> 