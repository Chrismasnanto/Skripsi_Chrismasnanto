<?php
include "../auth/session.php";
include "../../config/database.php";

/** @var mysqli $conn */

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$query = mysqli_query($conn, "SELECT * FROM galeri WHERE id_galeri='$id'");
$data = mysqli_fetch_assoc($query);

if ($data) {
    $folder_upload = "../../uploads/galeri/";

    if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
        unlink($folder_upload . $data['gambar']);
    }

    mysqli_query($conn, "DELETE FROM galeri WHERE id_galeri='$id'");

    echo "<script>
            alert('Data galeri berhasil dihapus');
            window.location='index.php';
          </script>";
} else {
    echo "<script>
            alert('Data galeri tidak ditemukan');
            window.location='index.php';
          </script>";
}
?>