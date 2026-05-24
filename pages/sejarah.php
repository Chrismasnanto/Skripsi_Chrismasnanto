<?php
include "../config/database.php";
include "../includes/header.php";
include "../includes/navbar.php";

/*
    HERO SEJARAH
*/
$queryHero = mysqli_query($conn, "SELECT * FROM sejarah 
                                  WHERE judul LIKE '%Sejarah Tenun Ikat%' 
                                  ORDER BY id_sejarah DESC 
                                  LIMIT 1");
$hero = mysqli_fetch_assoc($queryHero);

$hero_judul = $hero ? $hero['judul'] : 'Sejarah Tenun Ikat Sumba Barat';

$hero_isi = $hero
    ? $hero['isi']
    : 'Tenun ikat Sumba Barat memiliki sejarah panjang yang berkaitan erat dengan kehidupan masyarakat, adat istiadat, dan nilai budaya yang diwariskan secara turun-temurun.';

$hero_gambar = ($hero && !empty($hero['gambar']))
    ? "/uploads/sejarah/" . $hero['gambar']
    : "/assets/img/sejarah/hero-sejarah.jpg";


/*
    01 ASAL USUL
*/
$queryAsalUsul = mysqli_query($conn, "SELECT * FROM sejarah 
                                      WHERE judul LIKE '%Asal Usul%' 
                                      ORDER BY id_sejarah DESC 
                                      LIMIT 1");
$asalUsul = mysqli_fetch_assoc($queryAsalUsul);

$asal_judul = $asalUsul ? $asalUsul['judul'] : 'Asal Usul Tenun Ikat Sumba Barat';

$asal_isi = $asalUsul
    ? $asalUsul['isi']
    : 'Tenun ikat di Sumba Barat telah ada sejak zaman dahulu dan menjadi bagian penting dalam kehidupan masyarakat.';

$asal_gambar = ($asalUsul && !empty($asalUsul['gambar']))
    ? "/uploads/sejarah/" . $asalUsul['gambar']
    : "/assets/img/sejarah/asal-usul.jpg";


/*
    03 WARISAN
*/
$queryWarisan = mysqli_query($conn, "SELECT * FROM sejarah 
                                     WHERE judul LIKE '%Warisan%' 
                                     ORDER BY id_sejarah DESC 
                                     LIMIT 1");
$warisan = mysqli_fetch_assoc($queryWarisan);

$warisan_judul = $warisan ? $warisan['judul'] : 'Warisan yang Terus Dilestarikan';

$warisan_isi = $warisan
    ? $warisan['isi']
    : 'Meskipun perkembangan zaman terus berjalan, masyarakat Sumba Barat tetap menjaga dan melestarikan tradisi menenun sebagai bagian dari identitas budaya.';

$warisan_gambar = ($warisan && !empty($warisan['gambar']))
    ? "/uploads/sejarah/" . $warisan['gambar']
    : "/assets/img/sejarah/warisan.jpg";


/*
    02 PERAN TENUN
*/
$queryPeran = mysqli_query($conn, "SELECT * FROM peran_tenun ORDER BY id_peran ASC");
$totalPeran = mysqli_num_rows($queryPeran);
?>

<!-- HERO SEJARAH -->
<section class="page-hero">
    <div class="container">
        <div class="row align-items-center g-5">

            <div class="col-lg-5">
                <span class="section-badge">SEJARAH</span>

                <h1 class="page-hero-title">
                    <?= htmlspecialchars($hero_judul); ?>
                </h1>

                <p class="page-hero-text">
                    <?= nl2br(htmlspecialchars($hero_isi)); ?>
                </p>
            </div>

            <div class="col-lg-7">
                <div class="page-hero-image-box">
                    <img src="<?= htmlspecialchars($hero_gambar); ?>"
                         alt="<?= htmlspecialchars($hero_judul); ?>"
                         class="page-hero-img">
                </div>
            </div>

        </div>
    </div>
</section>


<!-- 01 ASAL USUL TENUN IKAT SUMBA BARAT -->
<section class="history-section">
    <div class="container">

        <div class="row align-items-center g-5">

            <div class="col-lg-5">
                <img src="<?= htmlspecialchars($asal_gambar); ?>"
                     alt="<?= htmlspecialchars($asal_judul); ?>"
                     class="history-img">
            </div>

            <div class="col-lg-7">
                <div class="history-content">
                    <span class="history-number">01</span>

                    <div>
                        <h2><?= htmlspecialchars($asal_judul); ?></h2>

                        <p>
                            <?= nl2br(htmlspecialchars($asal_isi)); ?>
                        </p>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>


<!-- 02 PERAN TENUN DALAM KEHIDUPAN MASYARAKAT -->
<section class="history-cards-section">
    <div class="container">

        <div class="history-center">
            <span class="history-number center">02</span>

            <h2>Peran Tenun dalam Kehidupan Masyarakat</h2>

            <p>
                Tenun ikat bukan sekadar kain, tetapi memiliki peran penting
                dalam berbagai momen kehidupan dan upacara adat masyarakat
                Sumba Barat.
            </p>
        </div>

        <div class="row g-4 mt-4">

            <?php if ($totalPeran > 0) : ?>
                <?php while ($peran = mysqli_fetch_assoc($queryPeran)) : ?>

                    <?php
                    $gambar_peran = !empty($peran['gambar'])
                        ? "/uploads/peran/" . $peran['gambar']
                        : "/assets/img/sejarah/default-peran.jpg";

                    $modalId = "modalPeran" . $peran['id_peran'];
                    ?>

                    <div class="col-md-4">
                        <div class="history-card">

                            <div class="history-card-image"
                                 data-bs-toggle="modal"
                                 data-bs-target="#<?= $modalId; ?>">
                                <img src="<?= htmlspecialchars($gambar_peran); ?>"
                                     alt="<?= htmlspecialchars($peran['judul']); ?>">
                            </div>

                            <div class="history-card-body">
                                <h4><?= htmlspecialchars($peran['judul']); ?></h4>

                                <p>
                                    <?= nl2br(htmlspecialchars($peran['isi'])); ?>
                                </p>
                            </div>

                        </div>
                    </div>


                    <!-- MODAL FOTO PERAN TENUN -->
                    <div class="modal fade" id="<?= $modalId; ?>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content sejarah-modal-content">

                                <div class="modal-header sejarah-modal-header">
                                    <h5 class="modal-title">
                                        <?= htmlspecialchars($peran['judul']); ?>
                                    </h5>

                                    <button type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>

                                <div class="modal-body sejarah-modal-body">

                                    <div class="sejarah-modal-image">
                                        <img src="<?= htmlspecialchars($gambar_peran); ?>"
                                             alt="<?= htmlspecialchars($peran['judul']); ?>">
                                    </div>

                                    <div class="sejarah-modal-text">
                                        <h3><?= htmlspecialchars($peran['judul']); ?></h3>

                                        <p>
                                            <?= nl2br(htmlspecialchars($peran['isi'])); ?>
                                        </p>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                <?php endwhile; ?>

            <?php else : ?>

                <div class="col-12">
                    <div class="history-center">
                        <p>
                            Data peran tenun belum ditambahkan oleh admin.
                        </p>
                    </div>
                </div>

            <?php endif; ?>

        </div>

    </div>
</section>


<!-- 03 WARISAN YANG TERUS DILESTARIKAN -->
<section class="history-section">
    <div class="container">

        <div class="row align-items-center g-5">

            <div class="col-lg-7">
                <div class="history-content">
                    <span class="history-number">03</span>

                    <div>
                        <h2><?= htmlspecialchars($warisan_judul); ?></h2>

                        <p>
                            <?= nl2br(htmlspecialchars($warisan_isi)); ?>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-5">
                <img src="<?= htmlspecialchars($warisan_gambar); ?>"
                     alt="<?= htmlspecialchars($warisan_judul); ?>"
                     class="history-img">
            </div>

        </div>

    </div>
</section>

<?php include "../includes/footer.php"; ?>