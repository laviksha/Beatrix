package beatrix;
import java.sql.*;
import java.io.*;
import java.util.*;
import beatrix.DConnection;
public class CommonMethods 
{

	ResultSet rst;
	public String getUserName(int user_id)
	{
		String userName="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select user_name from user where user_id="+user_id+" and user_type='critics'");
			rst.next();
			userName=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return userName;
	}
	public String getUserName(String mail)
	{
		String userName="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select user_name from user where mail_id='"+mail+"'");
			rst.next();
			userName=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return userName;
	}
	public void addCritics(int user_id, String mail_id, String pass, String user_name)
	{
		
			DConnection db=new DConnection();
			db.executeOther("insert into user(user_id,mail_id,password,user_name,user_type) values("+user_id+",'"+mail_id+"','"+pass+"','"+user_name+"','critics')");
			db.close();
	}
	public int maxId()
	{
		DConnection db=new DConnection();
		ResultSet rst;
		int r=0;
		try
		{
			rst=db.executeSelect("select max(user_id) from user");
			rst.next();
			r=rst.getInt(1);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return r;
	}
	public String getAdminName(String user_id)
	{
		String userName="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select user_name from user where user_id='"+user_id+"' and user_type='admin' ");
			rst.next();
			userName=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return userName;
	}
	public String getCriticsName(String user_id)
	{
		String userName="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select user_name from user where user_id='"+user_id+"' and user_type='critics' ");
			rst.next();
			userName=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return userName;
	}
	public String getCriticsRank(String user_id)
	{
		String rank="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select rank_id from user where user_id='"+user_id+"' and user_type='critics' ");
			rst.next();
			rank=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rank;
	}
	public String Check_Rank(String rank,int rank_id)
	{
		String msg="";
		int cnt=0;
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select count(*) from critics_rank where c"+rank_id+"='"+rank+"' ");
			rst.next();
			cnt=rst.getInt(1);
			if(cnt!=0)
			{
				msg="Rank Already Exists";
			}

			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return msg;
	}
	public Vector<String []> getAllCritics()
	{
		Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select user_id, user_name, mail_id, rank_id from user where user_type='critics'");
				while(rst.next())
				{	
					String s[]=new String[5];
					s[0]=rst.getString(1);
					s[1]=rst.getString(2);
					s[2]=rst.getString(3);
					s[3]=rst.getString(4);

					v1.addElement(s);
				}
			}
			catch(SQLException e)
			{	
				e.printStackTrace();
			}
			db.close();
			return v1;
	}
	public void deleteCritic(String user_id)
	{
        DConnection db=new DConnection();
		db.executeOther("delete from user where user_id="+user_id);
		db.close();
	}

	public void updateAdminName(String name)
	{
        DConnection db=new DConnection();
		db.executeOther("update user set user_name='"+name+"' where user_type='admin'");
		db.close();
	}
	public void updateCriticsRank(String critics_id,String rankid)
	{
        DConnection db=new DConnection();
		db.executeOther("update user set rank_id='"+rankid+"' where user_id='"+critics_id+"'");
		db.close();
	}
	public void temprtg(float total_rtg,int song_id)
	{
		
		DConnection db=new DConnection();
			db.executeOther("update critics_rank set total_rtg="+total_rtg+" where song_id="+song_id+"");
			db.close();
	}
	public void cummrtg(float wtotal_rtg,int wsong_id)
	{
		DConnection db=new DConnection();
		db.executeOther("update rank_calculate set total_rtg="+wtotal_rtg+" where song_id="+wsong_id+"");
		db.close();
	}
	public void transferid(int song_id)
	{
		DConnection db=new DConnection();
		db.executeOther("insert into rank_calculate(song_id) values("+song_id+")");
		db.executeOther("insert into critics_rank(song_id) values("+song_id+")");

	}
	public void sort()
	{
		
		DConnection db=new DConnection();
			db.executeOther("select * from critics_rank order by total_rtg desc");
			db.close();
	}
	public void nullify()
	{
		
		DConnection db=new DConnection();
			db.executeOther("update song_display set rank=NULL");
			db.executeOther("update critics_rank set temp_rank=NULL");
			db.close();
	}
	public void nullifyweek()
	{
		
		DConnection db=new DConnection();
			db.executeOther("update rank_calculate set w1_rank=0");
			db.executeOther("update rank_calculate as r inner join(select song_id,w2_rank from rank_calculate)as rc on r.song_id=rc.song_id set r.w1_rank=rc.w2_rank");

			db.executeOther("update rank_calculate set w2_rank=0");
			db.executeOther("update rank_calculate as r inner join(select song_id,w3_rank from rank_calculate)as rc on r.song_id=rc.song_id set r.w2_rank=rc.w3_rank");

			db.executeOther("update rank_calculate set w3_rank=0");
			db.executeOther("update rank_calculate as r inner join(select song_id,w4_rank from rank_calculate)as rc on r.song_id=rc.song_id set r.w3_rank=rc.w4_rank");

			db.executeOther("update rank_calculate set w4_rank=0");
			db.executeOther("update rank_calculate as r inner join(select song_id,w5_rank from rank_calculate)as rc on r.song_id=rc.song_id set r.w4_rank=rc.w5_rank");

			db.executeOther("update rank_calculate set w5_rank=0");
			db.executeOther("update rank_calculate as r inner join(select song_id,temp_rank from critics_rank)as cr on r.song_id=cr.song_id set r.w5_rank=cr.temp_rank");
			
			db.close();
	}

	public void nullifycritics()
	{
		
		DConnection db=new DConnection();
			db.executeOther("update critics_rank set c1_rank=0");

			db.executeOther("update critics_rank set c2_rank=0");

			db.executeOther("update critics_rank set c3_rank=0");

			db.executeOther("update critics_rank set c4_rank=0");

			db.executeOther("update critics_rank set c5_rank=0");
			db.executeOther("update critics_rank set total_rtg=0");
			db.executeOther("update critics_rank set temp_rank=0");
			
			db.close();
	}

	public void ranker(int m)
	{
		
		DConnection db=new DConnection();
		db.executeOther("update critics_rank as c inner join(select song_id from critics_rank order by total_rtg desc limit "+m+",1)as crank on crank.song_id=c.song_id set c.temp_rank="+(m+1)+"");

		db.close();
	}

	public void wranker(int m)
	{
		
		DConnection db=new DConnection();
		db.executeOther("update rank_calculate as r inner join(select song_id from rank_calculate order by total_rtg desc limit "+m+",1)as rrank on rrank.song_id=r.song_id set r.cumm_rank="+(m+1)+"");

		db.close();
	}

	public void ranker_main()
	{
		
		DConnection db=new DConnection();
		db.executeOther("update song_display as s inner join(select song_id,cumm_rank from rank_calculate)as r on s.song_id=r.song_id set s.rank=r.cumm_rank");

		db.close();
	}


	public void reduce_counter()
	{
		
		DConnection db=new DConnection();
		db.executeOther("update song_display as s inner join(select song_id from song_display where counter=1)as sd on s.song_id=sd.song_id set s.counter=0");
		db.executeOther("update song_display as s inner join(select song_id from song_display where counter=2)as sd on s.song_id=sd.song_id set s.counter=1");
		db.executeOther("update song_display as s inner join(select song_id from song_display where counter=3)as sd on s.song_id=sd.song_id set s.counter=2");
		db.executeOther("update song_display as s inner join(select song_id from song_display where counter=4)as sd on s.song_id=sd.song_id set s.counter=3");
		db.executeOther("update song_display as s inner join(select song_id from song_display where counter=5)as sd on s.song_id=sd.song_id set s.counter=4");
		db.executeOther("update rank_calculate set counter= NULL");
		db.executeOther("update rank_calculate as r inner join(select song_id,counter from song_display)as sd on r.song_id=sd.song_id set r.counter=sd.counter");
		db.executeOther("truncate deletion");
	}	
	public void auto_deletion()
	{
		DConnection db=new DConnection();
		ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select song_id from rank_calculate where counter=0 and total_rtg=0");
				while(rst.next())
				{
					r=rst.getInt(1);
					db.executeOther("insert into deletion values("+r+")");
				}	
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			db.executeOther("delete song_display from song_display inner join deletion on song_display.song_id=deletion.song_id where song_display.song_id=deletion.song_id");
			db.executeOther("delete rank_calculate from rank_calculate inner join deletion on rank_calculate.song_id=deletion.song_id where rank_calculate.song_id=deletion.song_id");
			db.executeOther("delete critics_rank from critics_rank inner join deletion on critics_rank.song_id=deletion.song_id where critics_rank.song_id=deletion.song_id");

	}

	public int max_counter()
	{
		
		DConnection db=new DConnection();
			ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select count(*) from song_display where counter=5");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
	}
	public int song_counter()
	{
		
		DConnection db=new DConnection();
			ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select count(*) from song_display");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
	}
	

	public static String getSongName(int id)
	{
		DConnection db=new DConnection();
		String name="";
		try{
			ResultSet rst=db.executeSelect("select song_name from song_display where song_id="+id);
			rst.next();
			name=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return name;
	}
	    
	public int count(String mail)
	{
		int cnt=0;
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select count(*) from user where mail_id='"+mail+"'");
			rst.next();
			cnt=rst.getInt(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public int passwordVerification(String password, String id)
	{
		int cnt=0;
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select count(*) from user where password='"+password+"' and user_id="+id);
			rst.next();
			cnt=rst.getInt(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public String getPassword(String mail)
	{
		String password="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select password from user where mail_id='"+mail+"'");
			rst.next();
			password=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return password;
	}
	public String getMailId(String id)
	{
		String mail_id="";
		try
		{
			DConnection db=new DConnection();
			ResultSet rst=db.executeSelect("select mail_id from user where user_id="+id);
			rst.next();
			mail_id=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return mail_id;
	}
	/*public String Artist(String song1)
	{
		String artist="";
		try 
		{

            File song = new File(""+song1+"");

            FileInputStream file = new FileInputStream(song);

            int size = (int)song.length();

            file.skip(size - 128);

            byte[] last128 = new byte[128];

            file.read(last128);

            String id3 = new String(last128);

            String tag = id3.substring(0, 3);
            artist=id3.substring(33,62);


            if (tag.equals("TAG")) 
            {

                System.out.println("Title: " + id3.substring(3, 32));

                System.out.println("Artist: " + id3.substring(33, 62));

                System.out.println("Album: " + id3.substring(63, 91));

                System.out.println("Year: " + id3.substring(93, 97));
            }

            file.close();

        } 
        catch (Exception e) 
        {

            System.out.println("Error - " + e.toString());
		}
		  return artist;
    }*/
}