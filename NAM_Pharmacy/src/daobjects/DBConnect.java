package daobjects;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection con;
	
	private DBConnect(){}
	
	public static Connection getConnection(){
		try{
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nam","root","PonDhineshKumar@1");
			return con;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
