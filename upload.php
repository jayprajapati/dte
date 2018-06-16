<?php
 define ("filesplace","./");

 include('php_include.php');
 require('session.php');
$a_year = $_POST['a_year'];
$select_term = $_POST['select_term'];
$branchName = $_POST['branchName'];
$status = "UPLOADED";
$courseList = $_POST['courseList'];


 $courseList = str_replace(' ', '-', $courseList);
 $branchName = str_replace(' ', '-', $branchName);
$map_id = $_SESSION['map_id'];	
 $name =  $map_id."_".$courseList."_".$a_year."_".$select_term."_".$branchName;
 if (is_uploaded_file($_FILES['classnotes']['tmp_name']))
        {

         if ($_FILES['classnotes']['type'] != "application/pdf")
                {
                 echo "<p>Class notes must be uploaded in PDF format.</p>";
                }
                else
                        {
                        
                         echo $name;

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
$co=str_replace('-', ' ', $courseList);
$sql="UPDATE tt_course_master set a_year=$a_year ,term ='$select_term',branch_name='$branchName',filename='$name',status='$status' where `course_name`='$co'";
echo $sql;
$result = mysqli_query($con,$sql) or die(mysqli_error($con));  
  //$row = mysqli_fetch_array($result,MYSQLI_ASSOC) or die(mysqli_error($con));
  if($result)
  {
    echo "<script>alert('Uploaded Successfully!');</script>";
    echo "<script>location='dashboard.php#menu2'</script>";
    

  }else {
    
    echo "<script>alert('Error Occured! Try Again!');</script>";
    
    echo "<script>location='dashboard.php#menu1'</script>";
  } 

?>