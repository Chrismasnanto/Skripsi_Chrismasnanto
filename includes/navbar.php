<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">

        <a class="navbar-brand d-flex align-items-center" href="/index.php">
            <img src="/assets/img/logo/logo.png"
                 alt="Logo Tenun Ikat Sumba Barat"
                 class="navbar-logo me-2">

            <span class="fw-bold">
                TENUN IKAT SUMBA BARAT
            </span>
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarMenu"
                aria-controls="navbarMenu"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarMenu">
            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link <?= ($current_page == 'index.php') ? 'active-nav' : ''; ?>" href="/index.php">
                        Beranda
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <?= ($current_page == 'sejarah.php') ? 'active-nav' : ''; ?>" href="/pages/sejarah.php">
                        Sejarah
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <?= ($current_page == 'motif_makna.php') ? 'active-nav' : ''; ?>" href="/pages/motif_makna.php">
                        Motif & Makna
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <?= ($current_page == 'proses_pembuatan.php') ? 'active-nav' : ''; ?>" href="/pages/proses_pembuatan.php">
                        Proses Pembuatan
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <?= ($current_page == 'galeri.php') ? 'active-nav' : ''; ?>" href="/pages/galeri.php">
                        Galeri
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <?= ($current_page == 'about.php') ? 'active-nav' : ''; ?>" href="/pages/about.php">
                        About
                    </a>
                </li>

            </ul>
        </div>

    </div>
</nav>