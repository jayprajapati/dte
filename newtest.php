
<?php require('session.php'); ?>
<?php include('all_function.php'); ?>

<?php
$term=$_POST['term'];
$clg=$_POST['clg'];
$branch=$_POST['branch'];
$course_type=$_POST['course_type'];
$year_sql=$_POST['year_sql'];
if($year_sql=="")
  $year_sql='%';
$map_id=$_SESSION['map_id'];

$sqlmaster="select ";
if( $clg!='%')
{
   $sql= "SELECT * FROM `tt_mpg_institute_branch` WHERE `inst_id`=$clg";


          $result = mysqli_query($con,$sql) or die("npnon");
          $fmap_ids = "";
          
          if($result)
          {

                   while ($row    = mysqli_fetch_array($result))
                          {

                                  //echo $row['map_id'] . "<br>";
                                  //$fmap_ids[]=$row['map_id'];
                                  $fmap_ids=$fmap_ids.",".$row['map_id'];
    
                                  //array_push($map_ids,$row['map_id']);
                          }
                  
          }
          
  
      $fmap_ids = substr($fmap_ids, 1);
      
      $fmap_ids="(".$fmap_ids.")";
      
    $sql="SELECT * from tt_upload_table where map_id IN $fmap_ids and term like '$term' and branch_name like '$branch' and course_type_id like '$course_type' and a_year like '$year_sql' ";
}else
{
  $sql="SELECT * from tt_upload_table where term like '$term' and branch_name like '$branch' and course_type_id like '$course_type' and a_year like '$year_sql' ";
}

//echo $sql;

