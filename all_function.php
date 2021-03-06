<?php
function get_branch_name_from_mapid($map_id,$con)
      {

              $sql = "select branch_name from tt_mpg_institute_branch mib where mib.map_id = $map_id";
              $result = mysqli_query($con,$sql);
              if($result)
              {

                       while ($row    = mysqli_fetch_array($result))
                              {

                                      $branch_name     = $row['branch_name'];
                              }       
              }

              return $branch_name;

      }
function get_course_type_name_from_course_type_id($course_type_id,$con)
        {

                $sql = "select course_type_name from tt_course_type where course_type_id = $course_type_id";
                $result = mysqli_query($con,$sql);
                if($result)
                {

                         while ($row    = mysqli_fetch_array($result))
                                {

                                        $course_type_name     = $row['course_type_name'];
                                        //echo $course_type_name;                                 
                                }       
                }


                return $course_type_name;

        }
function get_course_name_from_course_master_id($course_master_id,$con)
        {

                $sql = "SELECT * from `tt_course_master` where `tt_course_master`.`course_master_id`=$course_master_id";
                $result = mysqli_query($con,$sql);
                if($result)
                {

                         while ($row    = mysqli_fetch_array($result))
                                {

                                        $course_name  = $row['course_name'];
                                        //echo $course_type_name;                                 
                                }       
                }


                return $course_name;

        }
function get_course_type_id_from_course_master_id($course_master_id,$con)
        {

                $sql = "SELECT * from `tt_course_master` where `tt_course_master`.`course_master_id`=$course_master_id";
                $result = mysqli_query($con,$sql);
                if($result)
                {

                         while ($row    = mysqli_fetch_array($result))
                                {

                                        $course_type_id  = $row['course_type_id'];
                                        //echo $course_type_name;                                 
                                }       
                }


                return $course_type_id;

        }
function get_course_type_name_from_course_master_id($course_master_id,$con)
        {

                $sql = "select course_type_id from tt_course_master where course_master_id = $course_master_id";
                $result = mysqli_query($con,$sql);
                if($result)
                {

                         while ($row    = mysqli_fetch_array($result))
                                {

                                        $course_type_id  = $row['course_type_id'];
                                        //echo $course_type_name;                                 
                                }       
                }


                //return $course_type_id;
                $sql = "select course_type_name from tt_course_type where course_type_id = $course_type_id";
                $result = mysqli_query($con,$sql);
                if($result)
                {

                         while ($row    = mysqli_fetch_array($result))
                                {

                                        $course_type_name     = $row['course_type_name'];
                                        //echo $course_type_name;                                 
                                }       
                }


                return $course_type_name;

        }
 function get_inst_name_from_mapid($map_id,$con)
        {
                $sql = "select inst_id from tt_mpg_institute_branch where map_id = $map_id";
                $result = mysqli_query($con,$sql);
                if($result)
                {
                        $row  = mysqli_fetch_array($result);
                        $inst_id = $row['inst_id'];

                                $sql = "select inst_name from tt_institute_master where inst_id = $inst_id";
                                $result1 = mysqli_query($con,$sql);

                                                                if($result1)
                                                                        {
                                                                                $row  = mysqli_fetch_array($result1);
                                                                                $inst_name = $row['inst_name'];
                                                                                //echo $inst_name;
                                                                        }

                }

                return $inst_name;

       
        }
function check_file($filename)
{
  $filepath="uploads/".$filename.".pdf";
  if(file_exists($filepath))
  {
    return "UPLOADED";
  }else
  {
    return "NOT UPLOADED";
  }
}
function file_db_status_update($con,$filename,$course_master_id)
{
  $yes=check_file($filename);
  if($yes=="UPLOADED")
  {
      
      $sql="UPDATE `tt_upload_table` SET `status` = 'UPLOADED' WHERE `course_master_id` =$course_master_id";
      $result = mysqli_query($con,$sql) or die("sych Error!");

  }else
  {
      $sql="UPDATE `tt_upload_table` SET `status` = 'NOT UPLOADED' WHERE `course_master_id` =$course_master_id";
      $result = mysqli_query($con,$sql) or die("sych Error!");

  }
}
function view_download_course($con)
{
    $my_map = $_SESSION['map_id'];
    $sql="select * from tt_upload_table WHERE map_id=$my_map";
    $result=mysqli_query($con,$sql) or die(mysqli_error($con));
    $courseCount = mysqli_num_rows($result);
    if($courseCount == 0){
        echo "No courses are added.";
    }else
    {
        echo "<div class=table-responsive>          
          <table class=table>
            <thead>
              <tr>
                <th>#</th>
                <th>Institute Name</th>
                
                <th>Academic Year</th>
                <th>Term</th>
                <th>Course Type</th>
                
                <th>Course Name</th>
                <th>status</th>
                <th>View/Download</th>
                
              </tr>
            </thead>
            <tbody>";
            $courseSno=1;
            while ($row = mysqli_fetch_array($result)) 
            {
              file_db_status_update($con,$row['filename'],$row['course_master_id']);

              echo "<tr>
                <td>".$courseSno."</td>
                <td>".get_inst_name_from_mapid($_SESSION['map_id'],$con)."</td>";
                
                if($row['status']=="NOT UPLOADED")
                {
                  echo "<td><i>None</i></td>";
                  echo "<td><i>None</i></td>";
                  
                }else
                {
                  echo "<td>".$row['a_year']."</td>"; 
                  echo "<td>".$row['term']."</td>";
                  
                }
                echo "<td>".get_course_type_name_from_course_master_id($row['course_master_id'],$con)."</td>";
                  echo "<td>".get_course_name_from_course_master_id($row['course_master_id'],$con)."</td>";
                
                if($row['status']=="NOT UPLOADED")
                {  echo "<td><i><span style=color:red>".$row['status']."</span></i></td>";
                  echo "<td>-</td>";
                }else
                {
                  echo "<td><i>".$row['status']."</i></td>";
                  echo "<td><a href='uploads/".$row['filename'].".pdf' target=_blank>View</a></td>
                  
              </tr>";
            }
              $courseSno++;
            }
              
              echo "
            </tbody>
          </table>
        </div>";
    }

} 

