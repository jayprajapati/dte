<?php
    $_
    $zip = new ZipArchive;
    $name=date("Y-m-d");
    $download = $name.'-download.zip';
    if ($zip->open($download,ZipArchive::CREATE) === TRUE) {
    $zip->addFile('login.php', 'login.php');
    $zip->close();
    echo 'ok';
	} else {
	    echo 'failed';
	}

?>