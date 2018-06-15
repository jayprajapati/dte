
<?php 

  include('php_include.php');
  require('session.php');

  $courseName=$_POST['courseName'];
  $courseType=$_POST['courseType'];
  $map_id=$_SESSION['map_id'];
  
  $sql="insert into tt_course_master (course_name,course_type_id,map_id) values ('$courseName',$courseType,$map_id)";
    
  //echo $sql;
  $result = mysqli_query($con,$sql) or die(mysqli_error($con));  
  //$row = mysqli_fetch_array($result,MYSQLI_ASSOC) or die(mysqli_error($con));
  if($result)
  {
    echo "<script>alert('Course Successfully Added!');</script>";
    echo "<script>location='dashboard.php'</script>";
    

  }else {
    
    echo "<script>alert('Error Occured! Try Again!');</script>";
    
    echo "<script>location='dashboard.php'</script>";
  }   
 
 

?>
