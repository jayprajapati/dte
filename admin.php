<?php include('php_include.php'); ?>

<?php require('session.php'); ?>
<?php include('all_function.php'); ?>
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <?php
    function show_admin_course($con)
    {
        //$my_map = $_SESSION['map_id'];
        $sql="select * from tt_course_master";
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
                    <th>College Name</th>
                    <th>Branch Name</th>
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
                    <td>".get_inst_name_from_mapid($row['map_id'],$con)."</td>
                    <td>".get_branch_name_from_mapid($row['map_id'],$con)."</td>
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
</head>

<body>
    <div class="container" style="width: 90%;">
        <h1>DTE Gujarat</h1>       
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">View/Download</a></li>
            <li><a data-toggle="tab" href="#menu1">Report</a></li>
            
        </ul>

        <div class="tab-content" style="background-color: white">
            <div id="home" class="tab-pane fade in active">
                <h3>HOME</h3>
                <p><?php show_admin_course($con)?></p>
            </div>
            <div id="menu1" class="tab-pane fade">
                <h3>Menu 1</h3>
                <p>Some content in menu 1.</p>
            </div>
           
        </div>
    </div>
</body>

</html>