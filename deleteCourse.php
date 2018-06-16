
<?php 

  include('php_include.php');
  require('session.php');

 
  $id=$_GET['id'];
  
  //$sql="insert into tt_course_master (course_name,course_type_id,map_id) values ('$courseName',$courseType,$map_id)";
  $sql="DELETE FROM `tt_course_master` WHERE `tt_course_master`.`course_master_id` =$id";  
  //echo $sql;
  $result = mysqli_query($con,$sql) or die(mysqli_error($con));  
  //$row = mysqli_fetch_array($result,MYSQLI_ASSOC) or die(mysqli_error($con));
  if($result)
  {
    echo "<script>alert('Course Deleted successfully!');</script>";
    echo "<script>location='dashboard.php'</script>";
    

  }else {
    
    echo "<script>alert('Error Occured! Try Again!');</script>";
    
    echo "<script>location='dashboard.php'</script>";
  }   
 
 

?>
