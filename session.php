<?php
   include('php_include.php');
   session_start();
   
   $user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query($con,"select dept_uid from tt_dept_login where dept_uid = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['dept_uid'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:login.php");
   }
?>