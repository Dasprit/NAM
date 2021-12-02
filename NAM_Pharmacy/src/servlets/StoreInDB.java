package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daobjects.DBProcess;

@SuppressWarnings("serial")
@WebServlet("/StoreInDB")
public class StoreInDB extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String res="";
		DBProcess dp = new DBProcess();

		try{
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String mob = request.getParameter("mob");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			
			System.out.println(email);
			
			String result = dp.saveUserDetails(name, email, mob, address, password);
			if(result.equals("success")){
				 System.out.println("inside store reg in db");
				 res = "success";
			}
			else{
				res = "fail";
			}
		}
		catch(Exception e){
			System.out.print("error in reg servlet");
			res = "fail";
			e.printStackTrace();
		}
		System.out.println(res);
		pw.print(res);
	}
}
