<?php
include("connect.php");
$cwid=$_POST['cwid'];
$query="SELECT cNum AS Course,grade AS Grade
        FROM record
        WHERE cwid='$cwid'";
$result=mysqli_query($conn,$query);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Student's View Page</title>
    </head>
    
    <body>
        <h1><strong>Student's View Page</strong></h1>
        <div><h2><strong>View My Courses</strong></h2></div>
        <table align="center" border="1px" style="width:2000px;line-height:30px;">
            <tr>
                <th colspan="8"><h2>Courses Taken</h2></th>
            </tr>
            <t>
                <th>Course Name</th>
                <th>Grade</th>
            </t>

        <?php
        while($row=mysqli_fetch_assoc($result)){
        ?>
            <tr>
                <td><?php echo $row['Course']; ?></td>
                <td><?php echo $row['Grade']; ?></td>
        <?php
        };
        mysqli_free_result($result);
        mysqli_close($conn);
        ?>
        </table>
        
    </body>
</html>
