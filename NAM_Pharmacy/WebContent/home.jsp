<%@page import="java.util.ArrayList"%>
<%@page import="daobjects.DBProcess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="loadUser" class="vaobjects.UserData" scope="request"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">

  <head>
    <meta charset="utf-8">
    <title>NAM Pharmacy</title>
    <link rel="stylesheet" href="itemstyles.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Italianno&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  	<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
  	<link rel="preconnect" href="https://fonts.googleapis.com">
  	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  	<script type="text/javascript">
	  	
  	function addToCart(name){
  		//alert(name)
		var obj = new XMLHttpRequest();
  		<%String m = loadUser.getMailId();
  		System.out.println("Name :"+m);%>
  		obj.onreadystatechange = function ss(){
  			if(obj.readyState == 4 && obj.status == 200){
  				if(obj.responseText == "yes"){
  					alert("Added Successfully");
  				}
  				else{
  					alert("Product already in cart!");
  				}
  			}
  		}
  		obj.open("POST","addToCart?name="+name+"&mail="+"<%=m%>",true);
  		obj.send();
  		
  	}
 	  	function loadData(){

 	  		var x = document.getElementById("search").value;
 	  	  	var obj = new XMLHttpRequest();
	  		
	  		obj.onreadystatechange = function ss(){
	  			if(obj.readyState == 4 && obj.status == 200){
	  				document.getElementById("cardd").innerHTML = obj.responseText;
	  			}
	  		}
	  		
	  		obj.open("POST","loadProducts.jsp?se="+x,true);
	  		obj.send();
	  		
	  	}
 	  	
 	  	
 	  	
 	  	function loadFooter(){
	  		var obj = new XMLHttpRequest();
	  		
	  		obj.onreadystatechange = function ss(){
	  			if(obj.readyState == 4 && obj.status == 200){
	  				document.getElementById("footer").innerHTML = obj.responseText;
	  			}
	  		}
	  		
	  		obj.open("GET","footer.html",true);
	  		obj.send();
	  		
	  	}
 	  	
 	  	function forwardToCart(){
 	  		//alert("forwarded");
 	  		//var email = loadUser.getMailId();
 	  		<% String email = request.getParameter("email");%>
 	  		window.location = "cart.jsp?email="+"<%=email%>";
 	  		<%System.out.println("forwarded to cart");%>
 	  	}
	  	
	  	
  	</script>
  
  </head>

<body onload="loadData()">

<%
	String mail = loadUser.getMailId();
	System.out.print(mail);
	ArrayList<String> a = new DBProcess().loadUser(mail);
	loadUser.setName(a.get(0));
	loadUser.setMobNum(a.get(2));
	loadUser.setAddress(a.get(3));
%>

<div class="main">

<div class="col-lg-12 com">

<div class="nb">
  <!--Navbar-->
  <nav style="background-color:#368B85"class=" xyz fixed-top navbar navbar-expand-lg navbar-dark teal lighten-2 mb-4">

    <!-- Navbar brand -->
    <!-- <a class="navbar-brand" href="#">NAM</a> -->
    <h2 style="color:white">Nam Pharmacy  <i class=" tab fas fa-pills"></i></h2>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <!-- Search form -->
      <form class="form-inline ml-auto">
        <div class="md-form my-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" id="search" onkeyup="loadData()">

        </div>
      </form>
      <div class="dropdown">
      		<a class="account"href="#"><i class="fas fa-user-circle fa-lg"></i></a>
    		<div class="dropdown-content">
    			<%out.print("<a href=\"\">"+loadUser.getName()+"</a>"); %>
    			<%out.print("<a href=\"update.jsp?mail="+loadUser.getMailId()+"\">Update</a>"); %>
      			<a href="unLoadUserData.jsp">Log Out</a>
   			</div>
  	  </div>
  	  <a class="cart" onclick="forwardToCart()"><i class="fas fa-cart-plus fa-lg"></i></a>
        
    </div>

  </nav>
  <!--/.Navbar-->
</div>


  <section id="testimonials">
    <div id="carouselExampleControls" class="carousel slide" data-ride=false>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="test-img"src="images/logocircle.png" alt="logo">
      <br><br>
      <em>Your Health Is Our Utmost Concern</em>
      <br>
      <h2class="test-h2">Get All Your Medicines In A Single Tap</h2>

<br>
<br>
		
      <a href="#cardd" id="ah"><button class="button1" type="submit">Shop Now</button></a>
<br>
    </div>


    <div class="carousel-item">
      <img class="test-img1" src="images/Healthy Diwali.png" alt="Diwali">
      <br><br>
      <em>Celebrate A Safe And Healthy Diwali With NAM</em>
    </div>

    <div class="carousel-item">
      <!-- <h2 class="test-h2">My dog used to be so lonely, but with TinDog's help, they've found the love of their life. I think.</h2> -->
      <img class="test-img2" src="images/slide.png" alt="offer">
      <!-- <em>Beverly, Illinois</em> -->
    </div>
  </div>

  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  </section>
</div>


<section id="cardd">

</section>

<footer class="footer">
   <div class="container">
    <div  style="text-align: left ;background-color:#368b85" class="row">
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


  </div>
  </body>
</html>
