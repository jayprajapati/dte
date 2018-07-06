


<?php
 
$data = unserialize($_POST['data']);
//print_r($data);
    
    $zip = new ZipArchive;
    $name=date("Y-m-d").time();
    $random=rand(111111,999999);
    $download = $name.'_'.$random.'-download.zip';

    
    if ($zip->open($download,ZipArchive::CREATE) === TRUE) 
    {
    	 
			
			foreach ($data as $file) {
			    $file=$file.".pdf";
			   // echo $file."<br>";
				$zip->addFile($file);
		
			
   		}
    $zip->close();
    echo 'okok';
    
    echo "<script>location='$download'</script>";
    echo "<script>location='admin.php'</script>";
    
	} else {
	    echo '<script>alert("Failed ! Try Again.");</script>';
	    echo "<script>location='$download'</script>";
	}




?>