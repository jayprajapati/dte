
<?php 

  include('php_include.php');
  require('session.php');

  $courseName=$_POST['courseName'];
  $courseType=$_POST['courseType'];
  $map_id=$_SESSION['map_id'];
  
  $sql="insert into tt_course_master (course_name,course_type_id,map_id,a_year,term,branch_name,filename,status) values ('$courseName',$courseType,$map_id,'0','0','0','0','NOT UPLOADED')";
$result = mysqli_query($con,$sql) or die(mysqli_error($con));  

  
  
    
  //echo $sql;
  
 
  //$row = mysqli_fetch_array($result,MYSQLI_ASSOC) or die(mysqli_error($con));
  if($result)
  {
    $sql3 = "SELECT `course_master_id` from `tt_course_master` where `course_name`='$courseName' and `map_id`=$map_id";
    //echo $sql3;
                $result3 = mysqli_query($con,$sql3);
                if($result3)
                {

                         while ($row    = mysqli_fetch_array($result3))
                                {

                                        $course_master_id  = $row['course_master_id'];
                                        //echo $course_type_name;  
                                        //echo "<script>alert($course_master_id)</script>";                              
                                }       
                }
    $sql2="insert into tt_upload_table (course_master_id,map_id,a_year,term,filename,status) values 
                                     ($course_master_id,$map_id,'0','0','0','NOT UPLOADED')";
    $result2 = mysqli_query($con,$sql2) or die(mysqli_error($con));  
    echo "<script>alert('Course Successfully Added!');</script>";
    echo "<script>location='dashboard.php'</script>";
    

  }else {
    
    echo "<script>alert('Error Occured! Try Again!');</script>";
    
    echo "<script>location='dashboard.php'</script>";
  }   
 
 

?>
