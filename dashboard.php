<?php include('php_include.php'); ?>
<?php require('session.php'); ?>
<?php
function display_course($con)
{
    # code...

    $my_map=$_SESSION['map_id'];
 $sql="select * from tt_course_master WHERE map_id=$my_map";

    
  //echo $sql;
  $result = mysqli_query($con,$sql) or die(mysqli_error($con));  
  echo "<select class=form-control id=courseList>";
   echo "<option>--select--</option>";
  
  while($row = mysqli_fetch_array($result))
  {
    echo "<option>".$row['course_name']."</option>";
  }
  echo "</select>";
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
          </div>
          <div id="menu1" class="tab-pane fade">
            <h3>Upload time-table</h3>
            <label >All fields are mandatory!</label>
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
                       
                        <option>--select--</option>
                        <option>ODD</option>
                        <option>EVEN</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="sel3">Added Course:</label>
                      <?php display_course($con); ?>

                    </div>
                    <div class="form-group">
                      <label for="sel2">Select Branch:</label>
                      <select class="form-control" id="sel4">
                        <php display_branch(); ?>
                         <option>--select--</option>
                       <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                      </select>
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
