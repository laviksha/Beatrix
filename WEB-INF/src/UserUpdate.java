package beatrix;
import java.sql.*;
public class UserUpdate 
{
	private String  name; 
	private String  password;
	private String 	id2;
	ResultSet rst;
	private DConnection db=new DConnection();
	
	public void updateName(String name,String id)
	{	
		db.executeOther("update user set user_name = '"+name+"' where user_id ="+id);
		db.close();
	}

	public void updatePassword(String pass,String id)
	{	
		db.executeOther("update user set password = '"+pass+"' where user_id = "+id);
		db.close();
	}
	
}
 