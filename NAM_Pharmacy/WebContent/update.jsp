<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="daobjects.DBProcess"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NAM Pharmacy-Registration</title>
    <link rel="icon" href="images/logocircle.png" type="image/gif">
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <link rel="stylesheet" href="styles1.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <%
		String mail = request.getParameter("mail");
		ArrayList<String> a = new DBProcess().loadUser(mail);
		String name = a.get(0);
    	String address = a.get(3);
    	String phone = a.get(2);
    	String pass = a.get(4);
	%>
    
    
    <script type="text/javascript">
    function validator() {
    	var name = document.getElementById("name").value;
    	var k = name.length;
		var email = document.getElementById("email").value;
		var mob = document.getElementById("mob").value;
		var address = document.getElementById("address").value;
		var pass = "<%=pass%>";
		var opass = document.getElementById("opassword").value;
		var npass = document.getElementById("npassword").value;
		
		
		var regex = /^[a-zA-Z\s]*$/;
		
            if (name == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Name should not be empty</p>";
            	document.getElementById("name").focus();
            	return false;
            } else if (k > 40) {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Name should be within the range of 1 - 40</p>";
            	document.getElementById("name").focus();
            	return false;
            }
		    else if(regex.test(name)==false){
		    	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Name should contain only Alphabets!</p>";
		    	document.getElementById("name").focus();
	            return false;
		    }
            
            regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,4})$/;
            if (email == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Email should not be empty</p>";
            	document.getElementById("email").focus();
                return false;
            }	
            else if(regex.test(email)==false){
		    	//alert(regex.test(email));
		    	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Email format Incorrect!</p>";
		    	document.getElementById("email").focus();
	            return false;
		    }

	    	regex = /^[0-9]{10}$/;
            if (mob == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Mobile number should not be empty!</p>";
                document.getElementById("mob").focus();
                return false;
            } else if (regex.test(mob)==false) {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Mobile number must be of 10 digits</p>";
            	document.getElementById("mob").focus();
                return false;
            }

	   		if (address == "") {
	   			document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Address should not be empty</p>";
                document.getElementById("address").focus();
                return false;
            }

            regex = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/;
            if (opass == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Password should not be empty</p>";
                document.getElementById("opassword").focus();
                return false;
            } 
            else if(regex.test(opass)==false){
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Password should contain 8-15 Characters!</p>";
	    		document.getElementById("opassword").focus();
                return false;
	    	}
            if(pass!=opass){
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Password Incorrect!</p>";
	    		document.getElementById("opassword").focus();
                return false;
            }
		
            if (npass == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Enter your New password</p>";
            	document.getElementById("npassword").focus();
                return false;
            }
            else if(regex.test(npass)==false){
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>New Password should contain 8-15 Characters!</p>";
	    		document.getElementById("npassword").focus();
                return false;
	    	}
            
            document.getElementById("resp").innerHTML = "<p>Loading...</p>";
			return true;
        }
	    function Redirect() {
	    	var mail = "<%=mail%>";
			var nmail = document.getElementById("email").value;
			if(mail==nmail){
				 window.location = "loadUserData.jsp?email="+mail;
			}
			else{
				window.location = "login.jsp";
			}
	    }
    
		    
	    	function fun(){	
	    		if(!validator()){
	    			return false;
	    		}
	    		
	    		var name = document.getElementById("name").value;
	    		var email = document.getElementById("email").value;
	    		var mob = document.getElementById("mob").value;
	    		var address = document.getElementById("address").value;
	    		var pass = document.getElementById("opassword").value;
	    		var npass = document.getElementById("npassword").value;
	    		
	    		var ob = new XMLHttpRequest();
	    		
	    		ob.onreadystatechange = function fun2(){
	    			//alert(this.readyState+" "+ob.readyState);
	    			if(this.readyState == 4 && this.status == 200){
	    				var res = this.responseText;
	    				//alert(res);
	    				if(new String(res).valueOf().trim() == new String("success").valueOf().trim()){
	    					//alert("success");
	    					document.getElementById("resp").innerHTML = "<p style='color:green;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Updated Successfully</p>";
	    					
	    					setTimeout("Redirect()", 1000);
	    				}
	    				else if(new String(res).valueOf().trim() != new String("success").valueOf().trim()){
	    					//alert("fail");
		    				document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Update Operation Failed!</p>";
		    				document.getElementById("opassword").value = "";
	    					document.getElementById("npassword").value = "";
	    					document.getElementById("email").focus(); 
	    				}
	    				
	    			}
	    		};
	    		
	    		var x = "UpdateInDB.jsp?name="+name+"&email="+email+"&mob="+mob+"&address="+address+"&password="+npass+"&oemail=";
	    		var y = "<%=mail%>";
	    		x = x+y;
	    		
	    		ob.open('POST',x,true);
	    		ob.send();
    		}
    </script>
</head>
<body onload="fetch()">
  <div class="logo1">
      <img class ="logo" src ="images/logo.png"alt="">
  </div>

    <div class="main">

        <div class="left-side">
            <img src="images/cuptab.jpg" alt="">
        </div>
        <div class="left-side">
		
            <h1>Update</h1><div id="resp"></div>
            <div>
            <div>
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter Your Full Name" id="name" value="<%=name%>">
            </div>
            <div>
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter Your Mail Id" id="email" value="<%=mail%>">
            </div>
            <div>
                <i class="fas fa-phone"></i>
                <input type="text" placeholder="Enter Your Mobile Number" id="mob" value="<%=phone%>">
            </div>
            <div>
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" placeholder="Enter Your Address" id="address" value="<%=address%>">
            </div>
            <div>
                <i class="fas fa-key" ></i>
                <input type="password" placeholder="Old Password" id="opassword">
            </div>
            <div>
                <i class="fas fa-key"></i>
                <input type="password" placeholder="New Password" id ="npassword">
            </div>
            <button type="submit" onclick="fun();">Update</button>
            
        </div>
        </div>
    </div>
</body>
</html>