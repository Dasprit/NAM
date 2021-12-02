package daobjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBProcess {
	public String saveUserDetails(String name,String mail,String mobile,String address,String password){
		try(Connection con = DBConnect.getConnection();)
		{
			PreparedStatement st = con.prepareStatement("insert into UserData values(?,?,?,?,?)");
			st.setString(1, name);
			st.setString(2, mail);
			st.setString(3, mobile);
			st.setString(4, address);
			st.setString(5, password);
			
			st.executeUpdate();
			return "success";
			
		}
		catch(Exception e){
			System.out.println("error in DBProcess");
			e.printStackTrace();
			return "fail";
		}
	}
	
	
	public String updateUserDetails(String name,String mail,String mobile,String address,String password,String cmail){
		try(Connection con = DBConnect.getConnection();)
		{
			PreparedStatement st = con.prepareStatement("update UserData set name=?,mail=?,mobile=?,address=?,password=? where mail=?");
			st.setString(1, name);
			st.setString(2, mail);
			st.setString(3, mobile);
			st.setString(4, address);
			st.setString(5, password);
			st.setString(6, cmail);
			
			st.executeUpdate();
			return "success";
			
		}
		catch(Exception e){
			System.out.println("error in DBProcess");
			e.printStackTrace();
			return "fail";
		}
	}
	
	public ArrayList<String> loadUser(String mail){
		ArrayList<String> arr = new ArrayList<String>();
		try(Connection con = DBConnect.getConnection();)
		{
			PreparedStatement st = con.prepareStatement("select * from UserData where mail=?");
			st.setString(1, mail);
			
			
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				arr.add(rs.getString(1));
				arr.add(rs.getString(2));
				arr.add(rs.getString(3));
				arr.add(rs.getString(4));
				arr.add(rs.getString(5));
			}
			return arr;
			
		}
		catch(Exception e){
			System.out.println("error in DBProcess");
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<ArrayList<String>> loadProducts(String mail){
		ArrayList<ArrayList<String>> arr = new ArrayList<ArrayList<String>>();
		try(Connection con = DBConnect.getConnection();)
		{
			PreparedStatement st = con.prepareStatement("select pName,image,price,quantity from cart where email=?");
			st.setString(1, mail);
			
			
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				ArrayList<String> a = new ArrayList<String>();
				a.add(rs.getString(1));
				a.add(rs.getString(2));
				a.add(rs.getString(3));
				a.add(rs.getString(4));
				arr.add(a);
			}
			
			return arr;
			
		}
		catch(Exception e){
			System.out.println("error in DBProcess");
			e.printStackTrace();
			return null;
		}
	}
}
