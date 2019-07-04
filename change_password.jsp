<%@page import="beatrix.AdminDisplay" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*,java.io.*"%>
 <%@ page import="beatrix.*" session="false"%>

    <%@page import="java.util.*" %>

    <%@page import="java.sql.*" %>
   
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
<!-- //for-mobile-apps -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/cssnew.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
			function validation()
			{
       
				if(document.forms.form1.pass.value.trim()=="")
				{
					alert("Type Currenttttt Password");
					return false;
				}        
				else if(document.forms.form1.npass.value.trim()=="")
				{
					alert("Type your  new password");
					return false;
				}
				else if(document.forms.form1.retype.value.trim()=="")
				{
					alert("ReType your password");
					return false;
				}
				else if(document.forms.form1.npass.value != document.forms.form1.retype.value)
 				{
					alert("password & retype password mismatch");
					return false;
				}
			}
			function pas()
			{
				var a=document.getElementById("npass").value;
				if(a.length>=2 && a.length<7)
				{
					document.getElementById("ps").style.visibility="visible";
					document.getElementById("ps").style.background="red";
					document.getElementById("ps").style.width="180px";
				}
				else if(a.length>=7 && a.length<12)
				{
					document.getElementById("ps").style.visibility="visible";
					document.getElementById("ps").style.background="orange";
					document.getElementById("ps").style.width="200px";
				}
				else if(a.length>=12 && a.length<21 )
				{
					document.getElementById("ps").style.visibility="visible";
					document.getElementById("ps").style.background="green";
					document.getElementById("ps").style.width="250px";
				}
				else
				{
					document.getElementById("ps").style.visibility="hidden";
				}
			}
</script>
</head>
<body>

<%
	String user_id=request.getParameter("user_id");
	String rank_id=request.getParameter("rank_id");
	String mode=request.getParameter("mode");	

	if("change".equals(mode))
	{
%>
		<form action="password_check.jsp?user_id=<%=user_id%>&rank_id=<%=rank_id%>" method="post" name="form1" >
		<center>
	<div class="panel-group" id="accordion" style="margin-top:70px;">
	<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-heading">
			<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Change Password </a> </h3>
	</div></center>
	<div id="collpaseone" class="panel-collapse collapse in">
	<div class="panel-body">

		<table border="1" width="500px" class="table table-bordered table-striped" >
		
		<tr>
		<td>Current Password</td>
		<td><input type="password" name="pass" class="form-control input-lg" placeholder="Password" required="required" id="pass" >
            </</td>
		</tr>
		<tr>
		<td>New Password :</td>
		<td><input type="password" name="npass" class="form-control input-lg" placeholder="Password" required="required" required title="Plz Enter minimum 6 character" pattern="[a-zA-Z0-9]{6,12}" id="npass" onkeydown="pas()" >
		<div class="form-group"><br>
              <div class="input-group">
            
              <div id="ps" style="visibility:hidden; width:185px; height:7px;"></div>
               </div>
            </div>  

            </div>

            </</td>
		</tr>
				<tr>
		<tr>
		<td>Re-Type Password : </td>
		<td><input type="password" name="retype" class="form-control input-lg" placeholder="Re-Type Password" id="retype" required="required" >
		</td>
		</tr>        
		</table>
		<center>
		<button type="submit" class="btn btn-primary btn-md" onclick="return validation()">
			<span class="glyphicon glyphicon-floppy-save"></span> Save
		</button>
		<a href="dashboard.jsp?user_id=<%=user_id%>&rank_id=<%=rank_id%>" class="btn btn-primary btn-md">
          <span class="glyphicon glyphicon-hand-left"></span> Back
        </a>
		</center>
		
		</div>
		</div>
		</div> 
		</div>
			

	</form>
<%

	}
	else if ("forgot".equals(mode)) 
	{
%>
		<div class="modal-body">
        
          <form class="col-md-12 center-block" action="signup_check.jsp?user_id=1">
            
            
            <div class="form-group">
              <div class="input-group">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-envelope"></span>
        </span>
              <input type="email" name="email" class="form-control input-lg" placeholder="enter mail" required="required">
            </div>
            </div>
<%
	}
%>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.0.js"></script>

</body>
</html> 