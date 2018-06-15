<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <?php include('php_include.php') ?>
</head>

<body>
    <div class="container" style="width: 90%;">
        <h1>DTE Gujarat</h1>
        <hr>
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">Upload Time-Table</a></li>
            <li><a data-toggle="tab" href="#menu1">View/Previous Time-Table</a></li>

        </ul>

        <div class="tab-content" style="background-color: white">
            <div id="home" class="tab-pane fade in active">
                <h3>Upload Time-Table</h3>
                <form action="/action_page.php">
                    <div class="form-group">
                      <label for="sel1">Select Academic Year:</label>
                      <select class="form-control" id="sel1">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                      </select>
                    </div> 
                    <div class="form-group">
                      <label for="sel2">Select Term:</label>
                      <select class="form-control" id="sel2">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="sel3">Degree Course:</label>
                      <select class="form-control" id="sel3">
                        <option>UG</option>
                        <option>PG</option>
                        
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="sel2">Select Branch:</label>
                      <select class="form-control" id="sel4">
                        <php display_branch(); ?>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                      </select>
                    </div>  
                    <div class="form-group">
                        Select image to upload:
                        <input type="file" name="fileToUpload" id="fileToUpload">
                        
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
            <div id="menu1" class="tab-pane fade">
                <h3>Menu 1</h3>
                <p>Some content in menu 1.</p>
            </div>

        </div>
    </div>
</body>

</html>