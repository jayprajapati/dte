
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<!-- <script>
		$(document).ready(function()
			{
				 $("#mysubmit").click(function(){
		    	alert("hello");
                $(this).text("Logging In...");
      
                $username=$("#enroll").val();
                 $password=$("#password").val();
      
                      $.post("login2.php",
                      {
                          username: $username,
                          password: $password
                      },
                    function(data, status){
                        //alert("Data:"+data + " \nStatus: "+ status );
                        //document.write(data);
                        //$("#thisthis").text("yes");
                        if(data=="hello_moto")
                        {
                            window.location.replace('index.php');
                         }
                        else
                        {
                            $("#mysubmit").text("Sign In");
                          $("#mystatus").text(data);
                          
                        
                        }
                        
                     });
    			});
			});
		   
	</script> -->
</head>
<body>
	<div class="container" style="width: 30%;">
	 <div class="wrapper">
    <form class="form-signin" method="post" action="login2.php">       
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="username" placeholder="Email Address" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
      
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="mysubmit" name="mysubmit">Login</button>   
    </form>
  </div>
</div>
</body>
</html>