<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else
{
$id=intval($_GET['id']);
$sql = "SELECT * from  tblvideos WHERE id="."'$id'"."";
$query = $dbh -> prepare($sql);
$query->execute();
$result=$query->fetchAll(PDO::FETCH_OBJ);
}
{
    foreach($results as $result)
    {               ?>


<html>
    <head>
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <h1>Hi  <?php echo $id; 
        echo htmlentities($result->Link);?></h1>
        <video controls="" autoplay="" name="media">
            <source src="<?php echo htmlentities($result->Link);?>" type="video/mov">
    </video>
<iframe src="<?php echo htmlentities($result->Link);?>" width="100px" height="100px"></iframe>
</body>
</html>
<?php }} ?>