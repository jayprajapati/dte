<?php

 	$host = "localhost";
  	$user = "root";
  	$pass = "";
 	$con = mysqli_connect($host,$user,$pass,"club");
  	if (mysqli_connect_errno())
    {
   		echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    function display_branch($con)
    {
    	 $sql="SELECT * FROM `users`";
    	 echo "<script>alert('gelklklkl');</script>";
    	 $result = mysqli_query($con,$sql) or die("");  
    	 while($row = mysqli_fetch_array($result)) { 
   		 	echo "<option>".$row['lastname']."</option>";
        }
    }
    



?>