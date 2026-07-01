-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2026 at 02:01 AM
-- Server version: 10.6.24-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tenun_ikat_sumba_barat`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id_about` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id_about`, `id_admin`, `judul`, `isi`, `created_at`) VALUES
(2, 1, 'Tujuan Website', 'Website ini merupakan media informasi budaya yang menyajikan informasi mengenai sejarah, motif dan makna, proses pembuatan, serta galeri Tenun Ikat Sumba Barat.\r\n\r\nInformasi yang disediakan bertujuan untuk membantu masyarakat mengenal, memahami, dan menghargai warisan budaya Tenun Ikat Sumba Barat.', '2026-05-23 01:16:41'),
(3, 1, 'Harapan Website', 'Website ini diharapkan dapat menjadi sarana yang bermanfaat bagi masyarakat untuk mengenal lebih dalam Tenun Ikat Sumba Barat serta mendorong upaya pelestarian agar warisan budaya ini tetap lestari dan dikenal oleh generasi mendatang.', '2026-05-23 01:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`) VALUES
(1, 'dimss', 'admin', 'admin123'),
(2, 'Cledwin', 'Cledwin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `beranda`
--

CREATE TABLE `beranda` (
  `id_beranda` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `beranda`
--

INSERT INTO `beranda` (`id_beranda`, `id_admin`, `judul`, `deskripsi`, `gambar`, `created_at`) VALUES
(2, 1, 'TENUN IKAT SUMBA BARAT', 'Warisan budaya leluhur yang sarat makna, keindahan, dan identitas masyarakat Sumba Barat', '1779506426_6a111cfa1d735.png', '2026-05-21 15:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id_galeri`, `id_admin`, `judul`, `gambar`, `keterangan`, `created_at`) VALUES
(1, 1, 'Kain Tenun Ikat Sumba Barat', '1779571418_6a121ada7892e.png', 'Dokumentasi kain tenun ikat khas Sumba Barat.', '2026-05-20 21:50:07'),
(2, 1, 'Proses Menenun Tradisional', '1779562719_6a11f8df49b07.png', 'Perajin sedang membuat kain tenun menggunakan alat tradisional.', '2026-05-20 21:50:07'),
(3, 1, 'Ragam Motif Tenun', '1779571735_6a121c1793513.png', 'Koleksi motif Tenun Ikat Sumba Barat yang memiliki makna budaya dan nilai filosofis.', '2026-05-20 21:50:07'),
(5, 1, 'Pakaian Adat', '1779583750_6a124b063ede3.png', 'Penggunaan kain tenun ikat dalam pakaian adat masyarakat Sumba Barat.', '2026-05-23 19:37:39'),
(6, 1, 'Pewarnaan Benang', '1779583779_6a124b23d58dd.png', 'Proses pewarnaan benang sebagai salah satu tahapan penting dalam pembuatan Tenun Ikat Sumba Barat.', '2026-05-23 19:38:48'),
(7, 1, 'Pengeringan Benang', '1779583844_6a124b64684bc.png', 'Benang yang telah melalui proses pewarnaan kemudian dikeringkan sebelum digunakan dalam proses penenunan.', '2026-05-23 19:39:15'),
(8, 1, 'Hasil Tenun Ikat', '1779583807_6a124b3fbc660.png', 'Dokumentasi kain Tenun Ikat Sumba Barat yang telah selesai dibuat dengan motif dan warna khas.', '2026-05-23 19:39:37'),
(10, 1, 'Kain Lambaleko ', '1779571375_6a121aafb70e4.png', 'Lambaleko adalah salah satu jenis tenun sulam/ikat yang populer di Sumba Barat, khususnya di daerah Loli.', '2026-05-23 21:22:55'),
(11, 1, 'Karaja Lamboya ', '1779571578_6a121b7a8f7cd.png', 'Melambangkan \"Local Wisdom\" atau kearifan lokal yang dirawat oleh tangan-tangan terampil para ibu penenun.', '2026-05-23 21:26:18'),
(12, 1, 'Proses Penumbukan Bahan Pewarnaan', '1779596979_6a127eb35ce5b.png', 'Pewarna tekstil tradisional Sumba berasal dari pengetahuan botani lokal: merah dari akar mengkudu, biru dari tarum, hitam dari kemiri terbakar, dan warna gelap diperkuat melalui perendaman lumpur.', '2026-05-24 04:29:39'),
(13, 1, 'Proses Pembentukan Motif Kain', '1779597037_6a127eed7e562.png', 'Motif dibuat dengan teknik ikat pada benang lusi melalui pengikatan dan pewarnaan berulang. Motifnya kaya makna, seperti kuda, kerbau, buaya, dan leluhur. Kain hinggi dipakai laki-laki, lau dipakai perempuan, dan digunakan dalam berbagai upacara adat.', '2026-05-24 04:30:37'),
(14, 1, 'Proses Pengerjaan di Bagian Ujung Kain', '1779597588_6a128114877b0.png', 'Proses pengerjaan ujung kain adalah tahap merapikan bagian akhir tenunan. Penenun mengatur dan merapatkan benang agar ujung kain kuat, rapi, serta pola tetap lurus sebelum masuk tahap penyelesaian.', '2026-05-24 04:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `motif_makna`
--

CREATE TABLE `motif_makna` (
  `id_motif` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nama_motif` varchar(255) NOT NULL,
  `asal_daerah` varchar(255) NOT NULL,
  `makna` text NOT NULL,
  `ciri_motif` text DEFAULT NULL,
  `warna_dominan` varchar(100) DEFAULT NULL,
  `filosofi_visual` text DEFAULT NULL,
  `penggunaan` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `motif_makna`
--

INSERT INTO `motif_makna` (`id_motif`, `id_admin`, `nama_motif`, `asal_daerah`, `makna`, `ciri_motif`, `warna_dominan`, `filosofi_visual`, `penggunaan`, `gambar`, `created_at`) VALUES
(2, 2, 'Motif Mamuli', 'Loli', 'Melambangkan kesuburan, kehidupan, dan penghormatan terhadap perempuan.', 'Bentuk menyerupai lambang omega atau rahim perempuan\r\nPada bagian bawah sering dihiasi sepasang figur hewan seperti ayam atau lambang prajurit\r\nMemiliki detail ukiran tenun halus di bagian tengah ornamentasi utama', 'Biru, Kuning, Putih', 'Bentuk dasarnya merepresentasikan organ reproduksi wanita yang sakral, melambangkan asal-mula kemampuan memberi kehidupan baru, kemakmuran, serta perlindungan garis keturunan keluarga.', 'Upacara Perkawinan Adat (sebagai bagian dari mahar/belis), Ritual Adat Keagamaan, Busana Kehormatan Bangsawan', '1779376539_WhatsApp Image 2026-01-02 at 19.12.15.jpeg', '2026-05-20 21:50:07'),
(4, 2, 'Motif Garis Lurus Panggiling Wanokaka', 'Wanokaka', 'Motif garis lurus pada bagian pinggir kain yang melambangkan ketulusan hati masyarakat Wanokaka dalam kehidupan sehari-hari. ', 'Pola ornamen berbentuk bunga khas yang tersusun di sepanjang pinggiran kain\r\nMenggunakan teknik pewarnaan dan penenunan yang halus dan mendetail\r\nMemanfaatkan perpaduan bahan dasar benang pabrikan berkualitas (seperti benang Yamalon) untuk menghasilkan tekstur kain yang khas', 'Cream, Kuning, Merah', 'Struktur motif bunga Lambaleko mencerminkan harmonisasi kehidupan masyarakat Sumba Barat dengan alam semesta, di mana keindahan visual berpadu dengan ketekunan, ketepatan, serta kedisiplinan dalam proses penciptaan karya seni tenun.', 'Busana Adat Sehari-hari, Acara Pertemuan Keluarga, Upacara Adat Lokal, Kerajinan Tangan Khas Sumba', '1779569982_6a12153ef2844.png', '2026-05-23 15:43:57'),
(5, 2, 'Motif Bunga Lambaleko Lamboya ', 'Lamboya', 'Motif bunga pada bagian pinggir kain. Motif tersebut merupakan hasil kreativitas penenun dalam mengembangkan jenis kain Lambaleko menggunakan bahan dasar benang pabrikan (benang Yamalon)', 'Pola ornamen berbentuk bunga khas yang tersusun di sepanjang pinggiran kain\r\nMenggunakan teknik pewarnaan dan penenunan yang halus dan mendetail\r\nMemanfaatkan perpaduan bahan dasar benang pabrikan berkualitas (seperti benang Yamalon) untuk menghasilkan tekstur kain yang khas', 'Hitam, Putih, Merah', 'Struktur motif bunga Lambaleko mencerminkan harmonisasi kehidupan masyarakat Sumba Barat dengan alam semesta, di mana keindahan visual berpadu dengan ketekunan, ketepatan, serta kedisiplinan dalam proses penciptaan karya seni tenun.', 'Busana Adat Sehari-hari, Acara Pertemuan Keluarga, Upacara Adat Lokal, Kerajinan Tangan Khas Sumba', '1779568745_6a121069891ea.png', '2026-05-23 15:43:57'),
(6, 2, 'Motif Garis Panggiling Lamboya', 'Lamboya', 'Motif garis tersebut melambangkan garis keturunan bangsawan. Kain Panggiling dibuat dari kapas asli dan digunakan pada acara adat tertentu seperti perkawinan, pesta adat, dan acara kematian.', 'Garis vertikal yang memanjang\r\nSusunan simetris dan beraturan\r\nMotif geometris sederhana namun tegas\r\nMelambangkan keteraturan dan keseimbangan hidup', 'Merah, Cream, Hitam, Putih', 'Garis lurus melambangkan perjalanan hidup manusia yang harus dijalani dengan ketulusan, keberanian, dan keseimbangan.', 'Upacara Adat, Pernikahan, Penyambutan Tamu, Acara Budaya', '1779570090_6a1215aabfc4d.png', '2026-05-23 15:43:57'),
(7, 2, 'Motif Bungu kain Ikat Loli', 'Loli', 'Motif bunga yang merupakan hasil pengembangan kreativitas penenun. Motif bunga yang melambangkan ikatan persaudaraan, ', 'Pola bunga geometris yang berulang secara horizontal dan vertikal di sepanjang badan kain\r\nFormasi barisan motif yang simetris dan berjejer rapi\r\nMemiliki aksen garis-garis putih tipis sebagai pembatas antar kelompok motif', 'Merah, Putih', 'Pengulangan motif bunga yang saling terhubung satu sama lain melambangkan bahwa setiap individu dalam masyarakat adat Loli tidak dapat berdiri sendiri, melainkan saling menopang dan menguatkan dalam ikatan kekeluargaan yang kokoh.', 'Pakaian Adat kaum Perempuan, Upacara Pertemuan Suku, Upacara Menyambut Tamu, serta Busana Resmi dalam Acara Kebudayaan Sumba Barat', '1779570198_6a12161685d2a.png', '2026-05-23 15:43:57'),
(8, 2, 'Motif Timbul Mamuli Lambaleko Loli', 'Loli', 'Motif mamuli melambangkan rahim wanita sebagai simbol kejayaan perempuan. Dalam satu jenis kain terdapat motif yang disusun secara berulang sebagai ciri khas kain Lambaleko Loli.', 'Memiliki struktur motif \"timbul\" yang terasa menonjol pada tekstur kain\r\nMenggabungkan lambang Mamuli (bentuk omega) di bagian badan kain dengan kombinasi hiasan bunga Lambaleko di bagian pinggirnya\r\nPola pembungaan dan mamuli ditenun secara berulang dan rapat dengan formasi yang simetris', 'Hijau, Merah, Hitam', 'Perpaduan motif Mamuli yang timbul dengan hiasan Lambaleko mencerminkan keteguhan, kesuburan, dan keanggunan perempuan Loli. Tekstur timbulnya menegaskan karakter yang kuat dan bernilai tinggi dalam tatanan adat.', 'Digunakan sebagai sarung adat perempuan (Kain Hinji) dalam upacara pernikahan besar, ritual adat suku, serta sebagai simbol penghargaan/belis tingkat tinggi dalam tradisi Sumba Barat.', '1779555527_6a11dcc7ed07a.png', '2026-05-23 15:43:57'),
(12, 2, 'Motif Pasola', 'Wanokaka', 'Motif Pasola menggambarkan tradisi adat tahunan masyarakat Sumba Barat yang dilaksanakan setiap bulan Maret.', 'Memiliki lajur vertikal berwarna biru cerah bermotif abstrak ksatria atau kuda yang khas\r\nPola figuratif geometris yang melambangkan para pemain Pasola yang tangkas\r\nDibatasi oleh garis pembatas vertikal merah dan putih yang tegas di sisi-sisinya', 'Biru, Merah, Putih, Hitam', 'Warna biru melambangkan kedalaman spiritualitas dan langit yang menaungi bumi, sementara pola ksatria menggambarkan keseimbangan antara sportivitas, keberanian, kesatriaan, dan pengorbanan suci dalam menjaga keharmonisan alam sesuai kepercayaan Marapu.', 'Kain Kehormatan Upacara Nyale dan Pasola, Pakaian Adat Ksatria/Pria Sumba, Pajangan Dinding Sakral, serta Busana Resmi Festival Kebudayaan Sumba Barat', '1779570028_6a12156c652d6.png', '2026-05-23 19:50:20'),
(13, 2, 'Motif Kuda', 'Loli', 'Melambangkan kepemimpinan, kejantanan, dan status sosial yang tinggi di masyarakat Sumba.', 'Menampilkan ornamen figuratif berbentuk hewan kuda yang tegas dan anggun pada lajur kain utama\r\nPola kuda ditenun menggunakan warna kuning keemasan kontras di atas dasar kain tenun bermotif garis halus\r\nMemiliki variasi pembatas lajur vertikal berwarna biru tua serta tepian rumbai berwarna merah tua di bagian bawah kain', 'Biru, Kuning, Merah', 'Visualisasi motif kuda mencerminkan harga diri, kebebasan, serta peran vital kuda dalam budaya Marapu, baik sebagai alat transportasi spiritual, mas kawin (belis), maupun lambang kegagahan seorang pria Sumba.', 'Kain Kebesaran Kepala Suku/Bangsawan, Pakaian Adat Pria dalam Upacara Adat dan Pernikahan, Mahar Pernikahan (Belis) Tingkat Tinggi, serta sebagai Sarung Sakral dalam Ritual Kematian Adat Sumba', '1779572907_6a1220ab601bc.png', '2026-05-23 21:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `proses_pembuatan`
--

CREATE TABLE `proses_pembuatan` (
  `id_proses` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `proses_pembuatan`
--

INSERT INTO `proses_pembuatan` (`id_proses`, `id_admin`, `judul`, `isi`, `gambar`, `created_at`) VALUES
(1, 1, 'Proses Penumbukan Bahan Pewarnaan', 'Pewarna tekstil tradisional Sumba menunjukkan kompleksitas pengetahuan botani masyarakat lokal. Warna merah diperoleh dari kombu (akar mengkudu),  biru dari fermentasi tarum (Indigofera), hitam dari campuran kemiri terbakar, dan variasi coklat maupun hitam pekat diperkuat dengan proses â€œmudding,â€ yakni perendaman dalam lumpur tertentu.   ', '1779595170_6a1277a2078a8.png', '2026-05-20 21:50:07'),
(2, 1, 'Proses Pencelupan Benang dalam Wadah Pewarnaan', 'Pewarnaan dilakukan menggunakan periuk tanah, tempayan, dan wadah kayu yang membantu mempertahankan stabilitas suhu dan konsentrasi larutan warna. Teknik pewarnaan ini bukan sekadar proses kimia, tetapi juga ritus sosialâ€”dalam beberapa komunitas, benang yang akan diwarnai memerlukan restu dari tetua adat sebagai bagian dari etika kosmologis.', '1779595398_6a127886238af.png', '2026-05-20 21:50:07'),
(3, 1, 'Proses Pamane atau Pembentangan Benang', 'Tahap ketika benang-benang disusun dan direntangkan pada alat tenun sebelum proses menenun dimulai. Pada tahap ini, benang putih dan benang berwarna diatur sejajar agar rapi, kuat, dan sesuai dengan pola kain yang akan dibuat. Proses ini penting karena menentukan kerapian susunan benang serta hasil akhir kain tenun', '1779596096_6a127b4005f64.png', '2026-05-20 21:50:07'),
(4, 1, 'Proses Pembentukan Motif Kain', 'Motifnya dibuat dengan teknik ikat pada benang lusi sebelum ditenun melalui proses pengikatan dan pewarnaan berulang, menghasilkan motif yang kaya simbolik seperti\r\nkuda, kerbau, buaya, dan figur leluhur. Kain laki-laki (hinggi) biasanya terdiri dari dua panel yang disambung, sementara kain perempuan (lau) berbentuk tabung. Ikat memiliki intensi ritus yang kuat, digunakan dalam upacara kelahiran, perkawinan, kematian, dan pertukaran antar-kerabat.', '1779596587_6a127d2b51c71.png', '2026-05-20 21:50:07'),
(6, 1, 'Proses Pengerjaan kain', 'Tahap merapikan dan menyelesaikan bagian akhir kain pada alat tenun. Pada proses ini, penenun mengatur susunan benang, merapatkan bagian ujung, serta memastikan garis dan pola kain tetap lurus. Tahap ini penting agar ujung kain terlihat rapi, kuat, dan siap dilanjutkan ke proses penyelesaian.', '1779597197_6a127f8d99575.png', '2026-05-24 00:19:39'),
(7, 1, 'Finishing', 'Kain tenun dirapikan, dicuci, dan dijemur untuk menghasilkan Tenun Ikat yang siap digunakan.', '1779596711_6a127da7918bf.png', '2026-05-24 04:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `sejarah`
--

CREATE TABLE `sejarah` (
  `id_sejarah` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `kategori` varchar(50) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sejarah`
--

INSERT INTO `sejarah` (`id_sejarah`, `id_admin`, `kategori`, `judul`, `isi`, `gambar`, `created_at`) VALUES
(1, 1, 'asal_usul', 'Asal Usul Tenun Ikat Sumba Barat', 'Tenun Ikat Sumba Barat merupakan warisan budaya yang diwariskan secara turun-temurun. Kain tenun tidak hanya digunakan sebagai pakaian, tetapi juga sebagai simbol status sosial, identitas budaya, dan bagian penting dalam upacara adat.', '1779598095_6a12830faeb4a.png', '2026-05-20 21:50:07'),
(2, 1, 'hero', 'Sejarah Tenun Ikat Sumba Barat', 'Tenun Ikat Sumba Barat  memiliki sejarah yang panjang yang berkaitan erat dengan kehidupan masyarakat, adat istiadat, dan nilai budaya yang diwariskan secara turun-temurun', '1779594188_6a1273cc6535f.png', '2026-05-20 21:50:07'),
(3, 1, 'warisan', 'Warisan yang Terus Dilestarikan', 'Meskipun perkembangan zaman terus berjalan, masyarakat Sumba Barat tetap menjaga dan melestarikan tradisi menenun sebagai bagian dari identitas budaya.\r\n\r\nHingga kini, tenun ikat Sumba Barat terus hidup dan dikenalkan kepada generasi muda agar tidak hilang oleh waktu.', '1779597840_6a128210a0460.png', '2026-05-23 04:45:44'),
(8, 1, 'peran', 'Kelahiran', 'Digunakan dalam ritual kelahiran sebagai simbol doa dan harapan bagi bayi yang lahir.\r\n', '1779852263_6a1663e7506ab.png', '2026-05-27 03:24:23'),
(9, 1, 'peran', 'Pernikahan', 'Menjadi bagian penting dalam upacara pernikahan sebagai simbol ikatan dan kebersamaan.\r\n', '1779852292_6a166404edb67.png', '2026-05-27 03:24:52'),
(20, 2, 'peran', 'Upacara Adat', 'Digunakan dalam berbagai upacara adat sebagai bentuk penghormatan kepada leluhur dan tradisi.', '1779866088_6a1699e89093c.png', '2026-05-27 07:14:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id_about`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `beranda`
--
ALTER TABLE `beranda`
  ADD PRIMARY KEY (`id_beranda`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `motif_makna`
--
ALTER TABLE `motif_makna`
  ADD PRIMARY KEY (`id_motif`),
  ADD UNIQUE KEY `unique_motif_daerah` (`nama_motif`,`asal_daerah`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `proses_pembuatan`
--
ALTER TABLE `proses_pembuatan`
  ADD PRIMARY KEY (`id_proses`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `sejarah`
--
ALTER TABLE `sejarah`
  ADD PRIMARY KEY (`id_sejarah`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id_about` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `beranda`
--
ALTER TABLE `beranda`
  MODIFY `id_beranda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `motif_makna`
--
ALTER TABLE `motif_makna`
  MODIFY `id_motif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `proses_pembuatan`
--
ALTER TABLE `proses_pembuatan`
  MODIFY `id_proses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sejarah`
--
ALTER TABLE `sejarah`
  MODIFY `id_sejarah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about`
--
ALTER TABLE `about`
  ADD CONSTRAINT `about_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;

--
-- Constraints for table `beranda`
--
ALTER TABLE `beranda`
  ADD CONSTRAINT `beranda_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;

--
-- Constraints for table `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;

--
-- Constraints for table `motif_makna`
--
ALTER TABLE `motif_makna`
  ADD CONSTRAINT `motif_makna_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;

--
-- Constraints for table `proses_pembuatan`
--
ALTER TABLE `proses_pembuatan`
  ADD CONSTRAINT `proses_pembuatan_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;

--
-- Constraints for table `sejarah`
--
ALTER TABLE `sejarah`
  ADD CONSTRAINT `sejarah_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
