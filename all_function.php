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

?>
