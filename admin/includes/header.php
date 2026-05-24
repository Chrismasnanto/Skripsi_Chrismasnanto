<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


if (!isset($_SESSION['admin'])) {
    header("Location: /admin/login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Tenun Ikat Sumba Barat</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/img/logo/favicon.png">
<link rel="shortcut icon" href="/assets/img/logo/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/assets/css/admin.css">
</head>

<body>

<div class="admin-wrapper">