function show_admin_report($con)
    {
        //$my_map = $_SESSION['map_id'];
        $sql="select * from tt_upload_table";
        $result=mysqli_query($con,$sql) or die(mysqli_error($con));
        $courseCount = mysqli_num_rows($result);
        if($courseCount == 0){
            echo "No courses are added.";
        }else
        {
           echo "<div class=table-responsive>          
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
                
              </tr>
            </thead>
            <tbody>";
            $courseSno=1;
            while ($row = mysqli_fetch_array($result)) 
            {
              echo "<tr href='uploads/".$row['filename'].".pdf'>
                <td>".$courseSno."</td>
                <td>".get_inst_name_from_mapid($row['map_id'],$con)."</td>
                <td>".get_branch_name_from_mapid($row['map_id'],$con)."</td>
                <td>".get_course_name_from_course_master_id($row['course_master_id'],$con)."</td>
                <td>".get_course_type_name_from_course_master_id($row['course_master_id'],$con)."</td>
                ";
                
                if($row['a_year']==0)
                {
                  echo "<td><i>None</i></td>";
                  echo "<td><i>None</i></td>";
                  
                }else
                {
                  echo "<td><div class='fil_year'>".$row['a_year']."</td>"; 
                    echo "<td>".$row['term']."</td>";
                }
                 
                
                if($row['status']=="NOT UPLOADED")
                {  echo "<td><i><span style=color:red>".$row['status']."</span></i></td>";
                  echo "<td>-</td>";
                }else
                {
                  echo "<td><i>".$row['status']."</i></td></tr>";
            }
              $courseSno++;
            }
              
              echo "
            </tbody>
          </table>
        </div>";
        }

  }

function all_clg($con)
{
  $sql="select * from tt_institute_master";

    $result=mysqli_query($con,$sql) or die(mysqli_error($con));
    $courseCount = mysqli_num_rows($result);
    if($courseCount == 0){
        echo "No College are added.";
    }else
    {
       
            $courseSno=1;
            while ($row = mysqli_fetch_array($result))
            {
              echo "<option value=".$row['inst_id'].">".$row['inst_name']."</option>"; 
            } 
      //  echo "</select>";
  }
}
function all_branch($con)
{
  $sql="select * from tt_branch_master";

    $result=mysqli_query($con,$sql) or die(mysqli_error($con));
    $courseCount = mysqli_num_rows($result);
    if($courseCount == 0){
        echo "No Branches are added.";
    }else
    {
       
            $courseSno=1;
            while ($row = mysqli_fetch_array($result))
            {
              echo "<option value=".$row['branch_type'].">".$row['branch_type']."</option>"; 
            } 
      //  echo "</select>";
  }
}
function get_map_ids_from_inst_id($con,$inst_id)
{

    $sql= "SELECT * FROM `tt_mpg_institute_branch` WHERE `inst_id`=$inst_id";

    
              $result = mysqli_query($con,$sql) or die("npnon");
              $fmap_ids = "";
              
              if($result)
              {

                       while ($row    = mysqli_fetch_array($result))
                              {

                                      //echo $row['map_id'] . "<br>";
                                      //$fmap_ids[]=$row['map_id'];
                                      $fmap_ids=$fmap_ids.",".$row['map_id'];
                                      echo $fmap_ids ."<br>";
                                      //array_push($map_ids,$row['map_id']);
                              }
                      return $fmap_ids;       
              }
              
              

              
}
?>
