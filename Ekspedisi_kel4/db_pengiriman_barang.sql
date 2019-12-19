-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Des 2019 pada 08.21
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pengiriman_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`) VALUES
('akuu', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_cek_resi`
--

CREATE TABLE `tb_cek_resi` (
  `no_resi` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  `posisi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `kota_tujuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_cek_resi`
--

INSERT INTO `tb_cek_resi` (`no_resi`, `status`, `posisi`, `tanggal`, `kota_tujuan`) VALUES
('0', 'SEDANG PROSES', 'MALANG', '2019-12-06 00:00:00', 'MADIUN'),
('1', 'SEDANG DIPROSES', 'MALANG', '2019-12-19 00:00:00', 'JAKARTA'),
('1912201901', 'SEDANG PROSES', 'MALANG', '2019-12-19 11:08:54', 'Kediri'),
('2', 'SEDANG DIPROSES', 'MALANG', '2019-12-19 00:00:00', 'BANDUNG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_paket`
--

CREATE TABLE `tb_jenis_paket` (
  `id_paket` int(5) NOT NULL,
  `paket_type` varchar(8) NOT NULL,
  `asuransi` int(3) NOT NULL,
  `biaya` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenis_paket`
--

INSERT INTO `tb_jenis_paket` (`id_paket`, `paket_type`, `asuransi`, `biaya`) VALUES
(1, 'Reguler', 20000, 20000),
(2, 'Reguler', 20000, 20000),
(3, 'Express', 20000, 30000),
(4, 'Express', 20000, 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ongkir`
--

CREATE TABLE `tb_ongkir` (
  `id` varchar(20) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_ongkir`
--

INSERT INTO `tb_ongkir` (`id`, `kode`, `kota`) VALUES
('1', 'SUB', 'Surabaya'),
('2', 'MLG', 'Malang'),
('3', 'JBG', 'Jombang'),
('4', 'SDA', 'Sidoarjo'),
('5', 'BLT', 'Blitar'),
('6', 'KDR', 'Kediri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penerima_barang`
--

CREATE TABLE `tb_penerima_barang` (
  `no_resi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_asal` varchar(15) NOT NULL,
  `id_petugas` varchar(6) NOT NULL,
  `penerima` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` int(12) NOT NULL,
  `no_pengirim` varchar(7) NOT NULL,
  `jumlah_item` int(3) NOT NULL,
  `isi_paket` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengirim`
--

CREATE TABLE `tb_pengirim` (
  `no_pengirim` varchar(7) NOT NULL,
  `nama_pengirim` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` varchar(15) NOT NULL,
  `provinsi` varchar(15) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `daerah` varchar(15) NOT NULL,
  `telepon` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengirim`
--

INSERT INTO `tb_pengirim` (`no_pengirim`, `nama_pengirim`, `alamat`, `kota`, `provinsi`, `kodepos`, `daerah`, `telepon`) VALUES
('1', 'Jojo', 'Embuh', 'Malang', 'Jatim', '123', 'Jawa', 345),
('2', 'Jija', 'Sidoarjo', 'SDA', 'Jatim', '32', 'Jawa', 2345),
('3', 'Mayang', 'Malang', 'Malang', 'JATIM', '1234', 'JAWA', 321);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengiriman_barang`
--

CREATE TABLE `tb_pengiriman_barang` (
  `no_resi` varchar(10) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `kota_tujuan` varchar(15) NOT NULL,
  `id_petugas` varchar(6) NOT NULL,
  `no_pengirim` varchar(7) NOT NULL,
  `penerima` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `paket_type` varchar(15) NOT NULL,
  `berat` int(3) NOT NULL,
  `biaya` int(3) NOT NULL,
  `asuransi` int(3) NOT NULL,
  `isi_paket` varchar(20) NOT NULL,
  `total` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengiriman_barang`
--

INSERT INTO `tb_pengiriman_barang` (`no_resi`, `tanggal`, `kota_tujuan`, `id_petugas`, `no_pengirim`, `penerima`, `alamat`, `telepon`, `paket_type`, `berat`, `biaya`, `asuransi`, `isi_paket`, `total`) VALUES
('1912201901', '19-12-2019', 'Kediri', '4', '3', 'Nova', 'jalan  bunga melati', '123456', 'Express', 10, 30000, 20000, 'Baju', 300000);

--
-- Trigger `tb_pengiriman_barang`
--
DELIMITER $$
CREATE TRIGGER `resi` AFTER INSERT ON `tb_pengiriman_barang` FOR EACH ROW INSERT INTO tb_cek_resi(no_resi,status,posisi,tanggal,kota_tujuan)
VALUES(new.no_resi,'SEDANG PROSES','MALANG',NOW(),new.kota_tujuan)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` varchar(6) NOT NULL,
  `nama_petugas` varchar(25) NOT NULL,
  `jabatan` varchar(5) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `jabatan`, `alamat`, `telepon`) VALUES
('1', 'pardjo', 'Kurir', 'Jalan in aja dulu', 123),
('2', 'jono', 'Admin', 'mlg', 345),
('3', 'Mukiyo', 'Kurir', 'Semarang', 3333),
('4', 'paul', 'Kurir', 'kalimanta', 90835836);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_resi`
--

CREATE TABLE `tb_resi` (
  `no_resi` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_resi`
--

INSERT INTO `tb_resi` (`no_resi`) VALUES
('D1'),
('D2'),
('D3'),
('D4'),
('D5');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_cek_resi`
--
ALTER TABLE `tb_cek_resi`
  ADD PRIMARY KEY (`no_resi`);

--
-- Indeks untuk tabel `tb_jenis_paket`
--
ALTER TABLE `tb_jenis_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `tb_ongkir`
--
ALTER TABLE `tb_ongkir`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penerima_barang`
--
ALTER TABLE `tb_penerima_barang`
  ADD PRIMARY KEY (`no_resi`);

--
-- Indeks untuk tabel `tb_pengirim`
--
ALTER TABLE `tb_pengirim`
  ADD PRIMARY KEY (`no_pengirim`);

--
-- Indeks untuk tabel `tb_pengiriman_barang`
--
ALTER TABLE `tb_pengiriman_barang`
  ADD PRIMARY KEY (`no_resi`),
  ADD UNIQUE KEY `id_petugas` (`id_petugas`),
  ADD UNIQUE KEY `no_pengirim` (`no_pengirim`),
  ADD UNIQUE KEY `no_resi_2` (`no_resi`),
  ADD KEY `no_resi` (`no_resi`),
  ADD KEY `id_petugas_2` (`id_petugas`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tb_resi`
--
ALTER TABLE `tb_resi`
  ADD PRIMARY KEY (`no_resi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_jenis_paket`
--
ALTER TABLE `tb_jenis_paket`
  MODIFY `id_paket` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_penerima_barang`
--
ALTER TABLE `tb_penerima_barang`
  ADD CONSTRAINT `tb_penerima_barang_ibfk_1` FOREIGN KEY (`no_resi`) REFERENCES `tb_pengiriman_barang` (`no_resi`);

--
-- Ketidakleluasaan untuk tabel `tb_pengiriman_barang`
--
ALTER TABLE `tb_pengiriman_barang`
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_1` FOREIGN KEY (`no_pengirim`) REFERENCES `tb_pengirim` (`no_pengirim`),
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
