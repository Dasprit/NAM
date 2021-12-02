<jsp:useBean id="loadUser" class="vaobjects.UserData" scope="request">
	<jsp:setProperty name="loadUser" property="mailId" value="" />
	<jsp:setProperty name="loadUser" property="name" value="" />
	<jsp:setProperty name="loadUser" property="mobNum" value="" />
	<jsp:setProperty name="loadUser" property="address" value="" />
</jsp:useBean>
<jsp:forward page="login.jsp" />

