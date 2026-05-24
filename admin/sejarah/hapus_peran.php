<?php
include "../auth/session.php";
include "../../config/database.php";

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$query = mysqli_query($conn, "SELECT * FROM peran_tenun WHERE id_peran='$id'");
$data = mysqli_fetch_assoc($query);

if ($data) {
    $folder_upload = "../../uploads/peran/";

    if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
        unlink($folder_upload . $data['gambar']);
    }

    mysqli_query($conn, "DELETE FROM peran_tenun WHERE id_peran='$id'");
}

echo "<script>
        alert('Data peran tenun berhasil dihapus');
        window.location='peran.php';
      </script>";
?>