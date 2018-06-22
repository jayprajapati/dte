
<?php require('session.php'); ?>
<?php include('all_function.php'); ?>
<?php


$course_master_id=$_POST['editId'];
$editcourseName=$_POST['editcourseName'];
$editcourseType=$_POST['editcourseType'];
$sql="UPDATE tt_course_master SET course_name='$editcourseName', course_type_id=$editcourseType where `course_master_id`='$course_master_id'";

//echo $sql;

$result = mysqli_query($con,$sql) or die(mysqli_error($con));  
if($result)
  {
    echo "<script>alert('Course Edited!');</script>";
    echo "<script>location='dashboard.php'</script>";
    

  }else {
    
    echo "<script>alert('Error Occured! Try Again!');</script>";
    
    echo "<script>location='dashboard.php'</script>";
  }   
?>