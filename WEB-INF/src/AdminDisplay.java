package beatrix;
import java.sql.*;
import java.util.*;
public class AdminDisplay {

		public void addRecord(int song_id,String song_name,String release_date,String album,String album_cover,String display_name,int counter,String artist)
		{
			DConnection db=new DConnection();
			db.executeOther("insert into song_display(song_id,song_name,release_date,album,album_cover,display_name,counter,artist) values("+song_id+",'"+song_name+"','"+release_date+"','"+album+"','"+album_cover+"','"+display_name+"',"+counter+",'"+artist+"')");
			db.close();
		}
		public void deleteRecord(int song_id)
		{
	                            DConnection db=new DConnection();
			db.executeOther("delete from song_display where song_id="+song_id);
			db.close();
		}
		public void updateRecord(int song_id,String song_name,String release_date,String album,String album_cover,String display_name)
		{
			DConnection db=new DConnection();
			db.executeOther("update song_display set release_date='"+release_date+"', album='"+album+"', album_cover='"+album_cover+"', display_name='"+display_name+"' where song_id="+song_id);
			db.close();
		}
		public void updateRank(int song_id, int rank, int user_id)
		{
			DConnection db=new DConnection();
			ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select rank_id from user where user_id="+user_id);
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			db.executeOther("update critics_rank set c"+r+"_rank="+rank+" where song_id="+song_id);
			db.close();
		}
		/*public int updateRecord(int oldid,String newsubcat_name,int cat_id, String subcat_pic)
		{
			DConnection db=new DConnection();
			int cnt=db.executeOther("update subcategory set subcat_name='"+newsubcat_name+"' , cat_id="+cat_id+", subcat_pic='"+subcat_pic+"' where subcat_id="+oldid);
			db.close();
			return cnt;
		}*/
		public Vector<String []> showRecordAll()
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select * from song_display order by song_id");
				while(rst.next())
				{	String s[]=new String[8];
					for(int i=0;i<2;i++)
					{
						s[i]=rst.getString(i+1);
					}
					s[2]=rst.getString(3);
					s[3]=rst.getString(4);
					s[4]=rst.getString(5);
					s[5]=rst.getString(6);
					s[6]=rst.getString(7);
					s[7]=rst.getString(9);


					v1.addElement(s);
				}
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
			db.close();
			return v1;
		}

		public Vector<String []> showRecordAllToCritic(String rank_id)
		{
			Vector<String[]> v1=new Vector<String[]>();
			DConnection db=new DConnection();
			try
			{	ResultSet rst=db.executeSelect("select song_display.*, critics_rank.c"+rank_id+"_rank from song_display, critics_rank  where song_display.song_id=critics_rank.song_id order by song_id ");
				
				while(rst.next())
				{
					String s[]=new String[8];	
					for(int i=0;i<2;i++)
					{
						s[i]=rst.getString(i+1);
					}
					s[2]=rst.getString(3);
					s[3]=rst.getString(4);
					s[4]=rst.getString(5);
					s[5]=rst.getString(10);
					s[6]=rst.getString(7);
					s[7]=rst.getString(9);

					v1.addElement(s);
				}
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
			db.close();
			return v1;
		}	
		public Vector<String []> showRecord(int id)
		{
			Vector<String[]> v1=new Vector<String[]>();
			String s[]=new String[8];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from song_display where song_id="+id);
				if(rst.next())
				{
					for(int i=0;i<8;i++)
						s[i]=rst.getString(i+1);
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			v1.addElement(s);
			db.close();
			return v1;
		}


		/*public Vector<String []> showRecord(int subcat_id)
		{
			Vector<String[]> v1=new Vector<>();
			String s[]=new String[3];
			DConnection db=new DConnection();
			try
			{
				ResultSet rst=db.executeSelect("select * from subcategory where subcat_id="+subcat_id);
				if(rst.next())
				{
					for(int i=0;i<3;i++)
						s[i]=rst.getString(i+1);
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			v1.addElement(s);
			db.close();
			return v1;
		}	*/
		public int maxId()
		{
			DConnection db=new DConnection();
			ResultSet rst;
			int r=0;
			try
			{
				rst=db.executeSelect("select max(song_id) from song_display");
				rst.next();
				r=rst.getInt(1);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return r;
		}
		
	public String getSongName(int id)
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

	public int deletecheck(int subcat_id)
	{
		DConnection db=new DConnection();
		int i=0;
		try{
			ResultSet rst=db.executeSelect("select * from product where subcat_id="+subcat_id);
			while(rst.next())
			{
				i++;
			}
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return i;
	}  			
	public String getImageName(int song_id)
	{
		DConnection db=new DConnection();
		ResultSet rst;
		String name="";
		try
		{
			rst=db.executeSelect("select album_cover from song_display where song_id="+song_id);
			rst.next();
			name=rst.getString(1);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return name;
	}
}
