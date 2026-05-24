<?php
require_once __DIR__ . '/../auth/session.php';
require_once __DIR__ . '/../../config/database.php';

if (!isset($conn)) {
    die('Database connection not established.');
}

$id = $_GET['id'];

$query = mysqli_query($conn, "SELECT * FROM beranda WHERE id_beranda='$id'");
$data = mysqli_fetch_assoc($query);

if ($data) {
    $folder_upload = "../../uploads/beranda/";

    if (!empty($data['gambar']) && file_exists($folder_upload . $data['gambar'])) {
        unlink($folder_upload . $data['gambar']);
    }

    $hapus = mysqli_query($conn, "DELETE FROM beranda WHERE id_beranda='$id'");

    if ($hapus) {
        echo "<script>
                alert('Data beranda berhasil dihapus');
                window.location='index.php';
              </script>";
    } else {
        echo "<script>
                alert('Data beranda gagal dihapus');
                window.location='index.php';
              </script>";
    }
} else {
    echo "<script>
            alert('Data beranda tidak ditemukan');
            window.location='index.php';
          </script>";
}
?>