<?php
include("connect.php");
$ssn=$_POST['ssn'];
$query="SELECT ssn,title,room,meetDay,begTime,endTime 
        FROM professor 
        JOIN section 
        ON professor.ssn=section.pSsn 
        WHERE professor.ssn=$ssn;";
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
        <div><h2><strong>View titles, classrooms, meeting days and time</strong></h2></div>
        <table align="center" border="1px" style="width:2000px;line-height:30px;">
            <tr>
                <th colspan="8"><h2>Professor's Record</h2></th>
            </tr>
            <t>
                <th>Social Security Number</th>
                <th>Title</th>
                <th>Classroom</th>
                <th>Meeting Date and Time</th>
            </t>

        <?php
        while($row=mysqli_fetch_assoc($result)){
        ?>
            <tr>
                <td><?php echo $row['ssn']; ?></td>
                <td><?php echo $row['title']; ?></td>
                <td><?php echo $row['room']; ?></td>
                <td><?php echo $row['meetDay'], ', ', $row['begTime'],'-',$row['endTime']; ?></td>
            </tr>
        <?php
        };
        mysqli_free_result($result);
        mysqli_close($conn);
        ?>
        </table>
        
    </body>
</html>
