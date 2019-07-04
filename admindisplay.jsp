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
	String user_id=request.getParameter("user_id");

%>      
<div class="w3-container w3-top w3-black w3-large w3-padding" style="z-index:4;height: 50px;">
<span class="w3-right" style=""><img src="images/Beatrix.png" height="20" width="105"></span>
          <form action="logout.jsp" method="post">
	<button type="submit" class="btn btn-danger" aria-label="Left Align">
		<span class="glyphicon glyphicon glyphicon-off" aria-hidden="true"></span> Logout
	</button>
	<a href="dashboard.jsp?user_id=<%=user_id%>" class="btn btn-primary btn-md">
	
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
	
	
	beatrix.AdminDisplay s1=new beatrix.AdminDisplay();
		beatrix.CommonMethods s2=new beatrix.CommonMethods();

	if("display".equals(mode))
	{
		Vector<String []> v = s1.showRecordAll();
%>      <center>
		<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Song Details </a> </h3>
</div>
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
				<tr class="w3-teal">
		<th>Song Id</th> 		<th>Song Name</th>
		<th>Release Date</th>	<th>Album</th>	<th>Album Cover</th>	<th>Rank</th> <th>Display Name</th><th>Artist</th>	<th></th><th></th></tr>
<%		
		for(int i=0;i<v.size();i++)
		{
%>
			<tr>
<%			
			String s[]=(String [])v.elementAt(i);
			for(int j=0;j<4;j++)
			{
%>
				<td><%=s[j] %></td>
<%				
			}
%>
				<td><img src="/./beatrix/songimages/<%=s[4]%>" alt="song_img" style="width:40px;height:40px" /></td>
				<td><%=s[5]%></td>
				<td><%=s[6]%></td>
				<td><%=s[7]%></td>
				<td><a href="admindisplay.jsp?song_id=<%=s[0]%>&song_name=<%=s[1]%>&album_cover=<%=s[4]%>&mode=edit&user_id=<%=user_id%>"><button class="btn btn-primary">
				<span class="glyphicon glyphicon-pencil"></span> Edit
			</button></a></td>
				<td><a href="admindisplay.jsp?song_id=<%=s[0] %>&mode=delete&user_id=<%=user_id%>"><button class="btn btn-danger">
				<span class="glyphicon glyphicon-trash"></span> Delete
			</button></a></td>
			</tr>
<%
		}
%>
		</table>
		</div>
		<% } %>
		</div>
		</div>
		</div>
		</div>
		
		<a href="admindisplay.jsp?mode=add&user_id=<%=user_id%>">
			<button class="btn btn-primary">
				<span class="glyphicon glyphicon-music"></span> Add
			</button>
		</a>

		<a href="dashboard.jsp?user_id=<%=user_id%>">
		<button class="btn btn-primary">
          <span class="glyphicon glyphicon-hand-left"></span> Back
          </button>
        </a><br><br><br><br>
