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
                <th>View | Download</th>
              </tr>
            </thead>
            <tbody>";
            $courseSno=1;
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
          $("#filter_sql").click(function ()
            {
                //alert("yes");
                var jay=[];
                var term=$("#term_sql").val();
                var clg=$("#clg_list").val();
                      $.post("newtest.php",
                      {
                        term : term,
                        clg : clg  
                          
                      },
                    function(data, status){
                        //alert("Data:"+data + " \nStatus: "+ status );
                        //document.write(data);
                        //$("#thisthis").text("yes");
                        ///window.location.replace('index.php');
                        
                        //alert($courseSno);
                        $("#mystatus").html(data);
                        
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
            <li class="active"><a data-toggle="tab" href="#menu1">Report</a></li>
            <li><a data-toggle="tab" href="#home">View | Download</a></li>
            
            
        </ul> 
        
        <div class="tab-content" style="background-color: white">
            <div id="home" class="tab-pane fade">
                 <div style=width:100%;text-align:right;padding:10px;>
                  
                <a href=download_all.php>
                    <button class='btn'>
                  Download ALL | <span class='glyphicon glyphicon-download-alt'></span>   
                  </button>
                </a>        
                </div>
                <div class="main" style="padding: 10px;">
                    
                      <label for="sel1">Institute Name:</label>
                      <select name=clg_list  class="form-control" id="clg_list">
                      <option value="*">ALL</option>
                      <?php all_clg($con);?>
                    </select>
                      <label for="sel3">Term: (ODD or EVEN)</label>
                      <select name="term_sql"  class="form-control" id="term_sql" >
                        <option value="*">ALL</option>
                        <option value="ODD">ODD</option>
                        <option value="EVEN">EVEN</option>
                      </select>
                      <br>
                      <button type="submit" class="btn btn-default" id="filter_sql">Submit</button>
                    
                      <div id="mystatus"><?php show_admin_course($con)?></div>
                </div>
                <p></p>
            </div>
            <div id="menu1" class="tab-pane fade in active">
                <h3>Report Card</h3>
                <p><?php show_admin_report($con)?></p>
            </div>
           
        </div>
    </div>
</body>

</html>