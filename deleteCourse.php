
<?php 

  include('php_include.php');
  require('session.php');

 


  $id=$_POST['delId'];
  $sql_for_data="SELECT * from `tt_course_master` WHERE`tt_course_master`.`course_master_id` =$id";  
  $result_for_data=mysqli_query($con,$sql_for_data) or die("Error!!");
  $sql2="select * from tt_upload_table where `tt_upload_table`.`course_master_id` =$id";
  $result2=mysqli_query($con,$sql2) or die("Error!!");
  $courseUploadCount = mysqli_num_rows($result2);
  if($courseUploadCount == 0)
  {
          
          $sql5="DELETE FROM `tt_course_master` WHERE `tt_course_master`.`course_master_id` =$id";  
          $result5=mysqli_query($con,$sql5) or die("Error!!");
          echo "<script>alert('Course Removed!');</script>";
                        
          echo "<script>location='dashboard.php'</script>";
                         
                
  }else
  {

          while ($rowmy = mysqli_fetch_array($result2) or die("nono"))
          { 
                  if($result2)
                  {
                      $filename=$rowmy['filename'].".pdf";
                      $filepath="uploads/".$filename;
                      //echo $filename;
                      $data=$filename;
                      $dir="uploads/";
                      $dirHandle=opendir($dir);
                      while($file=readdir($dirHandle))
                      {
                        if($file==$data)
                        {
                          unlink($dir."/".$file);
                        }
                      }/*
                      echo "<br>";
                     // echo $filepath;
                      if(file_exists("uploads/".$filepath))
                      {
                        if($filename=="0")
                        {}else
                        {

                          unlink($filepath) or die("Please Try Again!");  
                        }
                      }
                      */
                      $sql3="DELETE FROM `tt_upload_table` WHERE `tt_upload_table`.`course_master_id` =$id";  
                      $sql4="DELETE FROM `tt_course_master` WHERE `tt_course_master`.`course_master_id` =$id";  
                      $result3=mysqli_query($con,$sql3) or die("Error!!");
                      $result4=mysqli_query($con,$sql4) or die("Error!!");
                      echo "<script>alert('Deleted Succesfully');</script>";
                        
                      echo "<script>location='dashboard.php'</script>";
          
                  }else
                  {
                     echo "<script>alert('Error Occured! Try Again!');</script>";
                        
                        echo "<script>location='dashboard.php'</script>";
                         
                  }
                  
                  //$sql="insert into tt_course_master (course_name,course_type_id,map_id) values ('$courseName',$courseType,$map_id)";
         
            }  
  }
?>
