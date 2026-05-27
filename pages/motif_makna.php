<?php
include "../config/database.php";
include "../includes/header.php";
include "../includes/navbar.php";


/** @var mysqli $conn */

$queryMotif = mysqli_query($conn, "SELECT * FROM motif_makna ORDER BY id_motif ASC");
$totalMotif = mysqli_num_rows($queryMotif);
?>

<section class="motif-hero">
    <div class="container">
        <div class="row align-items-center gy-5">

            <div class="col-lg-6">
                <span class="section-badge">MOTIF & MAKNA</span>

                <h1>
                    Motif & Makna<br>
                    Tenun Ikat Sumba Barat
                </h1>

                <p>
                    Setiap motif Tenun Ikat Sumba Barat memiliki makna
                    yang mendalam dan diwariskan secara turun-temurun.
                    Melalui motif, masyarakat Sumba Barat mengekspresikan
                    nilai-nilai kehidupan, kepercayaan, dan identitas budaya.
                </p>
            </div>

            <div class="col-lg-6">
                <div class="motif-hero-image-box">
                    <img src="/assets/img/motif/hero-motif.png"
                        alt="Motif Tenun Ikat Sumba Barat"
                        class="motif-hero-img">
                </div>
            </div>

        </div>
    </div>
</section>


<section class="motif-list-section">
    <div class="container">

        <div class="text-center mb-5">
            <h2 class="section-title">
                Daftar Motif Tenun Ikat Sumba Barat
            </h2>

            <p class="section-subtitle">
                Jelajahi berbagai motif khas beserta makna yang terkandung di dalamnya.
            </p>
        </div>

        <div class="row g-4">

            <?php if ($totalMotif > 0) : ?>
                <?php $index = 1; ?>

                <?php while ($m = mysqli_fetch_assoc($queryMotif)) : ?>

                    <?php
                    $modalId = "modalMotif" . $index;

                    $gambar = !empty($m['gambar'])
                        ? "/uploads/motif/" . $m['gambar']
                        : "/assets/img/motif/default-motif.jpg";
                    ?>

                    <div class="col-md-6 col-lg-3">
                        <div class="motif-card">

                            <img src="<?= htmlspecialchars($gambar); ?>"
                                alt="<?= htmlspecialchars($m['nama_motif']); ?>"
                                class="motif-card-img">

                            <div class="motif-card-body">
                                <h4><?= htmlspecialchars($m['nama_motif']); ?></h4>

                                <div class="motif-location">
                                    Asal : <?= htmlspecialchars($m['asal_daerah']); ?>
                                </div>

                                <p>
                                    <?= nl2br(htmlspecialchars($m['makna'])); ?>
                                </p>

                                <a href="#"
                                    data-bs-toggle="modal"
                                    data-bs-target="#<?= $modalId; ?>">
                                    Lihat Detail
                                </a>
                            </div>
                        </div>
                    </div>


                    <!-- MODAL DETAIL MOTIF -->
                    <div class="modal fade" id="<?= $modalId; ?>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content motif-modal-content">

                                <div class="modal-header motif-modal-header">
                                    <h5 class="modal-title">
                                        <?= htmlspecialchars($m['nama_motif']); ?>
                                    </h5>

                                    <button type="button"
                                        class="btn-close"
                                        data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>

                                <div class="modal-body motif-modal-body">
                                    <div class="row g-4 align-items-center">

                                        <div class="col-md-5">
                                            <div class="motif-modal-image">
                                                <img src="<?= htmlspecialchars($gambar); ?>"
                                                    alt="<?= htmlspecialchars($m['nama_motif']); ?>">
                                            </div>
                                        </div>

                                        <div class="col-md-7">
                                            <span class="section-badge">DETAIL MOTIF</span>

                                            <h3><?= htmlspecialchars($m['nama_motif']); ?></h3>

                                            <p class="motif-modal-origin">
                                                <i class="bi bi-geo-alt"></i>
                                                Asal Daerah: <?= htmlspecialchars($m['asal_daerah']); ?>
                                            </p>

                                            <p>
                                                <?= nl2br(htmlspecialchars($m['makna'])); ?>
                                            </p>
                                        </div>

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
                            Data motif dan makna belum tersedia.
                        </p>
                    </div>
                </div>

            <?php endif; ?>

        </div>

    </div>
</section>

<?php include "../includes/footer.php"; ?>