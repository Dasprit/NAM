<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="daobjects.DBConnect" %>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String res="";
	PrintWriter pw = response.getWriter();
	try{
		Connection con = DBConnect.getConnection();
		PreparedStatement st = con.prepareStatement("select * from UserData where mail=? and password=?");
		st.setString(1,email);
		st.setString(2,password);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()){
			//System.out.println("success");
			res = "success";
		}
		else{
			//System.out.println("fail");
			res = "fail";
		}
		
	}
	catch(Exception e){
		res = "fail";
		e.printStackTrace();
	}
	System.out.println("Login :"+res);
	pw.print(res);
%>
