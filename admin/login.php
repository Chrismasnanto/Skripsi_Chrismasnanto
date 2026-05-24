<?php
session_start();
require_once __DIR__ . "/../config/database.php";

$error = "";

if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $query = mysqli_query($conn, "SELECT * FROM admin WHERE username='$username' LIMIT 1");
    $admin = mysqli_fetch_assoc($query);

    if ($admin && $password == $admin['password']) {
        $_SESSION['admin'] = $admin['id_admin'];
        $_SESSION['nama'] = $admin['nama'];
        $_SESSION['username'] = $admin['username'];

        header("Location: /admin/dashboard.php");
        exit;
    } else {
        $error = "Username atau password salah.";
    }
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Login Admin - Tenun Ikat Sumba Barat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/assets/css/admin.css">
</head>

<body>

    <section class="login-page">
        <div class="login-card">

            <div class="login-logo">
                <img src="/assets/img/logo/logo.png" alt="Logo Tenun Ikat Sumba Barat">
            </div>

            <h1>Login Admin</h1>

            <p>
                Silahkan masuk untuk mengelola website
            </p>

            <?php if (!empty($error)) : ?>
                <div class="login-error">
                    <?= $error; ?>
                </div>
            <?php endif; ?>

            <form action="" method="POST">

                <div class="form-group">
                    <i class="bi bi-person"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>

                <div class="form-group">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>

                <button type="submit" name="login">
                    Login
                </button>

            </form>

            <div class="login-copyright">
                © 2026 Tenun Ikat Sumba Barat
            </div>

        </div>
    </section>

</body>

</html>