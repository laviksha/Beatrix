package beatrix;
import java.sql.*;
public class AdminUpdate 
{
	private String  name; 
	private String  password;
	private String 	id2;
	ResultSet rst;
	private DConnection db=new DConnection();
	
	public void updateAdmin(String name,String pass,String id2)
	{	
		db.executeOther("update user set password = '"+pass+"' , admin_name = '"+name+"' where admin_id = '"+id2+"' and user_type='admin'  ");
		db.close();
	}
	
}
 