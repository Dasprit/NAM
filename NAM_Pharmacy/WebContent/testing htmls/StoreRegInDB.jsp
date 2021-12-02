<%@page import="daobjects.DBProcess"%>

<jsp:useBean id="objUserRegDetails" class="vaobjects.UserRegDetails" scope="request"/>

<%
	DBProcess dp = new DBProcess();

	try{
		String name = objUserRegDetails.getUserName();
		String email = objUserRegDetails.getMailId();
		String mob = objUserRegDetails.getMobNum();
		String address = objUserRegDetails.getAddress();
		String password = objUserRegDetails.getPassword();
		System.out.println(name);
		System.out.println(email);
		System.out.println(mob);
		System.out.println(address);
		System.out.println(password);
		String result = dp.saveUserDetails(name, email, mob, address, password);
		if(result.equals("success")){
			 System.out.println("inside store reg in db");
			 out.println("<p style='color:green;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Registration Successful</p>");
		}
		else{
			 out.println("<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Registration Failed</p>");
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}

%>


