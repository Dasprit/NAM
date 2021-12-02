<%@page import="daobjects.DBProcess"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="loadUser" class="vaobjects.UserData" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Your Cart</title>
      <link rel="stylesheet" href="cart.css">
      <link rel="icon" href="images/logocircle.png" type="image/gif">
      <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Arvo:wght@700&family=Cabin&family=Exo+2:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Secular+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
 <script type="text/javascript">
 	function goToHome(){
 		<% String email = request.getParameter("email"); %>
 		console.print("<%=email%>");
	  	window.location = "home.jsp?email="+"<%=email%>";
 	}
 </script>
  <body>
 <%
	String mail = request.getParameter("email");
 	loadUser.setMailId(mail);
	System.out.println("Cart Mail :"+mail);
	DBProcess db = new DBProcess();
	ArrayList<String> a = db.loadUser(mail);
	System.out.println(a.size());
	loadUser.setName(a.get(0));
	loadUser.setMobNum(a.get(2));
	loadUser.setAddress(a.get(3));
	ArrayList<ArrayList<String>> p = new ArrayList<ArrayList<String>>();
	p = db.loadProducts(mail);
	System.out.println("Cart Product Size:"+p.size());
%>
    <div class="main">
    <div class="nb">
      <!--Navbar-->
      <nav style="background-color:#368B85"class=" xyz fixed-top navbar navbar-expand-lg navbar-dark teal lighten-2 mb-4">

        <!-- Navbar brand -->
        <!-- <a class="navbar-brand" href="#">NAM</a> -->
        <h2 style="color:white">Nam Pharmacy  <i class=" tab fas fa-pills"></i></h2>

        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<a class="home" onclick="goToHome()"><i class="fas fa-home fa-lg "></i></a>
          
          <div class="dropdown">
            <a class="account"href="#"><i class="fas fa-user-circle fa-lg" style="font-size: 1.3em;"></i></a>
            <!-- <button class="dropbtn">Dropdown</button> -->
            <div class="dropdown-content">
            	<%out.print("<a href=\"\">"+loadUser.getName()+"</a>"); %>
            	<%out.print("<a href=\"update.jsp?mail="+loadUser.getMailId()+"\">Update</a>"); %>
      			<a href="unLoadUserData.jsp">Log Out</a>
            </div>
          </div>
        </div>
    </div>

<div class="header">
  
</div>

    <div class="cartItems">
      <table>
          <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Subtotal</th>
          </tr>

        <%
        	for(int i=0; i<p.size(); i++){
        	ArrayList<String> products = p.get(i);
        	System.out.println("1. "+products.get(1));
        	int qnt = Integer.parseInt(products.get(3));
        	%>
        		<tr>
                <td>
                  <div class="oneproduct">
                  	<% out.println("<img src=\""+products.get(1)+"\" alt=\"\">"); %>
                    
                  <div class=>
                  	<% out.println("<h6>"+products.get(0)+"</h6>");
                  	   out.println("<small>Price:"+products.get(2)+"</small>");
                  	%>
                    <br>
                    <a href="#" name="\"<%=products.get(0)%>\"">Remove</a>
                  </div>
                </div>
                </td>
                <td><input type="number" min="1" max="120" value="<%=qnt%>"></td>
                <td><% float price = Float.parseFloat(products.get(2));
                float tot = price*qnt;
                out.println("Rs."+(tot)); %></td>
              </tr>

        	<%} %>

			
        


        
</table>

      <div class="total">

        <table>
          <tr>
            <td>Subtotal</td>
            <td>Rs.10324.00</td>
          </tr>

          <tr>
            <td>GST</td>
            <td>18%</td>
          </tr>

          <tr>
            <td>Total</td>
            <td>Rs.10564.00</td>
          </tr>
          <tr >
            <td colspan="2">
              <button class="button1" type="submit">Place Order  <i class="fas fa-arrow-circle-right"></i></button>
            </td>
          </tr>
        </table>

      </div>
    </div>
      </div>


      <footer class="footer">
    	 <div class="container">
    	 	<div class="row">
    	 		<div class="footer-col">
    	 			<h4>company</h4>
    	 			<ul>
    	 				<li><a href="#">about us</a></li>
    	 				<li><a href="#">our services</a></li>
    	 				<li><a href="#">privacy policy</a></li>
    	 				<li><a href="#">affiliate program</a></li>
    	 			</ul>
    	 		</div>
    	 		<div class="footer-col">
    	 			<h4>get help</h4>
    	 			<ul>
    	 				<li><a href="#">FAQ</a></li>
    	 				<li><a href="#">shipping</a></li>
    	 				<li><a href="#">returns</a></li>
    	 				<li><a href="#">order status</a></li>
    	 				<li><a href="#">payment options</a></li>
    	 			</ul>
    	 		</div>
    	 		<div class="footer-col">
    	 			<h4>online shop</h4>
    	 			<ul>
    	 				<li><a href="#">Tablets</a></li>
    	 				<li><a href="#">Tonics</a></li>
    	 				<li><a href="#">Oinments</a></li>
    	 				<li><a href="#">Injections</a></li>
    	 			</ul>
    	 		</div>
    	 		<div class="footer-col">
    	 			<h4>follow us</h4>
    	 			<div class="social-links">
    	 				<a href="#"><i class="fab fa-facebook-f"></i></a>
    	 				<a href="#"><i class="fab fa-twitter"></i></a>
    	 				<a href="#"><i class="fab fa-instagram"></i></a>
    	 				<a href="#"><i class="fab fa-linkedin-in"></i></a>
    	 			</div>
    	 		</div>
    	 	</div>
    	 </div>
    </footer>





  </body>
</html>
