<%@ page import="beatrix.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/cssnew.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<script>
  function stopAudio() {
    var savePlayer = $('#plHolder').html(); // Save player code
    $('#audioPlayer').remove(); // Remove player from DOM
    $('#plHolder').html(savePlayer); // Restore it
}
</script>

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
#playlist{
	list-style: none;

}
#playlist li a{
	color: black;
	text-decoration: none;
}
#playlist .current-song a{
	color: blue;

}

</style>
<script src="js/jquery-1.11.1.min.js"></script>
 

</head>
<%
DConnection db=new DConnection();
int cnt=0;

 ResultSet rst2=db.executeSelect("select count(*) from song_display");
    while(rst2.next())
    {
    cnt=rst2.getInt(1);
    }
%>
<body class="w3-light-grey" onload="stopAudio()">

<!-- Top container -->
<div class="w3-container w3-top w3-black w3-large w3-padding" style="z-index:4;height: 50px;">
          <div class="w3-left">
          <button class="w3-button w3-hide-large w3-padding-0 w3-black w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i></button></div>
          <span class="w3-left"><a href="#contact" data-toggle="modal"><button type="submit" class="btn btn-primary btn-m">
          <span class="glyphicon glyphicon glyphicon-log-in" aria-hidden="true"></span> Login</button></span></a>

          <span class="w3-right" style=""><img src="images/Beatrix.png" height="20" width="105"></span>
          <div id="plHolder"><span><center><audio src="" controls id="audioPlayer">
		Sorry, your browser doesn't support Html5!
	</audio><center></span></div>
          
	
  
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    
    <div class="w3-col s8 w3-bar">
      <span><strong><span class='w3-tag w3-pink'>Beats This Week</span></strong></span><br>
      
    </div>
  </div>
  <hr style="border: 1px solid #000">
  <div class="w3-bar-block">


<%
        try
        {
          beatrix.CommonMethods s1=new beatrix.CommonMethods();

          int a=s1.max_counter();

          if(a==0)
          {
            out.print("<p><b>Singers Are <span class='w3-tag w3-teal'> Lazy This Week !</span></b></p>");
          }
          else
          {
             ResultSet rst1=db.executeSelect("select * from song_display where counter=5");
            rst1.absolute(1);
            for(int i=1;i<=100;i++)
            {
      
              out.print("<ul id='playlist'><li class='current-song'><a href='songs/"+rst1.getString(2)+"'>"+rst1.     getString(7)+"</a></li></ul>");
   
              rst1.next();
              if(rst1.isAfterLast())
                break;
            }
          }
          
        }
  catch(SQLException e)
  {
    out.print(e);
  }


%>
  <hr style="border: 1px solid #000">

    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i></a>

  </div>
  <div>
    <ul class="nav navbar-nav navbar-left">
        <li class="twitter"><a href="" target="blank"><i class="fa fa-twitter"></i></a></li>
        <li class="facebook"><a href="" target="blank"><i class="fa fa-facebook"></i></a></li>
        
      </ul>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
   <header class="w3-container" style="padding-top:22px">
   <div class="w3-panel w3-card-4 w3-black">
   <h3><font color="white">Top 10 Beats</font></h3>

   </div>
  </header> 

  <div class="w3-main" style="margin-left:250px">

  <div class="w3-row w3-padding-64">
    <div class="w3-twothird w3-container">

      
<%

        try
  {
          ResultSet rst=db.executeSelect("select * from song_display where rank<=10 order by rank");
          beatrix.CommonMethods s2=new beatrix.CommonMethods();

       rst.absolute(1);
      int b=s2.song_counter();
      if(b==0)
          {
            out.print("<h1><b>Empty<span class='w3-tag w3-teal'> List This Time !</span></b></h1>");
          }
          else
          {

    for(int i=1;i<=10;i++)
    {
      
      out.print("<ul id='playlist'><div class='panel panel-primary'><div class='panel-body'><ul class='media-list'><li class='media'><div class='media-left'><img src='songimages/"+rst.getString(5)+"' class='media-object' style='width:60px;height:75px;margin-top: 0px;' /></div><div class='media-body'><div class='current-song'><h4 class='media-heading'><a href='songs/"+rst.getString(2)+"'>"+rst.getString(7)+"</a></h4></div><label><p stle='margin: 0 102px 0px;'>Album- "+rst.getString(4)+"</p><p>Artist-"+rst.getString(9)+"</p></label><label style='float:right;'><font size=6>"+rst.getInt(6)+"</font></label></div></li></ul></div></div></ul>");
   
      rst.next();
      if(rst.isAfterLast())
        break;
      
    }
  
    }  
  }
  catch(SQLException e)
  {
    out.print(e);
  }

%>
</div>
<%
for(int i=20;i<25;i++)
  {
%>
<div class="w3-third w3-container w3-left">
      <p class="w3-border w3-padding-small w3-padding-32 w3-center"><img src="images2/<%=i%>.jpg" style="height:156px;"></p>
    </div>
  <%}%>
</div></div>



	<!-- <ul id="playlist">
    <div class='panel panel-primary' style='margin-top: 50px;'><div class='panel-body'>

		<li class="current-song"><a href="songs/Botal Khol.mp3">Botal Khol</a></li>
    </div></div>
        <div class='panel panel-primary' style='margin-top: 50px;'><div class='panel-body'>

		<li><a href="songs/Paani Wala Dance.mp3">Paani Wala Dance</a></li></div></div>
        <div class='panel panel-primary' style='margin-top: 50px;'><div class='panel-body'>

		<li><a href="songs/Palat Meri Jaan.mp3">Palat Meri Jaan</a></li></div></div>
	</ul>

   -->
  
  
  
 <hr style="border: 1px solid #f00">
  

  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
      <center><p>Copyrights <span class="glyphicon glyphicon-copyright-mark" aria-hidden="true"></span> Reserved by BEATRIX</p></center><br>

    <center><p class="w3-blue">Build and Developed with <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> </p></center>

  </footer>

  <!-- End page content -->
</div>

<div class="modal fade" id="contact" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<form class="form-horizontal" action="logincheck.jsp" method="post">
				<div class="modal-header">
					<h4>Login</h4>
				</div>
				<div class="modal-body">
          <form class="col-md-12 center-block" action="logincheck.jsp" method="post">
            <div class="form-group">
              <div class="input-group" style="margin-left: 60px;margin-right: 60px;">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-user"></span>
        </span>
        <input class="w3-input w3-border w3-animate-input" type="email" name="mailid" placeholder="mail id" style="width:50%">
<!--               <input type="email" name="mailid" class="form-control input-md" placeholder="mail id" style=" ">
 -->              
            </div>
            </div>
            <div class="form-group">
              <div class="input-group" style="margin-left: 60px;margin-right: 60px;">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-lock"></span>
        </span>
                <input class="w3-input w3-border w3-animate-input" type="password" name="pass" placeholder="Password" required="required" style="width:50%">

              <!-- <input type="password" name="pass" class="form-control input-md" placeholder="Password" required="required" style=""> -->
            </div>
            </div>
            
                 
				<div class="modal-footer">
          <span class="pull-left"><a href="verification.jsp?mode=forgot">Forgot password?</a></span>
          <a class="btn btn-primary" data-dismiss="modal">Close</a>
					<input type="submit" name="login" class="btn btn-danger" value="Login">
				</div>
				
			</div>
		</div>
	</div>
	</form></form>

<script>
// Get the Sidebar

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}

</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.0.js"></script>
    <script src="js/audioPlayer.js"></script>
     <script>
    	audioPlayer();
    </script>

<!-- //script for play-list -->
</body>
</html>
