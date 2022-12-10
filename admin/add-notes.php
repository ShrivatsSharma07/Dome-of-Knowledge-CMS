<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['create']))
{
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
            if ($fileSize <=10000000){
                $fileNameNew = uniqid('',true).".".$fileActualExt;
                $fileDestination = 'uploads/notes/'.$fileNameNew;
                move_uploaded_file ($fileTmpName, $fileDestination);
            }
        
        }
        else{
         $_SESSION['error']="There was an error uploading your file.";
        }
    }
    else{
        $_SESSION['error']="You cannot upload files of this type. ";
    }
$notes=$_POST['notes'];
$name=$_POST['name'];
$subject=$_POST['subject'];
$status=$_POST['status'];
//$link='$fileDestination';

$sql="INSERT INTO  tblnotes(Name,Subject,Status,Link) VALUES("."'$name'".","."'$subject'".","."'$status'".","."'$fileDestination'".");";
//$sql = "UPDATE tblnotes set Name="."'$name'".",Subject="."'$subject'".", Link="."'$link'"." WHERE id="."$catid".";";
$query = $dbh->prepare($sql);
$query->bindParam(':name',$name,PDO::PARAM_STR);
$query->bindParam(':subject',$subject,PDO::PARAM_STR);
$query->bindParam(':status',$status,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Notes Listed successfully";
header('location:manage-notes.php');
}
else 
{
    
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-notes.php');
}

}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Add Categories</title>
    
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
   
    <link href="assets/css/style.css" rel="stylesheet" />
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------header-->
<?php include('includes/header.php');?>

    <div class="content-wrap">
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add category</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Category Info
</div>
<div class="panel-body">
<form role="form" method="post" attribute enctype="multipart/form-data">
<div class="form-group">
<label>Note Name</label>
<input class="form-control" type="text" name="name" autocomplete="off" required />
</div>
<div class="form-group">
<label>Note Subject</label>
<input class="form-control" type="text" name="subject" autocomplete="off" required />
</div>
<div class="form-group">
<label>Upload</label>
<input class="btn btn-info" type="file" name="file" autocomplete="off" required />
</div>
<div class="form-group">
<label>Status</label>
 <div class="radio">
<label>
<input type="radio" name="status" id="status" value="1" checked="checked">Active
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="status" id="status" value="0">Inactive
</label>
</div>

</div>
<button type="create" name="create" class="btn btn-info">Create </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>

  <?php include('includes/footer.php');?>

</body>
</html>
<?php } ?>
