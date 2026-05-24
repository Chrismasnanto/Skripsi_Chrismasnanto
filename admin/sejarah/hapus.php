<?php
include "../auth/session.php";
include "../../config/database.php";

$id = $_GET['id'];

$query = mysqli_query($conn, "SELECT * FROM sejarah WHERE id_sejarah='$id'");
$data = mysqli_fetch_assoc($query);

if ($data) {
    $folder_upload = "../../uploads/sejarah/";

    if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
        unlink($folder_upload . $data['gambar']);
    }

    $hapus = mysqli_query($conn, "DELETE FROM sejarah WHERE id_sejarah='$id'");

    if ($hapus) {
        echo "<script>
                alert('Data sejarah berhasil dihapus');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data sejarah gagal dihapus');
                window.location='index.php';
              </script>";
    }
} else {
    echo "<script>
            alert('Data sejarah tidak ditemukan');
            window.location='index.php';
          </script>";
}
?>