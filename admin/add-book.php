<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['add']))
{



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
                    $fileDestination = 'uploads/books/'.$fileNameNew;
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
    }


$bookname=$_POST['bookname'];
$author=$_POST['author'];
$subject=$_POST['subject'];
//$sql="INSERT INTO  tblbooks(BookName,Author,ISBNNumber,BookPrice) VALUES(:bookname,:category,:author,:isbn,:price)";
$sql="INSERT INTO  tblbooks(BookName,subject,Author,Link) VALUES("."'$bookname'".","."'$subject'".","."'$author'".","."'$fileDestination'".");";
$query = $dbh->prepare($sql);
$query->bindParam(':bookname',$bookname,PDO::PARAM_STR);
$query->bindParam(':author',$author,PDO::PARAM_STR);
$query->bindParam(':subject',$subject,PDO::PARAM_STR);
$query->bindParam(':link',$fileDestination,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Book Listed successfully";
header('location:manage-books.php');
}
else 
{
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-books.php');
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
    <title>Online Library Management System | Add Book</title>
    
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    
    <link href="assets/css/style.css" rel="stylesheet" />
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------header-->
<?php include('includes/header.php');?>

    <div class="content-wra
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Book</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Book Info
</div>
<div class="panel-body">
<form role="form" method="post" attribute enctype="multipart/form-data">
<div class="form-group">
<label>Book Name<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="bookname" autocomplete="off"  required />
</div>
<div class="form-group">
<label>Subject<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="subject" autocomplete="off"  required />
</div>
<div class="form-group">
<label>Author<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="author" autocomplete="off"  required />
</div>
<label>Upload Book</label>
<input class="btn btn-info" type="file" name="file" autocomplete="off" required />
</div>
</div>

<!--<div class="form-group">
<label>ISBN Number<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="isbn"  required="required" autocomplete="off"  />
<p class="help-block">An ISBN is an International Standard Book Number. ISBN Must be unique</p>
</div>

 <div class="form-group">
 <label>Price<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="price" autocomplete="off"   required="required" />
 </div>-->
<button type="submit" name="add" class="btn btn-info">Add </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>
<!--footer-->
  <?php include('includes/footer.php');?>

</body>
</html>
<?php } ?>
