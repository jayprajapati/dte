<?php
 define ("filesplace","./");

 include('php_include.php');
 require('session.php');
$a_year = $_POST['a_year'];
$select_term = $_POST['select_term'];
$branchName = $_POST['branchName'];
$status = "UPLOADED";
$courseList = (int) $_POST['courseID'];


 //$courseList = str_replace(' ', '-', $courseList);
$branchName = str_replace(' ', '-', $branchName);
$map_id = $_SESSION['map_id'];	
$name =  $map_id."_".$courseList."_".$a_year."_".$select_term;

$checkdir="uploads/";
$file=$checkdir.$name.".pdf";
if(file_exists($file))

{
	 echo "<script>alert('File is already Uploded..Please delete course and try again.!');</script>";
    echo "<script>location='dashboard.php'</script>";
    

	exit();
}

if (is_uploaded_file($_FILES['classnotes']['tmp_name']))
        {

         if ($_FILES['classnotes']['type'] != "application/pdf")
                {
                 echo "<p>Class notes must be uploaded in PDF format.</p>";
                }
                else
                        {
                        
                         //echo $name;

                                                // Check file size
                                                if ($_FILES["classnotes"]["size"] > 10000000)
                                                {
                                                        echo "Sorry, your file is too large.";
                                                        $uploadOk = 0;
                                                }
                                                else
                                                {
                                                        $result = move_uploaded_file($_FILES['classnotes']['tmp_name'],filesplace."uploads/$name.pdf");

                                                         if ($result == 1) echo "<p>Upload done .</p>";
                                                         else echo "<p>Sorry, Error happened while uploading . </p>";
                                                        }
                        }

        }
//$co=str_replace('-', ' ', $courseList);


$sql="insert into tt_upload_table (course_master_id,map_id,a_year,term,filename,status) values ($courseList,$map_id,'$a_year','$select_term','$name','UPLOADED')";
/*$sql="UPDATE tt_course_master set a_year=$a_year ,term ='$select_term',branch_name='$branchName',filename='$name',status='$status' where `course_name`='$co'";*/
//echo $sql;

$result = mysqli_query($con,$sql) or die(mysqli_error($con));  
$sql11="select * from tt_upload_table where course_master_id=$courseList";
$result11 = mysqli_query($con,$sql11) or die(mysqli_error($con));
if($result11)
{
	 $sql12="DELETE FROM `tt_upload_table` WHERE `course_master_id`=$courseList and `map_id`=$map_id and a_year='0' and term='0' and filename='0' ";
	 $result12 = mysqli_query($con,$sql12) or die(mysqli_error($con));

}  
  if($result)
  {
    echo "<script>alert('Uploaded Successfully!');</script>";
    echo "<script>location='dashboard.php'</script>";
    

  }else {
    
    echo "<script>alert('Error Occured! Try Again!');</script>";
    
    echo "<script>location='dashboard.php'</script>";
  } 

?>