<%
		return;
	}
	else if("delete".equals(mode))
	{
		int song_id=Integer.parseInt(request.getParameter("song_id"));
		Vector<String []> v = s1.showRecord(song_id);
		String s[]=(String [])v.elementAt(0);
	
		try{
    		File file = new File(config.getServletContext().getRealPath("/")+"songs/"+s[1]);

    		if(file.exists()){
    			file.delete();
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	try{
    		File file1 = new File(config.getServletContext().getRealPath("/")+"songimages/"+s[4]);

    		if(file1.exists()){
    			file1.delete();
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		s1.deleteRecord(song_id);
	}
		
	else if("edit".equals(mode))
	{
		int song_Id=Integer.parseInt(request.getParameter("song_id"));
		Vector<String []> v = s1.showRecord(song_Id);
		String s[]=(String [])v.elementAt(0);//String song_name=request.getParameter("song_name");
	        //String cat_name=request.getParameter("cat_name");
		//String album_cover=request.getParameter("album_cover");	
	      
%>
		<form action="songedit.jsp?song_id=<%=song_Id%>&user_id=<%=user_id%>" method="post" name="editform" enctype="multipart/form-data" onSubmit="return check1();">
	<div class="panel-group" id="accordion" style="margin-top:70px;">
	<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-heading">
			<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Edit Song Details </a> </h3>
	</div>
	<div id="collpaseone" class="panel-collapse collapse in">
	<div class="panel-body">
			<div class="w3-responsive">

		<table border="1" width="500px" class="table table-bordered table-striped" >
		
		
		<tr>
		<td>Release date* :</td>
		<td><input type="text" id="add_date" name="release_date" value="<%=s[2]%>" /> (YY-MM-DD)</td>
		</tr>
		<tr>
		<td>Album Name* :</td>
		<td><input type="text" id="addname" name="album" value="<%=s[3]%>" /></td>
		</tr>
		<tr>
		<td>Song Name* : </td>
		<td><input id="addname" type="text" name="display_name" value="<%=s[6]%>" /></td>
		</tr>        
		
		<tr>
		<td><img src="/./beatrix/songimages/<%=s[4]%>" style="width:30px;height:30px" /></td>
		<td><input type="file" name="uploadpic1" size="200000" id="picname" value="/./beatrix/songs/<%=s[4]%>"/></td>
		</tr>              
		<tr><td>Change Song :</td>
		<td><input type="file" name="uploadpic" size="200000" id="picname" value="/./beatrix/songs/<%=s[1]%>"/></td>
		</tr>
		<tr><td colspan="2" align="center"><button class="btn btn-primary" type="submit">
				<span class="glyphicon glyphicon-save"></span> Save
			</button></td></tr>
		</table>
		</div>
		</div>
		</div> 
		</div>
		</div>
		</form>
			<a href="admindisplay.jsp?user_id=<%=user_id%>&mode=display">
          <button class="btn btn-primary"><span class="glyphicon glyphicon-hand-left"></span> Back
        </button></a><br><br><br><br>

	
		
	<%
		return;
	}
	
	else if("add".equals(mode))
	{
		int r=s1.maxId()+1;
				//Vector<String []> v = s1.getSongName(song_id);

			//Vector<String []> v = s1.showcatid();
%>
	<form action="songsave.jsp?song_id=<%=r %>&user_id=<%=user_id%>" method="post" name="addform" enctype="multipart/form-data" onSubmit="return check1();">
	<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Add Song Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
			<div class="w3-responsive">

			<table border="1" width="500px" class="table table-bordered table-striped" >
		
	<tr>
	<td>Song Id</td>
	<td><input type="text" name="song_id" value="<%=r%>" readonly="readonly"/></td>
	</tr>
	<tr>
	<td>Song Name</td>
	<td><input id="addname" type="text" name="song_name"/></td>
	</tr>
	<tr>
		<td>Release date</td>
			<td><input type="text" id="add_date" name="release_date"/> (YY-MM-DD)</td>
	</tr>
	<tr>
		<td>Album Name</td>
			<td><input type="text" id="addname" name="album"/></td>

	</tr>
	<tr>
		<td>Artist</td>
			<td><input type="text" id="addname" name="artist"/></td>

	</tr>

	<tr>
		<td>Change Album Image</td>
		<td><input type="file" name="uploadpic1" size="200000" id="picname" value="uploadpic1"/></td>
	</tr>
              
<tr><td>Change Song:</td>
<td><input type="file" name="uploadpic" size="200000" id="picname" value="uploadpic"/></td></tr>
	<tr><td colspan="2" align="center">
			<input type="submit" class="btn btn-primary" value="save" name="submit"/>
			<a href="admindisplay.jsp?user_id=<%=user_id%>" class="btn btn-primary">
			
          		<span class="glyphicon glyphicon-hand-left"></span> Back
          	
        	</a>
		</td>
	</tr>
	</table>
		</div>
		</div>
		</div>
		</div>
		</div>
	</form>
<%
		return;
	}
		

%>
	<jsp:include page="admindisplay.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.0.js"></script>

</body>
</html>