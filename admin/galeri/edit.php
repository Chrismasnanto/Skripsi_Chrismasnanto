<?php
include "../auth/session.php";
include "../../config/database.php";
include "../includes/header.php";
include "../includes/sidebar.php";


/** @var mysqli $conn */

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$query = mysqli_query($conn, "SELECT * FROM galeri WHERE id_galeri='$id'");
$data = mysqli_fetch_assoc($query);

if (!$data) {
    echo "<script>
            alert('Data galeri tidak ditemukan');
            window.location='index.php';
          </script>";
    exit;
}

if (isset($_POST['update'])) {
    $id_admin = $_SESSION['admin'];

    $judul = mysqli_real_escape_string($conn, $_POST['judul']);
    $keterangan = mysqli_real_escape_string($conn, $_POST['keterangan']);

    $gambar = $data['gambar'];

    if (!empty($_FILES['gambar']['name'])) {
        $nama_gambar = $_FILES['gambar']['name'];
        $tmp_gambar = $_FILES['gambar']['tmp_name'];
        $ekstensi = strtolower(pathinfo($nama_gambar, PATHINFO_EXTENSION));

        $nama_baru = time() . "_" . uniqid() . "." . $ekstensi;
        $folder_upload = "../../uploads/galeri/";

        if (!is_dir($folder_upload)) {
            mkdir($folder_upload, 0777, true);
        }

        $allowed = ['jpg', 'jpeg', 'png', 'webp'];

        if (in_array($ekstensi, $allowed)) {
            if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
                unlink($folder_upload . $data['gambar']);
            }

            move_uploaded_file($tmp_gambar, $folder_upload . $nama_baru);
            $gambar = $nama_baru;
        } else {
            echo "<script>
                    alert('Format gambar harus JPG, JPEG, PNG, atau WEBP');
                  </script>";
        }
    }

    $update = mysqli_query($conn, "UPDATE galeri SET
                                    id_admin='$id_admin',
                                    judul='$judul',
                                    gambar='$gambar',
                                    keterangan='$keterangan'
                                  WHERE id_galeri='$id'");

    if ($update) {
        echo "<script>
                alert('Data galeri berhasil diperbarui');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data galeri gagal diperbarui');
              </script>";
    }
}
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

        <h1>Edit Galeri</h1>

        <div class="admin-data-box">

            <div class="admin-data-header">
                <h2>Form Edit Konten Galeri</h2>

                <a href="index.php" class="btn-add-admin">
                    <i class="bi bi-arrow-left"></i>
                    Kembali
                </a>
            </div>

            <form action="" method="POST" enctype="multipart/form-data" class="admin-form">

                <div class="form-admin-group">
                    <label>Judul</label>
                    <input type="text"
                           name="judul"
                           value="<?= htmlspecialchars($data['judul']); ?>"
                           required>
                </div>

                <div class="form-admin-group">
                    <label>Keterangan</label>
                    <textarea name="keterangan"
                              rows="8"
                              required><?= htmlspecialchars($data['keterangan']); ?></textarea>
                </div>

                <div class="form-admin-group">
                    <label>Gambar Saat Ini</label>

                    <?php if (!empty($data['gambar'])) : ?>
                        <img src="/uploads/galeri/<?= htmlspecialchars($data['gambar']); ?>"
                             alt="<?= htmlspecialchars($data['judul']); ?>"
                             class="admin-preview-img">
                    <?php else : ?>
                        <p>Belum ada gambar.</p>
                    <?php endif; ?>
                </div>

                <div class="form-admin-group">
                    <label>Ganti Gambar</label>
                    <input type="file" name="gambar" accept="image/*">
                </div>

                <div class="form-admin-action">
                    <button type="submit" name="update" class="btn-submit-admin">
                        Update
                    </button>

                    <a href="index.php" class="btn-cancel-admin">
                        Batal
                    </a>
                </div>

            </form>

        </div>

    </section>

    <div class="admin-bottom">
        © 2026 Tenun Ikat Sumba Barat. All Rights Reserved.
    </div>

</main>

<?php include "../includes/footer.php"; ?>