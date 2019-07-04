<%@ page import="java.sql.*,java.util.*" session="false"%>
<%@page import="java.sql.SQLException"%>

<%@page import="beatrix.*"%>

<html> 
	<head> 
	<meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">!-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Critic Registeration</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- CUSTOM -->
    	<link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
    		
    		
     <link href="css/Custom.css" rel="stylesheet">
     	
     	<link href="css/font-awesome.min.css" rel="stylesheet">
    
		<script type="text/javascript">
			function validation()
			{
        
				if(document.forms.form1.sname.value.trim()=="")
				{
					alert("Type your name");
					return false;
				}
        
				else if(document.forms.form1.pass.value=="")
				{
					alert("Type your password");
					return false;
				}
				else if(document.forms.form1.retype.value=="")
				{
					alert("ReType your password");
					return false;
				}
				else if(document.forms.form1.pass.value != document.forms.form1.retype.value)
 				{
					alert("password & retype password mismatch");
					return false;
				}
      

			}
			function pas()
			{
				var a=document.getElementById("pass").value;
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
		int user_id=Integer.parseInt(request.getParameter("user_id"));
%>

		<div class="modal-dialog">
      <div class="madal-content">
        <div class="modal-header">
          <h1 class="text-center">Critc Register</h1>

        </div>
        <div class="modal-body">
          <form class="col-md-12 center-block" action="otp_check.jsp?user_id=<%=user_id%>&mode=register" method="post" name="form1">
          <div class="form-group">
              <div class="input-group">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-user"></span>
        </span>
              <input type="text" name="sname" class="form-control input-lg" placeholder="Full Name" required="required">
            </div>

            </div>

             <div class="form-group">
              <div class="input-group">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-envelope"></span>
        </span>
                        <input type="email" name="email" class="form-control input-lg" placeholder="Email Id" required="required" >
                        </div>
                        </div>


        
          <div class="form-group">
              <div class="input-group">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-lock"></span>
        </span>
              <input type="password" name="pass" class="form-control input-lg" placeholder="Password" required="required" required title="Plz Enter minimum 6 character" pattern="[a-zA-Z0-9]{6,20}" id="pass" onkeydown="pas()" >
            </div>

            </div>


          <div class="form-group">
              <div class="input-group">
            
              <div id="ps" style="visibility:hidden; width:185px; height:7px;"></div>
               </div>
            </div>  

            </div>



          <div class="form-group">
              <div class="input-group">
            <span class="input-group-addon">
          <span class="glyphicon glyphicon-lock"></span>
        </span>

                          <input type="password" name="retype" class="form-control input-lg" placeholder="Re-Type Password" required="required" onchange="pas()">
                          </div>
                          </div>


          
         <div class="form-group">
            <div class="form-group">
              <input type="submit" name="b1" class="btn btn-block btn-lg btn-primary" value="Sign In" onclick=" return validation()"><input type="reset" name="b1" class="btn btn-block btn-lg btn-primary" value="Reset">
            </div>
            </div>
          </form>
          <div class="modal-footer">
            <div class="col-md-12">
              <a href="dashboard.jsp?user_id=<%=user_id%> "><button class="btn">Cancel</button></a>

            </div>
            
          </div>
        </div>
    
      </div>

       

    
    </div>

    
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    
	</body>
</html>