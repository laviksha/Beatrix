<%@ page import="beatrix.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%
DConnection db=new DConnection();
	beatrix.CommonMethods s1=new beatrix.CommonMethods();
String user_id=request.getParameter("user_id");
int rtg1=0,rtg2=0,rtg3=0,rtg4=0,rtg5=0,song_id=0,del_song_id=0,wsong_id=0;
float wrtg1=0,wrtg2=0,wrtg3=0,wrtg4=0,wrtg5=0;

int c1_rank=0,c5_rank=0,c4_rank=0,c3_rank=0,c2_rank=0;
int w1_rank=0,w5_rank=0,w4_rank=0,w3_rank=0,w2_rank=0;
float total_rtg=0,wtotal_rtg=0;
try
{
	s1.nullify();
 ResultSet rst2=db.executeSelect("select * from critics_rank");
 while(rst2.next())
    {
    	song_id=rst2.getInt(1);
 		c1_rank=rst2.getInt(2);
 		c2_rank=rst2.getInt(3);
 		c3_rank=rst2.getInt(4);
 		c4_rank=rst2.getInt(5);
 		c5_rank=rst2.getInt(6);
	
		if(c1_rank==0)
		{
			rtg1=0;
		}
		else
		{
			rtg1=(11-c1_rank)*10;
		}

		if(c2_rank==0)
		{
			rtg2=0;
		}
		else
		{
			rtg2=(11-c2_rank)*10;
		}

		if(c3_rank==0)
		{
			rtg3=0;
		}
		else
		{
			rtg3=(11-c3_rank)*10;
		}

		if(c4_rank==0)
		{
			rtg4=0;
		}
		else
		{
			rtg4=(11-c4_rank)*10;
		}

		if(c5_rank==0)
		{
			rtg5=0;
		}
		else
		{
			rtg5=(11-c5_rank)*10;
		}
		total_rtg=(rtg1+rtg2+rtg3+rtg4+rtg5)/5;

		s1.temprtg(total_rtg,song_id);
	}

		
		for(int n=1;n<=10;n++)
		{
			s1.ranker(n-1);
		}
/*	  try
  {
          ResultSet rst=db.executeSelect("select * from critics_rank");
             
    int s_id,tmpr,rtg;
       while(rst.next())
       {
       		s_id=rst.getInt(1);
       		tmpr=rst.getInt(8);
       		rtg=rst.getFloat(7);

       }
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}*/

		s1.nullifyweek();

	ResultSet rst3=db.executeSelect("select * from rank_calculate");
 	while(rst3.next())
    {
    	wsong_id=rst3.getInt(1);
 		w1_rank=rst3.getInt(3);
 		w2_rank=rst3.getInt(4);
 		w3_rank=rst3.getInt(5);
 		w4_rank=rst3.getInt(6);
 		w5_rank=rst3.getInt(7);
		
		if(w1_rank==0)
		{
			wrtg1=0;
		}
		else
		{
			wrtg1=((11-w1_rank)*10)*(float)(0.04);
		}

		if(w2_rank==0)
		{
			wrtg2=0;
		}
		else
		{
			wrtg2=((11-w2_rank)*10)*(float)(0.12);
		}

		if(w3_rank==0)
		{
			wrtg3=0;
		}
		else
		{
			wrtg3=((11-w3_rank)*10)*(float)(0.20);
		}

		if(w4_rank==0)
		{
			wrtg4=0;
		}
		else
		{
			wrtg4=((11-w4_rank)*10)*(float)(0.28);
		}

		if(w5_rank==0)
		{
			wrtg5=0;
		}
		else
		{
			wrtg5=((11-w5_rank)*10)*(float)(0.36);
		}
		wtotal_rtg=(wrtg1+wrtg2+wrtg3+wrtg4+wrtg5);
		s1.cummrtg(wtotal_rtg,wsong_id);
	}
		
		for(int n=1;n<=10;n++)
		{
			s1.wranker(n-1);
		}
		s1.ranker_main();
	
			response.sendRedirect("dashboard.jsp?user_id="+user_id);
}

catch(SQLException e)
{
	e.printStackTrace();
}


%>
</body>
</html>