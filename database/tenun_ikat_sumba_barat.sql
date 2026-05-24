CREATE DATABASE IF NOT EXISTS tenun_ikat_sumba_barat;
USE tenun_ikat_sumba_barat;

DROP TABLE IF EXISTS about;
DROP TABLE IF EXISTS galeri;
DROP TABLE IF EXISTS proses_pembuatan;
DROP TABLE IF EXISTS motif_makna;
DROP TABLE IF EXISTS sejarah;
DROP TABLE IF EXISTS beranda;
DROP TABLE IF EXISTS admin;

CREATE TABLE admin (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
    
);

CREATE TABLE beranda (
    id_beranda INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    judul VARCHAR(255) NOT NULL,
    deskripsi TEXT NOT NULL,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

CREATE TABLE sejarah (
    id_sejarah INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    judul VARCHAR(255) NOT NULL,
    isi TEXT NOT NULL,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS peran_tenun (
    id_peran INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    judul VARCHAR(255) NOT NULL,
    isi TEXT NOT NULL,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

CREATE TABLE motif_makna (
    id_motif INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    nama_motif VARCHAR(255) NOT NULL,
    asal_daerah VARCHAR(255) NOT NULL,
    makna TEXT NOT NULL,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

CREATE TABLE proses_pembuatan (
    id_proses INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    judul VARCHAR(255) NOT NULL,
    isi TEXT NOT NULL,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

CREATE TABLE galeri (
    id_galeri INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    judul VARCHAR(255) NOT NULL,
    gambar VARCHAR(255),
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

CREATE TABLE about (
    id_about INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    judul VARCHAR(255) NOT NULL,
    isi TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON DELETE SET NULL
);

INSERT INTO admin (nama, username, password) VALUES
('Administrator', 'admin', 'admin123');

INSERT INTO beranda (id_admin, judul, deskripsi, gambar) VALUES
(1, 'Tenun Ikat Sumba Barat', 'Warisan budaya leluhur yang memiliki nilai seni, sejarah, dan makna filosofis dalam kehidupan masyarakat Sumba Barat.', NULL);

INSERT INTO sejarah (id_admin, judul, isi, gambar) VALUES
(1, 'Asal Usul Tenun Ikat Sumba Barat', 'Tenun Ikat Sumba Barat merupakan warisan budaya yang diwariskan secara turun-temurun. Kain tenun tidak hanya digunakan sebagai pakaian, tetapi juga sebagai simbol status sosial, identitas budaya, dan bagian penting dalam upacara adat.', NULL),
(1, 'Peran Tenun dalam Kehidupan Adat', 'Dalam masyarakat Sumba Barat, tenun ikat memiliki peran penting dalam berbagai kegiatan adat, seperti pernikahan, kematian, penyambutan tamu, dan ritual budaya lainnya.', NULL);

INSERT INTO motif_makna (id_admin, nama_motif, asal_daerah, makna, gambar) VALUES
(1, 'Motif Kuda', 'Sumba Barat', 'Melambangkan keberanian, kekuatan, dan semangat perjuangan masyarakat Sumba.', NULL),
(1, 'Motif Mamuli', 'Sumba Barat', 'Melambangkan kesuburan, kehidupan, dan penghormatan terhadap perempuan.', NULL),
(1, 'Motif Ayam', 'Sumba Barat', 'Melambangkan kewaspadaan, kehidupan sosial, dan semangat kebersamaan.', NULL);

INSERT INTO proses_pembuatan (id_admin, judul, isi, gambar) VALUES
(1, 'Persiapan Benang', 'Benang dipilih dan dipersiapkan sebelum melalui proses pengikatan motif.', NULL),
(1, 'Pengikatan Motif', 'Motif dibuat dengan cara mengikat bagian-bagian tertentu pada benang sebelum proses pewarnaan.', NULL),
(1, 'Pewarnaan Alami', 'Benang diberi warna menggunakan bahan alami dari tumbuhan lokal.', NULL),
(1, 'Penenunan', 'Benang yang telah diwarnai kemudian ditenun menggunakan alat tenun tradisional.', NULL);

INSERT INTO galeri (id_admin, judul, gambar, keterangan) VALUES
(1, 'Kain Tenun Ikat Sumba Barat', NULL, 'Dokumentasi kain tenun ikat khas Sumba Barat.'),
(1, 'Proses Menenun Tradisional', NULL, 'Perajin sedang membuat kain tenun menggunakan alat tradisional.'),
(1, 'Ragam Motif Tenun', NULL, 'Berbagai motif tenun yang memiliki makna budaya.');

INSERT INTO about (id_admin, judul, isi) VALUES
(1, 'Tentang Website', 
'Website ini merupakan media informasi budaya yang menyajikan informasi mengenai sejarah, motif dan makna, proses pembuatan, serta galeri Tenun Ikat Sumba Barat.

Informasi yang disediakan bertujuan untuk membantu masyarakat mengenal, memahami, dan menghargai warisan budaya Tenun Ikat Sumba Barat.'),

(1, 'Tujuan Website', 
'Mengenalkan Tenun Ikat Sumba Barat kepada masyarakat luas sebagai salah satu warisan budaya yang bernilai.

Menyediakan informasi budaya yang akurat, terstruktur, dan mudah diakses oleh masyarakat.

Mendukung pelestarian warisan budaya Tenun Ikat Sumba Barat agar tetap dikenal oleh generasi mendatang.'),

(1, 'Harapan Website', 
'Website ini diharapkan dapat menjadi sarana yang bermanfaat bagi masyarakat untuk mengenal lebih dalam Tenun Ikat Sumba Barat serta mendorong upaya pelestarian agar warisan budaya ini tetap lestari dan dikenal oleh generasi mendatang.');


INSERT INTO peran_tenun (id_admin, judul, isi, gambar)
SELECT 1, 'Kelahiran', 'Digunakan dalam ritual kelahiran sebagai simbol doa dan harapan bagi bayi yang lahir.', ''
WHERE NOT EXISTS (
    SELECT 1 FROM peran_tenun WHERE judul = 'Kelahiran'
);

INSERT INTO peran_tenun (id_admin, judul, isi, gambar)
SELECT 1, 'Pernikahan', 'Menjadi bagian penting dalam upacara pernikahan sebagai simbol ikatan dan kebersamaan.', ''
WHERE NOT EXISTS (
    SELECT 1 FROM peran_tenun WHERE judul = 'Pernikahan'
);

INSERT INTO peran_tenun (id_admin, judul, isi, gambar)
SELECT 1, 'Upacara Adat', 'Digunakan dalam berbagai upacara adat sebagai bentuk penghormatan kepada leluhur dan tradisi.', ''
WHERE NOT EXISTS (
    SELECT 1 FROM peran_tenun WHERE judul = 'Upacara Adat'
);