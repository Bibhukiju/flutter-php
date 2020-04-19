<?php
include 'conn.php';
$name=$_POST["name"];
$price=$_POST["price"];
$conn->query("INSERT INTO priceList(name,price)VALUES('$name','$price') ");
?>
