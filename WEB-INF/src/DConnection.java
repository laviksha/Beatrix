package beatrix;
import java.sql.*;
public class DConnection 
{
	Connection conn;
	Statement stmt;
	ResultSet rst;
	public DConnection()
	{
		executeOther("create table if not exists user(user_id int auto_increment primary key, mail_id varchar(255), password varchar(255), user_name varchar(255), user_type varchar(255),rank_id varchar(10) unique check (rank_id<6))");
		close();
		int cnt=0;
		try
		{
			rst=executeSelect("select count(*) from user");
			rst.next();
			cnt=rst.getInt(1);
			close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		if(cnt==0)
		{
			executeOther("insert into user values('1','admin@admin.com','admin','admin','admin','NULL')");
			close();
		}
		executeOther("create table if not exists song_display(song_id int auto_increment primary key, song_name varchar(255), release_date date, album varchar(255), album_cover varchar(255), rank int,display_name varchar(255),counter int(10),artist varchar(255))");
		close();
		executeOther("create table if not exists rank_calculate(song_id int primary key, counter int, w1_rank int, w2_rank int, w3_rank int, w4_rank int, w5_rank int, total_rtg float(2),cumm_rank int)");
		close();
		executeOther("create table if not exists critics_rank(song_id int primary key, c1_rank int default 0, c2_rank int default 0, c3_rank int default 0, c4_rank int default 0, c5_rank int default 0, total_rtg float(2) default 0, temp_rank int)");
		close();

		executeOther("create table if not exists deletion(song_id int primary key)");
		close();
	}
	public int executeOther(String qry)//insert,delete,update
	{
		int cnt=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/beatrix","root","root");
			stmt=conn.createStatement();
			cnt=stmt.executeUpdate(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public ResultSet executeSelect(String qry)//select
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/beatrix","root","root");
			stmt=conn.createStatement();
			rst=stmt.executeQuery(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}		
		return rst;
	}
	
	public void close()
	{
		try
		{
			stmt.close();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();			
		}
	}
}
