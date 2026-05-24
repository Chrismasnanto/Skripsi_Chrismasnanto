<?php
include "../auth/session.php";
include "../../config/database.php";
include "../includes/header.php";
include "../includes/sidebar.php";

$query = mysqli_query($conn, "SELECT * FROM sejarah ORDER BY id_sejarah DESC");
$total_data = mysqli_num_rows($query);
?>

<main class="admin-main">

    <header class="admin-topbar">
        <div></div>

        <div class="topbar-user-simple">
            <div class="user-icon">
                <i class="bi bi-person"></i>
            </div>

            <span>Halo, <?= $_SESSION['nama'] ?? 'Admin'; ?></span>
            <i class="bi bi-chevron-down"></i>
        </div>
    </header>

    <section class="admin-content">

        <h1>Sejarah</h1>

        <div class="admin-data-box">

            <div class="admin-data-header">
                <h2>Daftar Konten Sejarah</h2>

                <div style="display: flex; gap: 10px; flex-wrap: wrap;">
                    <a href="peran.php" class="btn-add-admin">
                        <i class="bi bi-grid-3x3-gap"></i>
                        Peran Tenun
                    </a>

                    <a href="tambah.php" class="btn-add-admin">
                        <i class="bi bi-plus-lg"></i>
                        Tambah Konten
                    </a>
                </div>
            </div>

            <div class="table-responsive">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Gambar</th>
                            <th>Judul</th>
                            <th>Deskripsi Singkat</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php if ($total_data > 0) : ?>
                            <?php while ($row = mysqli_fetch_assoc($query)) : ?>

                                <tr>
                                    <td>
                                        <?php if (!empty($row['gambar'])) : ?>
                                            <img src="/uploads/sejarah/<?= htmlspecialchars($row['gambar']); ?>"
                                                 alt="<?= htmlspecialchars($row['judul']); ?>"
                                                 class="admin-thumb">
                                        <?php else : ?>
                                            <div class="table-image-placeholder">
                                                <i class="bi bi-image"></i>
                                            </div>
                                        <?php endif; ?>
                                    </td>

                                    <td>
                                        <?= htmlspecialchars($row['judul']); ?>
                                    </td>

                                    <td>
                                        <?= htmlspecialchars(substr(strip_tags($row['isi']), 0, 120)); ?>...
                                    </td>

                                    <td>
                                        <div class="action-buttons">
                                            <a href="edit.php?id=<?= $row['id_sejarah']; ?>" class="btn-action">
                                                <i class="bi bi-pencil"></i>
                                            </a>

                                            <a href="hapus.php?id=<?= $row['id_sejarah']; ?>"
                                               class="btn-action"
                                               onclick="return confirm('Yakin ingin menghapus data ini?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                            <?php endwhile; ?>

                        <?php else : ?>

                            <tr>
                                <td colspan="4" class="text-center">
                                    Data sejarah belum tersedia.
                                </td>
                            </tr>

                        <?php endif; ?>
                    </tbody>
                </table>
            </div>

            <p class="data-count">
                Menampilkan <?= $total_data; ?> data
            </p>

        </div>

    </section>

    <div class="admin-bottom">
        © 2026 Tenun Ikat Sumba Barat. All Rights Reserved.
    </div>

</main>

<?php include "../includes/footer.php"; ?>