<?php
$servername = "mariadb";
$username = "cs332t24";
$password = "RzPqGC2U";
$dbname = "cs332t24";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>