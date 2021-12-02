import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daobjects.DBConnect;

@WebServlet("/addToCart")
public class addToCart extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw = resp.getWriter();
		System.out.print("add To Cart");
			try{
				String name = req.getParameter("name");
				String mail = req.getParameter("mail");
				Connection con = DBConnect.getConnection();
				PreparedStatement st = con.prepareStatement("select image,price,tabId from tablets where buttonName=?;");
				st.setString(1, name);
				ResultSet rs = st.executeQuery();
				ArrayList<String> arr = new ArrayList<String>();
				while(rs.next()){
					arr.add(rs.getString(1));
					arr.add(rs.getString(2));
					arr.add(rs.getString(3));
				}
				st = con.prepareStatement("insert into cart(pName,email,image,price,tabId,quantity) values(?,?,?,?,?,?);");
				st.setString(1,name);
				st.setString(2,mail);
				st.setString(3, arr.get(0));
				st.setString(4, arr.get(1));
				st.setString(5, arr.get(2));
				st.setInt(6, 1);
				st.executeUpdate();
				pw.print("yes");
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
}
