<?php include('php_include.php'); ?>

<?php require('session.php'); ?>
<?php include('all_function.php'); ?>
 <?php
function display_course($con)
{
                # code...
                
                $my_map = $_SESSION['map_id'];
                $sql    = "select * from tt_course_master WHERE map_id=$my_map";
                
                
                //echo $sql;
                $result = mysqli_query($con, $sql) or die(mysqli_error($con));
                
                
                $courseCount = mysqli_num_rows($result);
                //echo "total no of count is " .$courseCount;
                if ($courseCount == 0) {
                                
                                echo "<div class='alert alert-danger'>
        <strong>Sorry! </strong>You haven't added any courses yet.
        </div>";
                } else {
                                echo "<select class=form-control id=courseList>";
                                while ($row = mysqli_fetch_array($result)) {
                                                echo "<option>" . $row['course_name'] . "</option>";
                                }
                                echo "</select>";
                }
}
function show_all_course($con)
{
    $my_map = $_SESSION['map_id'];
    $sql="select * from tt_course_master WHERE map_id=$my_map";
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
                <th>Course Name</th>
                <th>Course Type ID</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>";
            $courseSno=1;
            while ($row = mysqli_fetch_array($result)) 
            {
              echo "<tr>
                <td>".$courseSno."</td>
                <td>".$row['course_name']."</td>
                <td>".get_course_type_name_from_course_type_id($row['course_type_id'],$con)."</td>
                <td><a href=deleteCourse.php?id=".$row['course_master_id']."><button class='btn btn-default'>DELETE</button></a></td>
              </tr>";
              $courseSno++;
            }
              
              echo "
            </tbody>
          </table>
        </div>";
    }

}
?> 

<!DOCTYPE html>
<html>
<head>
    <title>dashboard</title>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	
	  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">  
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script> </head>
	
	
   
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>

<body>
    <div class="container" style="width: 90%;">
        <h1>DTE Gujarat</h1>

        <hr>
        <div style="width: 100%;text-align: right;"><a href=logout.php>Log Out</a></div>
        <ul class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#home">Add Courses</a></li>
          <li><a data-toggle="tab" href="#menu1">Upload Time-Table</a></li>
          <li><a data-toggle="tab" href="#menu2">View/Previous Time-Table</a></li>
        </ul>

        <div class="tab-content">
          <div id="home" class="tab-pane fade in active">
            <h3>Add Courses</h3>
            <form name="courseForm" method="post" action="addCourse.php">
            <div class="form-group">
                      <label for="courseName">Enter Course Name:</label>
                      <input type="text" class="form-control" id="courseName" name="courseName">
                     
            </div>
            <div class="form-group">
                      <label for="coursetype">Select Course Type:</label>
                      <select class="form-control" id="courseType" name="courseType">
                       
                        
                        <option value="0">UG</option>
                        <option value="1">PG</option>
                        <option value="2">DIPLOMA</option>
                        <option value="3">PDDC</option>
                      </select>
            </div>
            <button type="submit" class="btn btn-default" name="submitCourse" id="submitCourse">Submit Course</button>
            </form>
            <hr>
            <h3>Manage Courses</h3>
            <?php show_all_course($con);?>
          </div>
          <div id="menu1" class="tab-pane fade">
            <h3>Upload time-table</h3>
            <label >All fields are mandatory!</label>
                    <div class="form-group">
                      <label for="sel3">Added Course:</label>
                      <?php display_course($con); ?>

                    </div>
                    <div class="form-group">
                      <label for="sel1">Select Academic Year :</label>
                      <input class="date-own form-control" style="width: 300px;" type="text">
                      <script type="text/javascript">
                          $('.date-own').datepicker({
                             minViewMode: 2,
                             autoclose: true,
                             format: 'yyyy'
                           });
                      </script>
                    </div> 
                    <div class="form-group">
                      <label for="sel2">Select Term:</label>
                      <select class="form-control" id="sel2">
                       
                        
                        <option>ODD</option>
                        <option>EVEN</option>
                      </select>
                    </div>
                    
                    <div class="form-group">
                      <label for="sel2">Enter Branch:</label>
                      <input type="text" class="form-control" id="branchName" value=<?php echo get_branch_name_from_mapid($map_id,$con)?>>
                    </div>  
                    <div class="form-group">
                      <label>  Upload Master Time Table:</label>

                    <form action="upload.php" enctype="multipart/form-data" method="post">
                <!--    Last name:<br /> <input type="text" name="name" value="" /><br />-->
                    <br /> <input type="file" name="classnotes" value="" /><br />
                      <input type="submit" name="submit" value="Submit" />
                    </form>
                    </div>
          </div>
          <div id="menu2" class="tab-pane fade">
            <h3>View TimeTable</h3>
            <p>Some content in menu 2.</p>
          </div>
        </div>
    </div>
</body>

</html>
