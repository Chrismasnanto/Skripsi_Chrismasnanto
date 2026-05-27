<?php
include "../auth/session.php";
include "../../config/database.php";

/** @var mysqli $conn */

$id = $_GET['id'];

$query = mysqli_query($conn, "SELECT * FROM proses_pembuatan WHERE id_proses='$id'");
$data = mysqli_fetch_assoc($query);

if ($data) {
    $folder_upload = "../../uploads/proses/";

    if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
        unlink($folder_upload . $data['gambar']);
    }

    $hapus = mysqli_query($conn, "DELETE FROM proses_pembuatan WHERE id_proses='$id'");

    if ($hapus) {
        echo "<script>
                alert('Data proses pembuatan berhasil dihapus');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data proses pembuatan gagal dihapus');
                window.location='index.php';
              </script>";
    }
} else {
    echo "<script>
            alert('Data proses pembuatan tidak ditemukan');
            window.location='index.php';
          </script>";
}
?>