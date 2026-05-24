<?php
include "../auth/session.php";
include "../../config/database.php";

$id = $_GET['id'];

$query = mysqli_query($conn, "SELECT * FROM motif_makna WHERE id_motif='$id'");
$data = mysqli_fetch_assoc($query);

if ($data) {
    $folder_upload = "../../uploads/motif/";

    if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
        unlink($folder_upload . $data['gambar']);
    }

    $hapus = mysqli_query($conn, "DELETE FROM motif_makna WHERE id_motif='$id'");

    if ($hapus) {
        echo "<script>
                alert('Data motif dan makna berhasil dihapus');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data motif dan makna gagal dihapus');
                window.location='index.php';
              </script>";
    }
} else {
    echo "<script>
            alert('Data motif dan makna tidak ditemukan');
            window.location='index.php';
          </script>";
}
?>