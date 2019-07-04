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
	<script>
function myFunction() {
    var d = new Date();
    var weekday = new Array(7);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";

    var n = weekday[d.getDay()];
    if(n=="Saturday")
    	document.getElementById("demo").style.visibility="visible";
}
  function showEdit(){
    for(var i=0;i<100;i++)
    {
    var a=document.getElementsByClassName("Rank")[i].value;
    console.log(document.getElementsByClassName("Rank")[i]);
  
    if (a=="null") {
            document.getElementsByClassName("Edit")[i].disabled=false;     
    }
    else{
      // alert("outside");
        document.getElementsByClassName("Edit")[i].disabled=true;     
    }
  }
  }

</script>

	<title>Dashboard</title>
	<%
		DConnection dc=new DConnection();
	%>
	<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","Sat, 01 Jan 1990 00:00:00 GMT"); 
response.setDateHeader("Expires",-1); 
%> 

</head>
<body onload="myFunction()">
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
	<%
  String mode="", critics_id="", rankid="",rank="", critic="", name="", user="1";
  beatrix.DConnection dc1=new beatrix.DConnection();
	//user=request.getParameter("user_id");
  mode=request.getParameter("mode");

  beatrix.CommonMethods cm=new beatrix.CommonMethods();
  
  String userName=cm.getAdminName(user);
  String mail=cm.getMailId(user);
  critics_id=request.getParameter("critic_id");
  
  if ("Save".equals(mode)) {
    name=request.getParameter("name");
    cm.updateAdminName(name);
    userName=cm.getAdminName(user);
   
  }
  if ("Delete".equals(mode)) {
    critic=request.getParameter("critic_id");
    cm.deleteCritic(critic);
  }
  if ("Change".equals(mode)) 
    {
    rankid=request.getParameter("name2");
    cm.updateCriticsRank(critics_id,rankid);
    rank=cm.getCriticsRank(critics_id);
    
  }
  
%>
<div class="w3-container w3-top w3-black w3-large w3-padding" style="z-index:4;height: 50px;">
<span class="w3-right" style=""><img src="images/Beatrix.png" height="20" width="105"></span>
          <form action="logout.jsp" method="post">
	<button type="submit" class="btn btn-danger" aria-label="Left Align">
		<span class="glyphicon glyphicon-off" aria-hidden="true"></span> Logout
	</button>

<div class="btn-group">
  <button type="button" class="btn btn-primary">Action</button>
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li>
    	<a href="admindisplay.jsp?user_id=<%=user%>">
    	<button type="button" class="btn btn-info btn-m" style="border-radius: 0px;">
    			<span class="glyphicon glyphicon glyphicon-th-list" aria-hidden="true"></span> Songs List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
    	</a>
    	</form>
    </li>
    <li>
    	<a> 
    	<form action="rankcheck.jsp?user_id=<%=user%>" method="post">
		<button type="submit" class="btn btn-info btn-md" style="border-radius: 0px;">
				<span class=" glyphicon glyphicon-ok-circle" aria-hidden="true"></span> Generate Rank &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</form>
		</a>
	</li>
	<li>
		<a href="register.jsp?user_id=<%=user%>">
		<button type="button" class="btn btn-info btn-md" style="border-radius: 0px;">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span> Register Critic &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   </button>
		</a>
	</li>
  <li>
     <a href="change_password.jsp?user_id=<%=user%>&rank_id=NULL&mode=change">
        <button type="button" class="btn btn-info btn-md" style="border-radius: 0px;">
                <span class="glyphicon glyphicon glyphicon-th-list" aria-hidden="true"></span> Change Password&nbsp;</button>
        </a>
  </li>
    <li role="separator" class="divider"></li>
    <li>
    	<a>
    	<form action="countercheck.jsp?user_id=<%=user%>" method="post">
		<button type="submit" class="btn btn-info" id="demo" style="border-radius: 0px;visibility: hidden;">		<span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span> Reduce Counter</button>
		</form>
		</a>
    </li>
  </ul>
 
</div>


</div>


<div>
<br><br><h1>Welcome <%=userName%></h1>
</div>
<br><br>

<div class="w3-responsive">