/*
if($term=='*' and $clg=='*' and $branch=="*" and $course_type=="*" and $year_sql=="*")
	$sql="SELECT * from tt_upload_table";
else if($term!='*' and $clg=='*' and $branch=="*" and $course_type=="*" and $year_sql=="*")
  $sql="SELECT * from tt_upload_table where term='$term'";
else if($term=='*' and $clg!='*' and $branch=="*" and $course_type=="*" and $year_sql=="*")
  {
    $sql= "SELECT * FROM `tt_mpg_institute_branch` WHERE `inst_id`=$clg";


          $result = mysqli_query($con,$sql) or die("npnon");
          $fmap_ids = "";
          
          if($result)
          {

                   while ($row    = mysqli_fetch_array($result))
                          {

                                  //echo $row['map_id'] . "<br>";
                                  //$fmap_ids[]=$row['map_id'];
                                  $fmap_ids=$fmap_ids.",".$row['map_id'];
    
                                  //array_push($map_ids,$row['map_id']);
                          }
                  
          }
          
  
      $fmap_ids = substr($fmap_ids, 1);
      
      $fmap_ids="(".$fmap_ids.")";
      
    $sql="SELECT * from tt_upload_table where map_id IN $fmap_ids";
  }
else if($term=='*' and $clg=='*' and $branch!="*" and $course_type=="*" and $year_sql=="*")
  $sql="SELECT * from tt_upload_table where branch_name='$branch'";
else if($term=='*' and $clg=='*' and $branch=="*" and $course_type!="*" and $year_sql=="*")
  $sql="SELECT * from tt_upload_table where course_type_id=$course_type";
else if($term=='*' and $clg=='*' and $branch=="*" and $course_type=="*" and $year_sql!="*")
  $sql="SELECT * from tt_upload_table where a_year='$year_sql'";
else if($term=='*')
	{
	 $sql= "SELECT * FROM `tt_mpg_institute_branch` WHERE `inst_id`=$clg";


          $result = mysqli_query($con,$sql) or die("npnon");
          $fmap_ids = "";
          
          if($result)
          {

                   while ($row    = mysqli_fetch_array($result))
                          {

                                  //echo $row['map_id'] . "<br>";
                                  //$fmap_ids[]=$row['map_id'];
                                  $fmap_ids=$fmap_ids.",".$row['map_id'];
    
                                  //array_push($map_ids,$row['map_id']);
                          }
                  
          }
          
	
    	$fmap_ids = substr($fmap_ids, 1);
    	
    	$fmap_ids="(".$fmap_ids.")";
    	
		$sql="SELECT * from tt_upload_table where map_id IN $fmap_ids";
	}
else if($clg=='*')
	$sql="SELECT * from tt_upload_table where term='$term'";
else if($branch=="*")
else
{	$sql= "SELECT * FROM `tt_mpg_institute_branch` WHERE `inst_id`=$clg";


          $result = mysqli_query($con,$sql) or die("npnon");
          $fmap_ids = "";
          
          if($result)
          {

                   while ($row    = mysqli_fetch_array($result))
                          {

                                  //echo $row['map_id'] . "<br>";
                                  //$fmap_ids[]=$row['map_id'];
                                  $fmap_ids=$fmap_ids.",".$row['map_id'];
    
                                  //array_push($map_ids,$row['map_id']);
                          }
                  
          }
          
	
    	$fmap_ids = substr($fmap_ids, 1);
    	
    	$fmap_ids="(".$fmap_ids.")";
    	

	$sql="SELECT * from tt_upload_table where map_id IN $fmap_ids and term='$term'";
 }       */
        $result=mysqli_query($con,$sql) or die(mysqli_error($con));
        $courseCount = mysqli_num_rows($result);
        if($courseCount == 0){
            echo "No courses are added.";
        }else
        {
           echo "<form method=post action=uploads/getjson.php target=_blank>
           <div style=width:100%;text-align:right><button type=submit class='btn' style=>
      			 Filtered Download |<span class='glyphicon glyphicon-download-alt'></span>   
    		</button></div>
    <div class=table-responsive>          
          <table class=table name=mytable id=mytable>
            <thead>
              <tr>
                <th>#</th>
                <th>Institute Name</th>
                <th>Branch</th>
                <th>Course Name</th>
                <th>Course Type</th>
                <th>Academic Year</th>
                <th>Term</th>
                
                <th>status</th>
                <th>View | Download</th>
              </tr>
            </thead>
            <tbody>";
            $courseSno=1;
            $filenames=[];
            while ($row = mysqli_fetch_array($result)) 
            {
	              echo "<tr href='uploads/".$row['filename'].".pdf'>
	                <td>".$courseSno."</td>
	                <td><div class=inst>".get_inst_name_from_mapid($row['map_id'],$con)."</div></td>
	                <td>".get_branch_name_from_mapid($row['map_id'],$con)."</td>
	                <td>".get_course_name_from_course_master_id($row['course_master_id'],$con)."</td>
	                <td>".get_course_type_name_from_course_master_id($row['course_master_id'],$con)."</td>
	                ";
	                
	                if($row['a_year']==0)
	                {
	                  echo "<td><div class='a_year'><i>None</i></div></td>";
	                  echo "<td><div class=term><i>None</i></div></td>";
	                  
	                }else
	                {
	                  echo "<td><div class='a_year'>".$row['a_year']."</div></td>"; 
	                    echo "<td><div class=term>".$row['term']."</div></td>";
	                }
	                 
	                
	                if($row['status']=="NOT UPLOADED")
	                {  echo "<td><i><span style=color:red>".$row['status']."</span></i></td>";
	                  echo "<td>-</td>";
	                }else
	                {
	                  echo "<td><i>".$row['status']."</i></td>";
	                  echo "<td><a href='uploads/".$row['filename'].".pdf' target=_blank>View</a> | ";
	                  echo "<div id=download class=download href='uploads/".$row['filename'].".pdf'><a href='uploads/".$row['filename'].".pdf' download=newfilename>Download</a></div></td>
		              </tr>";
		              $filenames[]=$row['filename'];

	            	}
	              $courseSno++;
            }
              
              echo "
            </tbody>
          </table>
        </div>";
        //print_r($filenames);
        $dataString = serialize($filenames);
        echo "
         <div class=form-group><input type=text name=data value=$dataString readonly=true style=display:none>
          </div></form>";
        }

//print_r($filenames);

   



    ?>

