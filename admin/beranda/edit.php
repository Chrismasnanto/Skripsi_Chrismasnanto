<?php
include __DIR__ . "/../auth/session.php";
include __DIR__ . "/../../config/database.php";
include __DIR__ . "/../includes/header.php";
include __DIR__ . "/../includes/sidebar.php";

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$query = mysqli_query($conn, "SELECT * FROM beranda WHERE id_beranda='$id'");
$data = mysqli_fetch_assoc($query);

if (!$data) {
    echo "<script>
            alert('Data beranda tidak ditemukan');
            window.location='index.php';
          </script>";
    exit;
}

if (isset($_POST['update'])) {
    $id_admin = $_SESSION['admin'];

    $judul = mysqli_real_escape_string($conn, $_POST['judul']);
    $deskripsi = mysqli_real_escape_string($conn, $_POST['deskripsi']);

    $gambar = $data['gambar'];

    if (!empty($_FILES['gambar']['name'])) {
        $nama_gambar = $_FILES['gambar']['name'];
        $tmp_gambar = $_FILES['gambar']['tmp_name'];
        $ekstensi = strtolower(pathinfo($nama_gambar, PATHINFO_EXTENSION));

        $nama_baru = time() . "_" . uniqid() . "." . $ekstensi;
        $folder_upload = "../../uploads/beranda/";

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

    $update = mysqli_query($conn, "UPDATE beranda SET
                                    id_admin='$id_admin',
                                    judul='$judul',
                                    deskripsi='$deskripsi',
                                    gambar='$gambar'
                                  WHERE id_beranda='$id'");

    if ($update) {
        echo "<script>
                alert('Data beranda berhasil diperbarui');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data beranda gagal diperbarui');
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

        <h1>Edit Beranda</h1>

        <div class="admin-data-box">

            <div class="admin-data-header">
                <h2>Form Edit Konten Beranda</h2>

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
                    <label>Deskripsi</label>
                    <textarea name="deskripsi"
                              rows="7"
                              required><?= htmlspecialchars($data['deskripsi']); ?></textarea>
                </div>

                <div class="form-admin-group">
                    <label>Gambar Saat Ini</label>

                    <?php if (!empty($data['gambar'])) : ?>
                        <img src="/uploads/beranda/<?= htmlspecialchars($data['gambar']); ?>"
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