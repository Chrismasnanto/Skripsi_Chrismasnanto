<?php
$current_page = basename($_SERVER['PHP_SELF']);
$current_folder = basename(dirname($_SERVER['PHP_SELF']));
?>

<aside class="admin-sidebar">

    <div class="sidebar-brand">
        <img src="/assets/img/logo/logo.png" 
             alt="Logo Tenun Ikat Sumba Barat" 
             class="admin-logo">

        <div>
            <h5>
                TENUN IKAT<br>
                SUMBA BARAT
            </h5>

            <p>Admin Panel</p>
        </div>
    </div>

    <nav class="sidebar-menu">

        <a href="/admin/dashboard.php" class="<?= ($current_page == 'dashboard.php') ? 'active' : ''; ?>">
            <i class="bi bi-house-door-fill"></i>
            <span>Dashboard</span>
        </a>

        <a href="/admin/beranda/index.php" class="<?= ($current_folder == 'beranda') ? 'active' : ''; ?>">
            <i class="bi bi-house-door"></i>
            <span>Beranda</span>
        </a>

        <a href="/admin/sejarah/index.php" class="<?= ($current_folder == 'sejarah') ? 'active' : ''; ?>">
            <i class="bi bi-clock-history"></i>
            <span>Sejarah</span>
        </a>

        <a href="/admin/motif/index.php" class="<?= ($current_folder == 'motif') ? 'active' : ''; ?>">
            <i class="bi bi-grid-3x3-gap"></i>
            <span>Motif & Makna</span>
        </a>

        <a href="/admin/proses/index.php" class="<?= ($current_folder == 'proses') ? 'active' : ''; ?>">
            <i class="bi bi-sliders"></i>
            <span>Proses Pembuatan</span>
        </a>

        <a href="/admin/galeri/index.php" class="<?= ($current_folder == 'galeri') ? 'active' : ''; ?>">
            <i class="bi bi-image"></i>
            <span>Galeri</span>
        </a>

        <a href="/admin/about/index.php" class="<?= ($current_folder == 'about') ? 'active' : ''; ?>">
            <i class="bi bi-info-circle"></i>
            <span>About</span>
        </a>

    </nav>

    <div class="sidebar-logout">
        <a href="/admin/logout.php">
            <i class="bi bi-box-arrow-left"></i>
            <span>Logout</span>
        </a>
    </div>

</aside>