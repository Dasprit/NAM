<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NAM Pharmacy-Registration</title>
    <link rel="icon" href="images/logocircle.png" type="image/gif">
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <link rel="stylesheet" href="styles1.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script type="text/javascript">
    function validator() {
    	var name = document.getElementById("name").value;
    	var k = name.length;
		var email = document.getElementById("email").value;
		var mob = document.getElementById("mob").value;
		var address = document.getElementById("address").value;
		var pass = document.getElementById("password").value;
		var cpass = document.getElementById("cpassword").value;
		
		
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
            if (pass == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Password should not be empty</p>";
                document.getElementById("password").focus();
                return false;
            } 
            else if(regex.test(pass)==false){
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Password should contain 8-15 Characters!</p>";
	    		document.getElementById("password").focus();
                return false;
	    	}
		
            if (cpass == "") {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Please re-enter your password</p>";
            	document.getElementById("cpassword").focus();
                return false;
            }
            else if(pass != cpass) {
            	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Passwords did not match</p>";
                document.getElementById("cpassword").focus();
                return false;
            }
            document.getElementById("resp").innerHTML = "<p>Loading...</p>";
			return true;
        }
    
		    function Redirect() {
		        window.location = "login.jsp";
		    }
    
	    	function fun(){	
	    		if(!validator()){
	    			return false;
	    		}
	    		var name = document.getElementById("name").value;
	    		var email = document.getElementById("email").value;
	    		var mob = document.getElementById("mob").value;
	    		var address = document.getElementById("address").value;
	    		//alert(address);
	    		var pass = document.getElementById("password").value;
	    		
	    		var ob = new XMLHttpRequest();
	    		
	    		ob.onreadystatechange = function fun2(){
	    			//alert(this.readyState+" "+ob.readyState);
	    			if(this.readyState == 4 && this.status == 200){
	    				var res = this.responseText;
	    				//alert(res);
	    				if(new String(res).valueOf().trim() == new String("success").valueOf().trim()){
	    					//alert("success");
	    					document.getElementById("resp").innerHTML = "<p style='color:green;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Registration Successful</p>";
	    					document.getElementById("name").value = "";
	    					document.getElementById("email").value = "";
	    					document.getElementById("mob").value = "";
	    					document.getElementById("address").value = "";
	    					document.getElementById("password").value = "";
	    					document.getElementById("cpassword").value = "";
	    					setTimeout("Redirect()", 2000);
	    				}
	    				else if(new String(res).valueOf().trim() != new String("success").valueOf().trim()){
	    					//alert("fail");
		    				document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Registration Failed (Email Already Exist!)</p>";
		    				document.getElementById("password").value = "";
	    					document.getElementById("cpassword").value = "";
	    					document.getElementById("email").focus(); 
	    				}
	    				
	    			}
	    		};
	    		ob.open('POST',"StoreInDB?name="+name+"&email="+email+"&mob="+mob+"&address="+address+"&password="+pass,true);
	    		ob.send();
    		}
    </script>
</head>
<body>
  <div class="logo1">
      <img class ="logo" src ="images/logo.png"alt="">
  </div>

    <div class="main">

        <div class="left-side">
            <img src="images/cuptab.jpg" alt="">
        </div>
        <div class="left-side">
		
            <h1>Register</h1><div id="resp"></div>
            <div>
            <div>
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter Your Full Name" id="name">
            </div>
            <div>
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter Your Mail Id" id="email">
            </div>
            <div>
                <i class="fas fa-phone"></i>
                <input type="text" placeholder="Enter Your Mobile Number" id="mob">
            </div>
            <div>
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" placeholder="Enter Your Address" id="address">
            </div>
            <div>
                <i class="fas fa-key" ></i>
                <input type="password" placeholder="Set Your Password" id="password">
            </div>
            <div>
                <i class="fas fa-key"></i>
                <input type="password" placeholder="Retype Your Password" id ="cpassword">
            </div>
            <button type="submit" onclick="return fun()">Register</button>
            <br>
              <a class="linkk"style="text-decoration:none;"href="login.jsp">Already A User? Login</a>
       	
        </div>
        </div>
    </div>
</body>
</html>