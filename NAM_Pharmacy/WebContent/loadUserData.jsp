<jsp:useBean id="loadUser" class="vaobjects.UserData" scope="request">
	<jsp:setProperty name="loadUser" param="email" property="mailId" />
	<jsp:setProperty name="loadUser" property="name" value="" />
	<jsp:setProperty name="loadUser" property="mobNum" value="" />
	<jsp:setProperty name="loadUser" property="address" value="" />
	<jsp:setProperty name="loadUser" param="search" property="search" />
</jsp:useBean>
<jsp:forward page="home.jsp" />

