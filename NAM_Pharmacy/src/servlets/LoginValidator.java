package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daobjects.DBConnect;

@SuppressWarnings("serial")
@WebServlet("/LoginValidator")
public class LoginValidator extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PrintWriter pw = response.getWriter();
		
		try{
			Connection con = DBConnect.getConnection();
			PreparedStatement st = con.prepareStatement("select * from UserData where mail=? and password=?");
			st.setString(1,email);
			st.setString(2,password);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				//System.out.println("success");
				pw.print("success");
			}
			else{
				//System.out.println("fail");
				pw.print("fail");
			}
			
		}
		catch(Exception e){
			pw.print("fail");
			e.printStackTrace();
		}
		
		//System.out.println("Login :"+res);
		
	}
}
