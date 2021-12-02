
<%@page import="java.io.PrintWriter"%>
<%@page import="daobjects.DBProcess"%>

<%
	String res="";
	DBProcess dp = new DBProcess();
	PrintWriter pw = response.getWriter();
	try{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mob = request.getParameter("mob");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		String s = request.getParameter("oemail");
		String result = dp.updateUserDetails(name, email, mob, address, password, s);
		if(result.equals("success")){
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
%>


