<%@  page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" session="false"%>
<%@ page import="beatrix.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.DeferredFileOutputStream"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	beatrix.AdminDisplay s1=new beatrix.AdminDisplay();
	String user_id=request.getParameter("user_id");
	int song_id=Integer.parseInt(request.getParameter("song_id"));
	Vector<String []> v = s1.showRecord(song_id);
	String s[]=(String [])v.elementAt(0);//String song_name=request.getParameter("song_name");
	//String release_date=request.getParameter("release_date");
	//String display_name=request.getParameter("display_name");
	//String album=request.getParameter("album");

	String itemName="",itemName1="",song_name1="",release_date="",album="";
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) 
	{
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
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
    	try 
		{
			items = upload.parseRequest(request);
		} 
		catch (FileUploadException e) 
		{
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
		
		while (itr.hasNext()) 
		{
			FileItem item = (FileItem) itr.next();
			if (!item.isFormField())
			{
				try 
				{
					File savedFile=null;
					if(item.getFieldName().equals("uploadpic"))
					{
						itemName=item.getName();
						itemName=song_id+itemName.substring(itemName.lastIndexOf("."));

						savedFile = new File(config.getServletContext().getRealPath("/")+"songs/"+itemName);
					}
					item.write(savedFile);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			}
			if(!item.isFormField())
			{
				try
				{	
					String img_name=s1.getImageName(song_id);
					File x=new File(img_name);
					if(x.exists())
						x.delete(); 
					File savedFile1=null;
					if(item.getFieldName().equals("uploadpic1"))
					{
						itemName1=item.getName();
						itemName1=song_id+itemName1.substring(itemName1.lastIndexOf("."));

						savedFile1 = new File(config.getServletContext().getRealPath("/")+"songimages/"+itemName1);
					}
					item.write(savedFile1);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				} 

			}

			else
			{
				String fieldname = item.getFieldName();
				String fieldvalue = item.getString();
				
				if(fieldname.equals("display_name"))
					song_name1=fieldvalue;
				if(fieldname.equals("release_date"))
					release_date=fieldvalue;
				if(fieldname.equals("album"))
					album=fieldvalue;
				
			}
		}
	}

	s1.updateRecord(song_id,itemName,release_date,album,itemName1,song_name1);
	
%>
<jsp:forward page="admindisplay.jsp"></jsp:forward>
				
</body>
</html>