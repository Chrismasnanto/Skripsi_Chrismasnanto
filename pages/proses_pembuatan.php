<?php
include "../config/database.php";
include "../includes/header.php";
include "../includes/navbar.php";

$queryProses = mysqli_query($conn, "SELECT * FROM proses_pembuatan ORDER BY id_proses ASC");
$totalProses = mysqli_num_rows($queryProses);
?>

<section class="process-hero">
    <div class="container">
        <div class="row align-items-center gy-5">

            <div class="col-lg-6">
                <span class="section-badge">PROSES PEMBUATAN</span>

                <h1>
                    Proses Pembuatan<br>
                    Tenun Ikat Sumba Barat
                </h1>

                <p>
                    Proses pembuatan Tenun Ikat Sumba Barat dilakukan secara tradisional
                    dan diwariskan dari generasi ke generasi. Setiap tahapan dibuat dengan
                    ketelitian dan penuh makna untuk menghasilkan kain yang berkualitas.
                </p>
            </div>

            <div class="col-lg-6">
                <img src="/assets/img/proses/proses.png"
                     alt="Proses Pembuatan Tenun Ikat Sumba Barat"
                     class="process-hero-img">
            </div>

        </div>
    </div>
</section>


<section class="proses-page-section">
    <div class="container">

        <div class="text-center mb-5">
            <h2 class="section-title">
                Tahapan Pembuatan Tenun Ikat
            </h2>

            <p class="section-subtitle">
                Berikut adalah tahapan tradisional dalam membuat Tenun Ikat Sumba Barat.
            </p>
        </div>

        <div class="proses-list-wrapper">

            <?php if ($totalProses > 0) : ?>
                <?php $no = 1; ?>

                <?php while ($p = mysqli_fetch_assoc($queryProses)) : ?>

                    <?php
                    $nomor = str_pad($no, 2, '0', STR_PAD_LEFT);

                    $gambar = !empty($p['gambar'])
                        ? "/uploads/proses/" . $p['gambar']
                        : "/assets/img/proses/default-proses.jpg";

                    $modalId = "modalProses" . $p['id_proses'];
                    ?>

                    <div class="proses-step-card">

                        <div class="proses-step-number">
                            <?= $nomor; ?>
                        </div>

                        <div class="proses-step-image"
                             data-bs-toggle="modal"
                             data-bs-target="#<?= $modalId; ?>">
                            <img src="<?= htmlspecialchars($gambar); ?>"
                                 alt="<?= htmlspecialchars($p['judul']); ?>">
                        </div>

                        <div class="proses-step-content">
                            <h3><?= htmlspecialchars($p['judul']); ?></h3>

                            <p>
                                <?= nl2br(htmlspecialchars($p['isi'])); ?>
                            </p>
                        </div>

                    </div>


                    <!-- MODAL FOTO ASLI -->
                    <div class="modal fade" id="<?= $modalId; ?>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-xl modal-dialog-centered">
                            <div class="modal-content proses-modal-content">

                                <div class="modal-header proses-modal-header">
                                    <h5 class="modal-title">
                                        <?= htmlspecialchars($p['judul']); ?>
                                    </h5>

                                    <button type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>

                                <div class="modal-body proses-modal-body">
                                    <div class="proses-modal-image">
                                        <img src="<?= htmlspecialchars($gambar); ?>"
                                             alt="<?= htmlspecialchars($p['judul']); ?>">
                                    </div>

                                    <div class="proses-modal-text">
                                        <h3><?= htmlspecialchars($p['judul']); ?></h3>

                                        <p>
                                            <?= nl2br(htmlspecialchars($p['isi'])); ?>
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <?php $no++; ?>

                <?php endwhile; ?>

            <?php else : ?>

                <div class="text-center">
                    <p>Data proses pembuatan belum tersedia.</p>
                </div>

            <?php endif; ?>

        </div>

    </div>
</section>

<?php include "../includes/footer.php"; ?>