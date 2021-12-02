<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NAM Pharmacy-Login</title>
    <link rel="icon" href="images/logocircle.png" type="image/gif">
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
    <script type="text/javascript">
	    function passFunc() {
	        var x = document.getElementById("password");
	        var y = document.getElementById("hide1");
	        var z = document.getElementById("hide2");
	
	        if (x.type === 'password') {
	            x.type = "text";
	            y.style.display = "block";
	            z.style.display = "none";
	        } else {
	            x.type = "password";
	            y.style.display = "none";
	            z.style.display = "block";
	        }
	    }
    
    	function validator() {
    		
    		var email = document.getElementById("email").value;
			var pass = document.getElementById("password").value;
    		
		    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,4})$/;
		    if (email == "") {
		    	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Email is Empty!</p>";
                document.getElementById("email").focus();
                return false;
            }
		    else if(regex.test(email)==false){
		    	//alert(regex.test(email));
		    	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Email format Incorrect!</p>";
		    	document.getElementById("email").focus();
	            return false;
		    }
	        
	        if (pass == "") {
	        	document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Password should not Empty!</p>";
	            document.getElementById("password").focus();
	            return false;
	        }
	        document.getElementById("resp").innerHTML = "<p>Loading...</p>";
			return true;
        }
	    
	    function fun(){
	    	if(!validator())
				return false;
	    	
			var email = document.getElementById("email").value;
			var pass = document.getElementById("password").value;
			var obj = new XMLHttpRequest();
			
			obj.onreadystatechange = function fun2(){
				if (this.readyState == 4 && this.status == 200) {
					var res = this.responseText;
					if(new String(res).valueOf().trim() == new String("success").valueOf().trim()){
						document.getElementById("resp").innerHTML = "<p style='color:green;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Login Success!<br></p>";
						setTimeout('Redirect()', 0);
					}
					else if(new String(res).valueOf().trim() == new String("fail").valueOf().trim()){
						document.getElementById("resp").innerHTML = "<p style='color:red;font-size: 13px;letter-spacing: .5px;display:inline-block;'>Login Failed (Email or Password Incorrect!)</p>";
						document.getElementById("email").focus();
						return false;
					}
			    }
				else{
					document.getElementById("resp").innerHTML = "<p>Loading...</p>";
				}
			}
			obj.open("POST","LoginValidator?email="+email+"&password="+pass,true);
			obj.send();
			
			return false;
		}
	    
	    function Redirect() {
	    	var email = document.getElementById("email").value;
	        window.location = "loadUserData.jsp?email="+email;
	    }
    </script>
</head>
<body>
<jsp:useBean id="loadUser" class="vaobjects.UserData" scope="request"></jsp:useBean>
<%
	loadUser.setAddress("");
	loadUser.setMailId("");
	loadUser.setMobNum("");
	loadUser.setName("");
	System.out.println(loadUser.getName());
%>
  <div class="logo1">
      <img class ="logo" src ="images/logo.png"alt="">
  </div>

    <div class="main">

        <div class="left-side">
            <img src="images/cuptab.jpg" alt="">
        </div>
        <div class="left-side">
            <h1>Sign In</h1><div id="resp"></div>
            <div>
           <div>
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter Your Email-Id" id="email" name="email">
            </div>
            <div>
                <i class="fas fa-key"></i>
                <input type="password" placeholder="Enter Your Password" id="password" name="password">
                <span class="eye" onclick="passFunc()">
                        <i id="hide1" class="fa fa-eye"></i>
                        <i id="hide2" class="fa fa-eye-slash"></i>
                 </span>
            </div>
            <button type="submit" onclick="return fun()">Sign in</button>
            <br>
            <a style="text-decoration:none;"href="reg.jsp">New User? Register</a>
        	</div>
        </div>
    </div>
</body>
</html>