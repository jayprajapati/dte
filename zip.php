<?php
    
    $zip = new ZipArchive;
    $name=date("Y-m-d");
    $download = $name.'-download.zip';

    $directory="uploads/";
    if ($zip->open($download,ZipArchive::CREATE) === TRUE) 
    {
    	if ($handle = opendir($directory))
   		{ 
			
			$zip->addFile($directory.$filename);
   			$zip->addFile($directory.$filename1);
   			$zip->addFile($directory.$filename2);
   		}
    $zip->close();
    echo 'ok';
	} else {
	    echo 'failed';
	}

?>

