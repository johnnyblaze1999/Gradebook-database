<?php
include("connect.php");
$course=$_POST['course'];
$section=$_POST['section'];
$query="SELECT COUNT(CASE WHEN grade='A' THEN 1 END) AS A, 
        COUNT(CASE WHEN grade='B' THEN 1 END) AS B, 
        COUNT(CASE WHEN grade='C' THEN 1 END) AS C, 
        COUNT(CASE WHEN grade='D' THEN 1 END) AS D, 
        COUNT(CASE WHEN grade='F' THEN 1 END) AS F
        FROM record
        WHERE cNum='$course' AND sNum='$section'";
$result=mysqli_query($conn,$query);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Professor's View Page</title>
    </head>
    
    <body>
        <h1><strong>Professor's View Page</strong></h1>
        <div><h2><strong>Count students' Grade for 
            <?php
            echo $course,', ', $section; ?>
            </strong></h2></div>
        <table align="center" border="1px" style="width:2000px;line-height:30px;">
            <tr>
                <th colspan="8"><h2>Section's Record</h2></th>
            </tr>
            <t>
                <th>Course</th>
                <th>Section</th>
                <th>A</th>
                <th>B</th>
                <th>C</th>
                <th>D</th>
                <th>F</th>
            </t>

        <?php
        while($row=mysqli_fetch_assoc($result)){
        ?>
            <tr>
                <td><?php echo $course; ?></td>
                <td><?php echo $section; ?></td>
                <td><?php echo $row['A']; ?></td>
                <td><?php echo $row['B']; ?></td>
                <td><?php echo $row['C']; ?></td>
                <td><?php echo $row['D']; ?></td>
                <td><?php echo $row['F']; ?></td>
            </tr>
        <?php
        };
        mysqli_free_result($result);
        mysqli_close($conn);
        ?>
        </table>
        
    </body>
</html>
