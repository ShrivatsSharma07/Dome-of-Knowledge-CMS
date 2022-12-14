<?php
if (isset($_POST['submit'])) {
    $file= $_FILES['file'];
    $fileName = $_FILES['file']['name'];
    $fileTmpName = $_FILES['file']['tmp_name'];
    $fileSize = $_FILES['file']['size'];
    $fileError = $_FILES['file']['error'];
    $fileType = $_FILES['file']['type'];
    $fileExt = explode ('.', $fileName);
    $fileActualExt = strtolower(end($fileExt));

    //Telling PHP which files to allow to get uploaded.
    $allowed = array('pdf','jpeg','jpg','png');

    //If all these conditions are met.
    if(in_array($fileActualExt,$allowed)){
        if($fileError == 0) {
            if ($fileSize <=1000000){
                $fileNameNew = uniqid('',true).".".$fileActualExt;
                $fileDestination = 'uploads/notes/'.$fileNameNew;
                move_uploaded_file ($fileTmpName, $fileDestination);
            }
        
        }
        else{
            echo "There was an error uploading your file.";
        }
    }
    else{
        echo "You cannot upload files of this type. ";
    }
}
?>
