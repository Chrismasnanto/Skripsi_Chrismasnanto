<?php
include "../config/database.php";
include "../includes/header.php";
include "../includes/navbar.php";


/** @var mysqli $conn */

$queryGaleri = mysqli_query($conn, "SELECT * FROM galeri ORDER BY id_galeri ASC");
$totalGaleri = mysqli_num_rows($queryGaleri);
?>

<section class="gallery-hero">
    <div class="container">
        <div class="row align-items-center gy-5">

            <div class="col-lg-6">
                <span class="section-badge">GALERI</span>

                <h1>
                    Galeri Tenun Ikat<br>
                    Sumba Barat
                </h1>

                <p>
                    Kumpulan dokumentasi visual Tenun Ikat Sumba Barat dalam berbagai
                    motif, proses pembuatan, dan kegiatan budaya masyarakat.
                </p>
            </div>

            <div class="col-lg-6">
                <img src="/assets/img/galeri/galeri.png"
                     alt="Galeri Tenun Ikat Sumba Barat"
                     class="gallery-hero-img">
            </div>

        </div>
    </div>
</section>


<section class="gallery-section">
    <div class="container">

        <div class="text-center mb-5">
            <h2 class="section-title">
                Koleksi Galeri
            </h2>

            <p class="section-subtitle">
                Dokumentasi visual Tenun Ikat Sumba Barat sebagai media pengenalan budaya.
            </p>
        </div>

        <div class="row g-4">

            <?php if ($totalGaleri > 0) : ?>
                <?php $index = 1; ?>

                <?php while ($g = mysqli_fetch_assoc($queryGaleri)) : ?>

                    <?php
                    $modalId = "modalGaleri" . $index;

                    $gambar = !empty($g['gambar'])
                        ? "/uploads/galeri/" . $g['gambar']
                        : "/assets/img/galeri/default-galeri.jpg";
                    ?>

                    <div class="col-md-6 col-lg-3">
                        <div class="gallery-card">

                            <img src="<?= htmlspecialchars($gambar); ?>"
                                 alt="<?= htmlspecialchars($g['judul']); ?>"
                                 class="gallery-card-img">

                            <div class="gallery-card-body">
                                <h4><?= htmlspecialchars($g['judul']); ?></h4>

                                <p>
                                    <?= nl2br(htmlspecialchars($g['keterangan'])); ?>
                                </p>

                                <a href="#"
                                   data-bs-toggle="modal"
                                   data-bs-target="#<?= $modalId; ?>">
                                    Lihat Detail
                                </a>
                            </div>
                        </div>
                    </div>


                    <!-- MODAL DETAIL GALERI -->
                    <div class="modal fade" id="<?= $modalId; ?>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content gallery-modal-content">

                                <div class="modal-header gallery-modal-header">
                                    <h5 class="modal-title">
                                        <?= htmlspecialchars($g['judul']); ?>
                                    </h5>

                                    <button type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>

                                <div class="modal-body gallery-modal-body">

                                    <div class="gallery-modal-image">
                                        <img src="<?= htmlspecialchars($gambar); ?>"
                                             alt="<?= htmlspecialchars($g['judul']); ?>">
                                    </div>

                                    <div class="gallery-modal-text">
                                        <h3><?= htmlspecialchars($g['judul']); ?></h3>

                                        <p>
                                            <?= nl2br(htmlspecialchars($g['keterangan'])); ?>
                                        </p>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                    <?php $index++; ?>
                <?php endwhile; ?>

            <?php else : ?>

                <div class="col-12">
                    <div class="text-center">
                        <p>
                            Data galeri belum tersedia.
                        </p>
                    </div>
                </div>

            <?php endif; ?>

        </div>

    </div>
</section>

<?php include "../includes/footer.php"; ?>