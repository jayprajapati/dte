<?php
    $zip = new ZipArchive;
    $name=date("Y-m-d");
    $download = $name.'-download.zip';
    $zip->open($download, ZipArchive::CREATE);
    foreach (glob("uploads/*.pdf") as $file) { /* Add appropriate path to read content of zip */
        $zip->addFile($file);
    }
    $zip->close();
    header('Content-Type: application/zip');
    header("Content-Disposition: attachment; filename = $download");
    header('Content-Length: ' . filesize($download));
    header("Location: $download");
 ?>