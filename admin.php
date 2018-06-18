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
    
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">  
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script> </head>
    
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
          <table class=table name=mytable id=mytable>
            <thead>
              <tr>
                <th>#</th>
                <th>Institute Name</th>
                <th>Academic Year</th>
                <th>Term</th>
                <th>Branch</th>
                <th>Course Name</th>
                <th>Course Type</th>
                <th>status</th>
                <th>View | Download</th>
              </tr>
            </thead>
            <tbody>";
            $courseSno=1;
            while ($row = mysqli_fetch_array($result)) 
            {
              echo "<tr>
                <td>".$courseSno."</td>
                <td>".get_inst_name_from_mapid($row['map_id'],$con)."</td>";
                
                if($row['a_year']==0)
                {
                  echo "<td><i>None</i></td>";
                  echo "<td><i>None</i></td>";
                  echo "<td><i>None</i></td>";
                }else
                {
                  echo "<td><div class='fil_year'>".$row['a_year']."</td>"; 
                    echo "<td>".$row['term']."</td>
                <td>".$row['branch_name']."</td>";
                }
                  echo "<td>".$row['course_name']."</td>
                <td>".get_course_type_name_from_course_type_id($row['course_type_id'],$con)."</td>";
                
                if($row['status']=="NOT UPLOADED")
                {  echo "<td><i><span style=color:red>".$row['status']."</span></i></td>";
                  echo "<td>-</td>";
                }else
                {
                  echo "<td><i>".$row['status']."</i></td>";
                  echo "<td><a href='uploads/".$row['filename'].".pdf' target=_blank>View</a> | ";
                  echo "<div id=download class=download href='uploads/".$row['filename'].".pdf'><a href='uploads/".$row['filename'].".pdf' download=newfilename>Download</a></div></td>
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
    ?>
     <script>
        $(document).ready(function(){
          $("#filter_year").on("keyup", function() {
            //alert("gek");
            //var numOfVisibleRows = $('tr:visible #download');
            //var numOfVisibleRows= document.getElementsByClassName('download');
            /*for (var i=0;i<numOfVisibleRows.length;i++) {
                var yes=numOfVisibleRows[i].attr('href');

                alert(yes);
            }*/
            //alert(numOfVisibleRows);
            var value = $(this).val().toLowerCase();
            $("#mytable tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
              

            });
          });
        });
    </script> 
</head>

<body>
    <div class="container" style="width: 90%;">
        <h1>DTE Gujarat</h1>  <hr> 
        <div style="width: 100%;text-align: right;"><a href=logout.php>Log Out</a></div>    
        <div style="width: 100%;text-align: right;" id="mycountt"></div>    
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">View/Download</a></li>
            <li><a data-toggle="tab" href="#menu1">Report</a></li>
            
        </ul>

        <div class="tab-content" style="background-color: white">
            <div id="home" class="tab-pane fade in active">
                
                <div class="main">
                      <label for="sel1">Search here..</label>
                      <input class="form-control" style="width: 300px;" type="text" id="filter_year" name="filter_year" value="">
                      <div style="width: 100%;text-align: right;">
                      <a href=download_all.php><button style="" type="button" class="btn">Download All</button></a>
                      </div>
                </div>
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