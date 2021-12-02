<jsp:useBean id="objUserRegDetails" class="vaobjects.UserRegDetails" scope="request">
	<jsp:setProperty name="objUserRegDetails" param="name" property="userName"/>
	<jsp:setProperty name="objUserRegDetails" param="email" property="mailId"/>
	<jsp:setProperty name="objUserRegDetails" param="mob" property="mobNum"/>
	<jsp:setProperty name="objUserRegDetails" param="address" property="address"/>
	<jsp:setProperty name="objUserRegDetails" param="password" property="password"/>


<%
	System.out.println(request.getAttribute("name"));
System.out.println("name");

%>
</jsp:useBean>
<jsp:forward page="/StoreRegInDB.jsp"/>