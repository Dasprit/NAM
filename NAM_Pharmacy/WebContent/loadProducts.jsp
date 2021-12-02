<%@page import="daobjects.FetchTablets"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>NAM Pharmacy</title>
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
  		//alert(name);
  	}
  </script>
  
 </head>

<body>

<%
	String s = request.getParameter("se");
	System.out.println("SE "+s);
	ArrayList<ArrayList> list = new ArrayList<ArrayList>();
	
    list = FetchTablets.load(s);
%>

<table>
    
   <%
   		int index  = 0;
   		for(int i=0; i<list.size()/5; i++){
   			out.print("<tr>");
   				for(int x = 0; x<5; x++){ 
   					ArrayList a = list.get(index); index++;%>
   					<td> 
	   			  		<div class="card  ">
	   						<span class="surface"></span>
	   			          	<% out.print("<button class=\"button\"type=\"submit\" name="+a.get(1)+" onclick=\"addToCart(this.name)\">Add To Cart <i class=\"fas fa-cart-plus\"></i></button>"); %>
	   			          	<div class="card-body">
	   							<%  String style = (String) a.get(2);
	   								String img = (String) a.get(3);
	   								if(style == null){
	   									style = "";
	   								}
	   								else{
	   									style = "\""+style+"\"";
	   								}
	   								
	   								img = "\""+img+"\"";
	   								//System.out.println(style+" "+img);
	   								if(style.isEmpty()){
	   									out.print("<img src="+img+"alt=\"\">");
	   								}
	   								else{
	   									out.print("<img style="+style+"src="+img+"alt=\"\">");
	   								}
	   						%>
	   			      		</div>
	   						<div class="card-footer bg-info ">
	   			      			<h1><% out.print(a.get(4)); %></h1>
	   			      			<h2><% out.print("Rs."+String.format("%32.2f", a.get(5))); %></h2>
	   			    		</div>
	   			        </div>
   			    	</td>
   				<%
   				}
   			out.print("</tr>");
   		}
   		
   		if(list.size()%5>0){
   			out.print("<tr>");
				for(int x = 0; x<list.size()%5; x++){ 
					ArrayList a = list.get(index); index++;%>
					<td> 
   			  		<div class="card  ">
   						<span class="surface"></span>
   			          	<% out.print("<button class=\"button\"type=\"submit\" name="+a.get(1)+" onclick=\"addToCart(this.name)\">Add To Cart <i class=\"fas fa-cart-plus\"></i></button>"); %>
	   			        <div class="card-body">
   							<%  String style = (String) a.get(2);
	   								String img = (String) a.get(3);
	   								if(style == null){
	   									style = "";
	   								}
	   								else{
	   									style = "\""+style+"\"";
	   								}
	   								
	   								img = "\""+img+"\"";
	   								//System.out.println(style+" "+img);
	   								if(style.isEmpty()){
	   									out.print("<img src="+img+"alt=\"\">");
	   								}
	   								else{
	   									out.print("<img style="+style+"src="+img+"alt=\"\">");
	   								}
	   								 %>
   			      		</div>
   						<div class="card-footer bg-info ">
   			      			<h1><% out.print(a.get(4)); %></h1>
   			      			<h2><% out.print("Rs."+String.format("%32.2f", a.get(5))); %></h2>
   			    		</div>
   			        </div>
			    	</td>
				<%
				}
			out.print("</tr>");
   		}
   		
   		
   %>
  
</table>

</body>
</html>