<table>
<tr><td></td>
<th><div>
<h3>Admin Details</h3>
<%
  
  if ("Edit".equals(mode))
  {
%>
      
     <form action="dashboard.jsp" name="save">
    <table border="1" width="500px" class="table table-bordered table-striped">
    <tr><th>Name :</th><td><input type="text" name="name" value="<%=userName%>" ></td></tr>
    <tr><th>Email ID :</th><td><%=mail%></td>
    <tr><td colspan="2" align="center"><input type="submit" class="btn btn-primary" name="mode" value="Save"><input type="hidden" name="user_id" value="<%=user%>" ></td></tr>
    </table>
    </form>
<%  
  }
  else
  {
%>
<form action="dashboard.jsp" name="save">
  <table border="1" width="500px" class="table table-bordered table-striped">
    <tr><th>Name :</th><td><%=userName%></td></tr>
    <tr><th>Email ID :</th><td><%=mail%></td>
    <tr><td colspan="2" align="center"><input type="submit" class="btn btn-primary" name="mode" value="Edit"><input type="hidden" name="user_id" value="<%=user%>" ></td></tr>
  </table>
</form>
<%
   }



   if("Update".equals(mode))
    {
%>
<th colspan="2" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
<th>
<div>
<h3>Critic Details</h3>

    <table border="1" width="500px" class="table table-bordered table-striped">
  <tr><th>Critic Id</th><th>Name</th><th>Email Id</th><th>Rank</th><th></th></tr>
<%
  Vector<String []> v = cm.getAllCritics();
  for(int i=0;i<v.size();i++)
  {    
      String s[]=(String [])v.elementAt(i);
%>
      <tr>
        <td><%=s[0] %></td>
        <td><%=s[1] %></td>
        <td><%=s[2] %></td>
        <td><input type="text" name="Rank" class="Rank" id="Rank" value="<%=s[3]%>"></td>
        <td><a href="dashboard.jsp?critic_id=<%=s[0]%>&mode=Change&name2=1"><input type="hidden" id="name2" class="name2" name="name2"><input type="submit" class="btn btn-primary Edit" name="mode" value="Change" id="Edit" disabled onclick="check()"></a><a href="dashboard.jsp?critic_id=<%=s[0]%>&mode=Delete&user_id=1"><input type="submit" class="btn btn-danger" value="Delete"></a><script type="text/javascript">showEdit();</script>
        </td>
      </tr>
<%        
  }
%>
    
  
    </div>
    </th>
    </table>
    </tr>
  </table>

  </div></div>
</th>
    <%
  }



  else
    {
    %>

<th colspan="2" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
<th>
<div>
<h3>Critic Details</h3>
  <table border="1" width="500px" class="table table-bordered table-striped">
  <tr><th>Critic Id</th><th>Name</th><th>Email Id</th><th>Rank</th><th></th></tr>
<%
  Vector<String []> v = cm.getAllCritics();
  for(int i=0;i<v.size();i++)
  {    
      String s[]=(String [])v.elementAt(i);
%>
      <tr>
        <td><%=s[0] %></td>
        <td><%=s[1] %></td>
        <td><%=s[2] %></td>
        <td><input type="text" name="Rank" class="Rank" readonly="readonly" id="Rank" value="<%=s[3]%>"></td>
        <td><a href="dashboard.jsp?critic_id=<%=s[0]%>&mode=Update">
        <input type="submit" class="btn btn-primary Edit" name="mode" value="Update" id="Edit" disabled>
        </a>
        <a href="dashboard.jsp?critic_id=<%=s[0]%>&mode=Delete&user_id=1">
          <input type="submit" class="btn btn-danger" value="Delete">
        </a>
        <script type="text/javascript">showEdit();</script>
        </td>
      </tr>
<%        
  }
}
%>
    
  
    </div>
    </th>
    </table>
    </tr>
  </table>
</div>

<script>
   function check()
  {
    debugger;
    console.log("mohit");
          console.log("baap");

      var a=document.getElementById("name2").value;
      console.log(document.getElementById("name2").value);
     
     // document.getElementsByTagName("A")[0].setAttribute("href" "name2="+a);
    
  }
</script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.0.js"></script>

</body>
</html>