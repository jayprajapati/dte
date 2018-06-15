<?php
 define ("filesplace","./");

 if (is_uploaded_file($_FILES['classnotes']['tmp_name'])) {

 if ($_FILES['classnotes']['type'] != "application/pdf") {
 echo "<p>Class notes must be uploaded in PDF format.</p>";
 } else {
 $name = $_POST['name'];
 //$name = '123132';
 $result = move_uploaded_file($_FILES['classnotes']['tmp_name'], filesplace."uploads/$name.pdf");
 if ($result == 1) echo "<p>Upload done .</p>";
 else echo "<p>Sorry, Error happened while uploading . </p>";
} #endIF
 } #endIF
?>