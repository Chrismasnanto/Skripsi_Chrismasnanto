<?php
include "../auth/session.php";
include "../../config/database.php";
include "../includes/header.php";
include "../includes/sidebar.php";

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$query = mysqli_query($conn, "SELECT * FROM about WHERE id_about='$id'");
$data = mysqli_fetch_assoc($query);

if (!$data) {
    echo "<script>
            alert('Data about tidak ditemukan');
            window.location='index.php';
          </script>";
    exit;
}

if (isset($_POST['update'])) {
    $id_admin = $_SESSION['admin'];

    $judul = mysqli_real_escape_string($conn, $_POST['judul']);
    $isi = mysqli_real_escape_string($conn, $_POST['isi']);

    $cek = mysqli_query($conn, "SELECT * FROM about 
                                WHERE judul='$judul' 
                                AND id_about != '$id' 
                                LIMIT 1");

    if (mysqli_num_rows($cek) > 0) {
        echo "<script>
                alert('Judul about sudah digunakan pada data lain.');
                window.location='index.php';
              </script>";
        exit;
    }

    $update = mysqli_query($conn, "UPDATE about SET
                                    id_admin='$id_admin',
                                    judul='$judul',
                                    isi='$isi'
                                  WHERE id_about='$id'");

    if ($update) {
        echo "<script>
                alert('Data about berhasil diperbarui');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data about gagal diperbarui');
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

        <h1>Edit About</h1>

        <div class="admin-data-box">

            <div class="admin-data-header">
                <h2>Form Edit Konten About</h2>

                <a href="index.php" class="btn-add-admin">
                    <i class="bi bi-arrow-left"></i>
                    Kembali
                </a>
            </div>

            <form action="" method="POST" class="admin-form">

                <div class="form-admin-group">
                    <label>Judul</label>

                    <select name="judul" required>
                        <option value="Tujuan Website" <?= $data['judul'] == 'Tujuan Website' ? 'selected' : ''; ?>>
                            Tujuan Website
                        </option>

                        <option value="Harapan Website" <?= $data['judul'] == 'Harapan Website' ? 'selected' : ''; ?>>
                            Harapan Website
                        </option>
                    </select>
                </div>

                <div class="form-admin-group">
                    <label>Isi</label>
                    <textarea name="isi"
                              rows="8"
                              required><?= htmlspecialchars($data['isi']); ?></textarea>
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