
<?php 

  include('php_include.php');
  require('session.php');

 
  $id=$_GET['id'];
  $sql_for_data="SELECT * from `tt_course_master` WHERE`tt_course_master`.`course_master_id` =$id";  
  $result_for_data=mysqli_query($con,$sql_for_data) or die("Error!!");
  while ($rowmy = mysqli_fetch_array($result_for_data))
  { 
          if($result_for_data)
          {
              $filename=$rowmy['filename'].".pdf";
              $filepath="uploads/".$filename;
              echo $filename;
              echo "<br>";
              echo $filepath;
              if(file_exists("uploads/".$filepath))
              {
                if($filename=="0")
                {}else
                {

                  unlink($filepath) or die("Please Try Again!");  
                }
              }
              

              
              $sql="DELETE FROM `tt_course_master` WHERE `tt_course_master`.`course_master_id` =$id";  
          
             // $result = mysqli_query($con,$sql) or die(mysqli_error($con));  
          
              /*if($result)
              {
                echo "<script>alert('Course Deleted successfully!');</script>";
                //echo "<script>location='dashboard.php'</script>";
                

              }else {
                
               // echo "<script>alert('Error Occured! Try Again!');</script>";
                
                //echo "<script>location='dashboard.php'</script>";
              }*/   
             


          }else
          {
             echo "<script>alert('Error Occured! Try Again!');</script>";
                
                echo "<script>location='dashboard.php'</script>";
                 
          }
          
          //$sql="insert into tt_course_master (course_name,course_type_id,map_id) values ('$courseName',$courseType,$map_id)";
 
 }  

?>
