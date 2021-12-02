package daobjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class FetchTablets {
	public static ArrayList<ArrayList> load(String s){
		if(s.isEmpty()){
			return fetchTablets();
		}
		else{
			return search(s);
		}
		
	}
	
	public static ArrayList<ArrayList> fetchTablets(){
		ArrayList<ArrayList> ans = new ArrayList<ArrayList>();
		try(Connection con = DBConnect.getConnection();
				Statement st = con.createStatement(); )
			{
				ResultSet r = st.executeQuery("select * from tablets order by buttonName");
				while(r.next()){
					ArrayList al = new ArrayList();
					al.add(r.getInt(1));
					al.add(r.getString(2));
					al.add(r.getString(3));
					al.add(r.getString(4));
					al.add(r.getString(5));
					al.add(r.getFloat(6));
					al.add(r.getString(7));
					ans.add(al);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		System.out.println(ans.size());
		return ans;
	}
	
	public static ArrayList<ArrayList> search(String s){
		ArrayList<ArrayList> ans = new ArrayList<ArrayList>();
		try(Connection con = DBConnect.getConnection();
				PreparedStatement st = con.prepareStatement("select * from tablets where buttonName like ? order by buttonName;");)
			{
				st.setString(1, s+"%");
				ResultSet r = st.executeQuery();
				
				while(r.next()){
					ArrayList al = new ArrayList();
					al.add(r.getInt(1));
					al.add(r.getString(2));
					al.add(r.getString(3));
					al.add(r.getString(4));
					al.add(r.getString(5));
					al.add(r.getFloat(6));
					al.add(r.getString(7));
					ans.add(al);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		System.out.println(ans.size());
		return ans;
	}
}
