<?php

 	$host = "localhost";
  	$user = "root";
  	$pass = "";
 	$con = mysqli_connect($host,$user,$pass,"dte");
  	if (mysqli_connect_errno())
    {
   		echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    
    



?>