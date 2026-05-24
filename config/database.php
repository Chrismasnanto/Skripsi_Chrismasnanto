<?php

$host = "localhost";
$user = "root";
$pass = "123";
$db   = "tenun_ikat_sumba_barat";

$conn = mysqli_connect($host,$user,$pass,$db);

if(!$conn){
    die("Koneksi gagal : ".mysqli_connect_error());
}

?>