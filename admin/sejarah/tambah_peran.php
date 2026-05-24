<?php
include "../auth/session.php";
include "../../config/database.php";
include "../includes/header.php";
include "../includes/sidebar.php";

if (isset($_POST['simpan'])) {
    $id_admin = $_SESSION['admin'];

    $judul = mysqli_real_escape_string($conn, $_POST['judul']);
    $isi = mysqli_real_escape_string($conn, $_POST['isi']);

    $gambar = "";

    if (!empty($_FILES['gambar']['name'])) {
        $nama_gambar = $_FILES['gambar']['name'];
        $tmp_gambar = $_FILES['gambar']['tmp_name'];
        $ekstensi = strtolower(pathinfo($nama_gambar, PATHINFO_EXTENSION));

        $nama_baru = time() . "_" . uniqid() . "." . $ekstensi;
        $folder_upload = "../../uploads/peran/";

        if (!is_dir($folder_upload)) {
            mkdir($folder_upload, 0777, true);
        }

        $allowed = ['jpg', 'jpeg', 'png', 'webp'];

        if (in_array($ekstensi, $allowed)) {
            move_uploaded_file($tmp_gambar, $folder_upload . $nama_baru);
            $gambar = $nama_baru;
        } else {
            echo "<script>
                    alert('Format gambar harus JPG, JPEG, PNG, atau WEBP');
                  </script>";
        }
    }

    $query = mysqli_query($conn, "INSERT INTO peran_tenun (id_admin, judul, isi, gambar) 
                                  VALUES ('$id_admin', '$judul', '$isi', '$gambar')");

    if ($query) {
        echo "<script>
                alert('Data peran tenun berhasil ditambahkan');
                window.location='peran.php';
              </script>";
    } else {
        echo "<script>
                alert('Data peran tenun gagal ditambahkan');
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

        <h1>Tambah Peran Tenun</h1>

        <div class="admin-data-box">

            <div class="admin-data-header">
                <h2>Form Tambah Peran Tenun</h2>

                <a href="peran.php" class="btn-add-admin">
                    <i class="bi bi-arrow-left"></i>
                    Kembali
                </a>
            </div>

            <form action="" method="POST" enctype="multipart/form-data" class="admin-form">

                <div class="form-admin-group">
                    <label>Judul</label>
                    <input type="text" name="judul" placeholder="Contoh: Kelahiran" required>
                </div>

                <div class="form-admin-group">
                    <label>Isi</label>
                    <textarea name="isi" rows="7" placeholder="Masukkan penjelasan peran tenun" required></textarea>
                </div>

                <div class="form-admin-group">
                    <label>Gambar</label>
                    <input type="file" name="gambar" accept="image/*">
                </div>

                <div class="form-admin-action">
                    <button type="submit" name="simpan" class="btn-submit-admin">
                        Simpan
                    </button>

                    <a href="peran.php" class="btn-cancel-admin">
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