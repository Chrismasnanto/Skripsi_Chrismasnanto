<?php
include "../auth/session.php";
include "../../config/database.php";
include "../includes/header.php";
include "../includes/sidebar.php";


/** @var mysqli $conn */

if (isset($_POST['simpan'])) {

    $id_admin = $_SESSION['admin'];

    $kategori = mysqli_real_escape_string($conn, $_POST['kategori']);
    $judul = mysqli_real_escape_string($conn, $_POST['judul']);
    $isi = mysqli_real_escape_string($conn, $_POST['isi']);

    $gambar = "";

    if (!empty($_FILES['gambar']['name'])) {

        $nama = $_FILES['gambar']['name'];
        $tmp = $_FILES['gambar']['tmp_name'];

        $ext = strtolower(pathinfo($nama, PATHINFO_EXTENSION));
        $allowed = ['jpg', 'jpeg', 'png', 'webp'];

        if (in_array($ext, $allowed)) {

            $nama_baru = time() . "_" . uniqid() . "." . $ext;
            $folder = "../../uploads/sejarah/";

            if (!is_dir($folder)) {
                mkdir($folder, 0777, true);
            }

            move_uploaded_file($tmp, $folder . $nama_baru);
            $gambar = $nama_baru;
        }
    }

    $query = mysqli_query($conn, "
        INSERT INTO sejarah
        (
            id_admin,
            kategori,
            judul,
            isi,
            gambar
        )
        VALUES
        (
            '$id_admin',
            '$kategori',
            '$judul',
            '$isi',
            '$gambar'
        )
    ");

    if ($query) {
        echo "<script>
            alert('Data berhasil ditambahkan');
            window.location='index.php';
        </script>";
    } else {
        echo "<script>
            alert('Gagal menambahkan data');
        </script>";
    }
}
?>

<main class="admin-main">

    <?php include "../includes/topbar.php"; ?>

    <section class="admin-content">

        <h1>Tambah Sejarah</h1>

        <div class="admin-data-box">

            <div class="admin-data-header">
                <h2>Form Tambah Konten Sejarah</h2>

                <a href="index.php" class="btn-add-admin">
                    <i class="bi bi-arrow-left"></i>
                    Kembali
                </a>
            </div>

            <form method="POST" enctype="multipart/form-data" class="admin-form">

                <div class="form-admin-group">

                    <label>Kategori</label>

                    <select name="kategori" required>
                        <option value="">Pilih kategori</option>
                        <option value="hero">Hero</option>
                        <option value="asal_usul">Asal Usul</option>
                        <option value="peran">Peran Tenun</option>
                        <option value="warisan">Warisan</option>
                    </select>

                </div>

                <div class="form-admin-group">

                    <label>Judul</label>

                    <input
                        type="text"
                        name="judul"
                        placeholder="Masukkan judul sejarah"
                        required>

                </div>

                <div class="form-admin-group">

                    <label>Isi</label>

                    <textarea
                        name="isi"
                        rows="8"
                        placeholder="Masukkan isi sejarah"
                        required></textarea>

                </div>

                <div class="form-admin-group">

                    <label>Gambar</label>

                    <input
                        type="file"
                        name="gambar"
                        accept="image/*">

                </div>

                <div class="form-admin-action">

                    <button type="submit" name="simpan" class="btn-submit-admin">
                        Simpan
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