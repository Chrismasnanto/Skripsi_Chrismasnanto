 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

 

CREATE TABLE `about` (
  `id_about` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 

INSERT INTO `about` (`id_about`, `id_admin`, `judul`, `isi`, `created_at`) VALUES
(2, 1, 'Tujuan Website', 'Website ini merupakan media informasi budaya yang menyajikan informasi mengenai sejarah, motif dan makna, proses pembuatan, serta galeri Tenun Ikat Sumba Barat.\r\n\r\nInformasi yang disediakan bertujuan untuk membantu masyarakat mengenal, memahami, dan menghargai warisan budaya Tenun Ikat Sumba Barat.', '2026-05-23 01:16:41'),
(3, 1, 'Harapan Website', 'Website ini diharapkan dapat menjadi sarana yang bermanfaat bagi masyarakat untuk mengenal lebih dalam Tenun Ikat Sumba Barat serta mendorong upaya pelestarian agar warisan budaya ini tetap lestari dan dikenal oleh generasi mendatang.', '2026-05-23 01:16:41');

-- --------------------------------------------------------

 

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`) VALUES
(1, 'dimas', 'dimss', 'admin123');

 

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
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `motif_makna`
--

INSERT INTO `motif_makna` (`id_motif`, `id_admin`, `nama_motif`, `asal_daerah`, `makna`, `gambar`, `created_at`) VALUES
(2, 1, 'Motif Mamuli', 'Loli', 'Melambangkan kesuburan, kehidupan, dan penghormatan terhadap perempuan.', '1779376539_WhatsApp Image 2026-01-02 at 19.12.15.jpeg', '2026-05-20 21:50:07'),
(4, 1, 'Motif Garis Lurus Panggiling Wanokaka', 'Wanokaka', 'Motif garis lurus pada bagian pinggir kain yang melambangkan ketulusan hati masyarakat Wanokaka dalam kehidupan sehari-hari. ', '1779569982_6a12153ef2844.png', '2026-05-23 15:43:57'),
(5, 1, 'Motif Bunga Lambaleko Lamboya ', 'Lamboya', 'Motif bunga pada bagian pinggir kain. Motif tersebut merupakan hasil kreativitas penenun dalam mengembangkan jenis kain Lambaleko menggunakan bahan dasar benang pabrikan (benang Yamalon)', '1779568745_6a121069891ea.png', '2026-05-23 15:43:57'),
(6, 1, 'Panggiling Lamboya', 'Lamboya', 'Motif garis tersebut melambangkan garis keturunan bangsawan. Kain Panggiling dibuat dari kapas asli dan digunakan pada acara adat tertentu seperti perkawinan, pesta adat, dan acara kematian.', '1779570090_6a1215aabfc4d.png', '2026-05-23 15:43:57'),
(7, 1, 'Motif Bungu kain Ikat Loli', 'Loli', 'Motif bunga yang merupakan hasil pengembangan kreativitas penenun. Motif bunga yang melambangkan ikatan persaudaraan, ', '1779570198_6a12161685d2a.png', '2026-05-23 15:43:57'),
(8, 1, 'Motif Timbul Mamuli Lambaleko Loli', 'Loli', 'Motif mamuli melambangkan rahim wanita sebagai simbol kejayaan perempuan. Dalam satu jenis kain terdapat motif yang disusun secara berulang sebagai ciri khas kain Lambaleko Loli.', '1779555527_6a11dcc7ed07a.png', '2026-05-23 15:43:57'),
(12, 1, 'Motif Pasola', 'Wanokaka', 'Motif Pasola menggambarkan tradisi adat tahunan masyarakat Sumba Barat yang dilaksanakan setiap bulan Maret.', '1779570028_6a12156c652d6.png', '2026-05-23 19:50:20'),
(13, 1, 'Motif Kuda', 'Loli', 'Melambangkan kepemimpinan, kejantanan, dan status sosial yang tinggi di masyarakat Sumba.', '1779572907_6a1220ab601bc.png', '2026-05-23 21:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `peran_tenun`
--

CREATE TABLE `peran_tenun` (
  `id_peran` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `peran_tenun`
--

INSERT INTO `peran_tenun` (`id_peran`, `id_admin`, `judul`, `isi`, `gambar`, `created_at`) VALUES
(1, 1, 'Kelahiran', 'Digunakan dalam ritual kelahiran sebagai simbol doa dan harapan bagi bayi yang lahir.', '1779587753_6a125aa9d18f9.png', '2026-05-23 04:10:14'),
(2, 1, 'Pernikahan', 'Menjadi bagian penting dalam upacara pernikahan sebagai simbol ikatan dan kebersamaan.', '1779587070_6a1257fe2b2ac.png', '2026-05-23 04:10:14'),
(3, 1, 'Upacara Adat', 'Digunakan dalam berbagai upacara adat sebagai bentuk penghormatan kepada leluhur dan tradisi.', '1779581539_6a124263805c2.png', '2026-05-23 04:10:14');

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

CREATE TABLE sejarah (
    id_sejarah INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    kategori VARCHAR(50) NOT NULL,
    judul VARCHAR(255) NOT NULL,
    isi TEXT NOT NULL,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);
 

INSERT INTO `sejarah` (`id_sejarah`, `id_admin`, `judul`, `isi`, `gambar`, `created_at`) VALUES
(1, 1, 'Asal Usul Tenun Ikat Sumba Barat', 'Tenun Ikat Sumba Barat merupakan warisan budaya yang diwariskan secara turun-temurun. Kain tenun tidak hanya digunakan sebagai pakaian, tetapi juga sebagai simbol status sosial, identitas budaya, dan bagian penting dalam upacara adat.', '1779598095_6a12830faeb4a.png', '2026-05-20 21:50:07'),
(2, 1, 'Sejarah Tenun Ikat Sumba Barat', 'Tenun Ikat Sumba Barat  memiliki sejarah yang panjang yang berkaitan erat dengan kehidupan masyarakat, adat istiadat, dan nilai budaya yang diwariskan secara turun-temurun', '1779594188_6a1273cc6535f.png', '2026-05-20 21:50:07'),
(3, 1, 'Warisan yang Terus Dilestarikan', 'Meskipun perkembangan zaman terus berjalan, masyarakat Sumba Barat tetap menjaga dan melestarikan tradisi menenun sebagai bagian dari identitas budaya.\r\n\r\nHingga kini, tenun ikat Sumba Barat terus hidup dan dikenalkan kepada generasi muda agar tidak hilang oleh waktu.', '1779597840_6a128210a0460.png', '2026-05-23 04:45:44');

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
-- Indexes for table `peran_tenun`
--
ALTER TABLE `peran_tenun`
  ADD PRIMARY KEY (`id_peran`),
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
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `beranda`
--
ALTER TABLE `beranda`
  MODIFY `id_beranda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `motif_makna`
--
ALTER TABLE `motif_makna`
  MODIFY `id_motif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `peran_tenun`
--
ALTER TABLE `peran_tenun`
  MODIFY `id_peran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proses_pembuatan`
--
ALTER TABLE `proses_pembuatan`
  MODIFY `id_proses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sejarah`
--
ALTER TABLE `sejarah`
  MODIFY `id_sejarah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `peran_tenun`
--
ALTER TABLE `peran_tenun`
  ADD CONSTRAINT `peran_tenun_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL;

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
