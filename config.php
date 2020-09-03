<?php

$db_host = "smallpro2.cge3wy8cu4rk.us-east-2.rds.amazonaws.com";
$db_user = "root";
$db_pass = "1234567890";
$db_name = "dbsmall";

try {    
    //create PDO connection 
    $db = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
} catch(PDOException $e) {
    //show error
    die("Terjadi masalah: " . $e->getMessage());
}
