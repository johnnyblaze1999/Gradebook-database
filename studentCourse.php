<!DOCTYPE html>
<html>
    <head>
        <title>Student's View Page</title>
    </head>
    
    <body>
        <h1><strong>Student's View Page</strong></h1>
        <?php
        include("connect.php");
        $course=$_POST['course'];
        $query="SELECT section.sNum,section.room,section.meetDay,section.begTime,section.endTime,section.numSeat,
                COUNT(record.cwid) AS aos
                FROM section
                JOIN record
                WHERE section.cNum='$course' AND section.sNum=record.sNum
                GROUP BY record.sNum";
        $result=mysqli_query($conn,$query);
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        ?>
        <div><h2><strong>View course's sections, classrooms, meeting date/time,</strong></h2></div>
        <table align="center" border="1px" style="width:2000px;line-height:30px;">
            <tr>
                <th colspan="8"><h2>Sections for <?php echo $course; ?></h2></th>
            </tr>
            <t>
                <th>Course's section</th>
                <th>Classroom</th>
                <th>Metting Date and Time</th>
                <th>Students In Class</th>
            </t>

        <?php
        while($row=mysqli_fetch_assoc($result)){
        ?>
            <tr>
                <td><?php echo $row['sNum']; ?></td>
                <td><?php echo $row['room']; ?></td>
                <td><?php echo $row['meetDay'], ', ', $row['begTime'],'-',$row['endTime']; ?></td>
                <td><?php echo $row['aos'], '/', $row['numSeat'] ?></td>
            </tr>
        <?php
        };
        mysqli_free_result($result);
        mysqli_close($conn);
        ?>
        </table>
        
    </body>
</html>
