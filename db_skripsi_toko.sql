-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jul 2022 pada 12.55
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skripsi_toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Tenda'),
(2, 'HandLamp'),
(3, 'Kompor'),
(6, 'Sleeping Bag'),
(7, 'Paket Hemat Kompor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Demak', 20000),
(2, 'Cirebon', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(100) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'doddy@gmail.com', 'doddy', 'Doddy Setiawan', '08888123123', ''),
(2, 'erik@gmail.com', 'erik', 'Erik Candra', '0888111111', ''),
(3, 'yudi@contoh.com', '1234', 'Yudi Saputra', '0746356643', 'Jogja'),
(4, 'doni@contoh.com', '1234', 'Doni', '0761888888', 'Semarang'),
(5, 'erwin@contoh.com', '1234', 'Erwin', '088867553', 'Demak'),
(6, 'sal@sal', 'sal', 'sal', '534', 'afaf'),
(7, 'nang@nang', 'nang', 'nang', '087767768', 'jakarta'),
(8, 'lala@lala', 'lala', 'afeef', '525', 'afvawf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(4, 11, 'Erik', 'Mandiri', 2020000, '2020-08-05', '20200805165815tugas3.png'),
(5, 13, 'Erik', 'Mandiri', 6020000, '2020-08-08', '20200808173932punya-putri.png'),
(6, 18, 'Doni', 'Mandiri', 6044000, '2020-09-15', '20200915032134database.png'),
(7, 19, 'Erwin', 'Mandiri', 3024000, '2020-09-15', '20200915045855database.png'),
(8, 20, 'asd', 'asd', 3555555, '2022-07-07', '202207071031084DfZgQ.jpg'),
(9, 22, '', '', 0, '2022-07-11', '20220711084617'),
(10, 23, 'sal', 'BCA', 20000, '2022-07-12', '20220712002156ERD WOY.png'),
(11, 24, '', '', 0, '2022-07-13', '20220713175337'),
(12, 28, 'iqsal', 'BCA', 690000, '2022-07-14', '20220714183532gg.png'),
(13, 34, 'nang', 'bca', 445000, '2022-07-15', '20220715133902gg.png'),
(14, 35, 'SUSANTI', 'BCA', 2000000, '2022-07-17', '20220717053628gg.png'),
(15, 40, 'SUSANTI', 'BCA', 552524, '2022-07-20', '202207201907351658232540498.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(1, 1, '2020-07-25', 1500000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(2, 1, '2020-07-26', 500000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(6, 1, '2020-07-29', 2520000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(7, 1, '2020-07-29', 2520000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(8, 1, '2020-07-29', 2530000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(9, 2, '2020-08-01', 1520000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(10, 2, '2020-08-01', 1520000, '', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(11, 2, '2020-08-01', 2020000, '', 'barang dikirim', '1214121', 0, '', '', '', '', '', '', 0, ''),
(12, 2, '2020-08-01', 2020000, 'jl. Serayu kode pos: 5611122', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(13, 2, '2020-08-08', 6020000, 'Waru ', 'sudah kirim pembayaran', '', 0, '', '', '', '', '', '', 0, ''),
(16, 3, '2020-08-15', 8030000, 'Jl. Sultan, Cirebon', 'pending', '', 0, '', '', '', '', '', '', 0, ''),
(17, 3, '2020-09-13', 6024000, 'Jl. Hastina 2 Wedomartani Sleman', 'pending', '', 4000, 'DI Yogyakarta', 'Sleman', 'Kabupaten', '55513', 'jne', 'CTC', 24000, '1-2'),
(18, 4, '2020-09-15', 6044000, 'jl. Pemuda 287 Semarang', 'barang dikirim', 'smg000343', 4000, 'Jawa Tengah', 'Semarang', 'Kota', '50135', 'jne', 'REG', 44000, '2-3'),
(19, 5, '2020-09-15', 3024000, 'jl. Sedayu no 14 Demak', 'barang dikirim', 'Dmk0034345', 2000, 'Jawa Tengah', 'Demak', 'Kabupaten', '59519', 'jne', 'OKE', 24000, '6-7'),
(20, 5, '2022-07-07', 500000, '', 'sudah kirim pembayaran', '', 1000, 'DKI Jakarta', 'Kepulauan Seribu', 'Kabupaten', '14550', 'tiki', '', 0, ''),
(21, 5, '2022-07-07', 1650000, '', 'pending', '', 10005, 'DKI Jakarta', 'Jakarta Pusat', 'Kota', '10540', 'tiki', 'REG', 150000, '2'),
(22, 6, '2022-07-11', 176000, '', 'sudah kirim pembayaran', '', 2000, 'Jawa Timur', 'Gresik', 'Kabupaten', '61115', 'jne', 'OKE', 26000, '4-5'),
(23, 6, '2022-07-11', 565000, '', 'sudah kirim pembayaran', '', 10005, 'Lampung', 'Way Kanan', 'Kabupaten', '34711', 'tiki', 'REG', 420000, '3'),
(24, 6, '2022-07-11', 620000, '', 'sudah kirim pembayaran', '', 1900, 'DI Yogyakarta', 'Bantul', 'Kabupaten', '55715', 'pos', 'Express Next Day Barang', 20000, '1 HARI'),
(25, 6, '2022-07-12', 75000, '', 'pending', '', 1000, '', '', '', '', '', '', 0, ''),
(26, 6, '2022-07-13', 167000, '', 'pending', '', 700, 'Maluku', 'Ambon', 'Kota', '97222', 'pos', 'Paket Kilat Khusus', 67000, '8 HARI'),
(27, 6, '2022-07-13', 147000, '', 'pending', '', 1000, 'Maluku', 'Buru', 'Kabupaten', '97371', 'pos', 'Paket Kilat Khusus', 72000, '10 HARI'),
(28, 6, '2022-07-14', 690000, '', 'sudah kirim pembayaran', '', 1900, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'pos', 'Express Next Day Barang', 60000, '1 HARI'),
(29, 6, '2022-07-15', 91000, 'Jakarta', 'pending', '', 1000, 'DKI Jakarta', 'Jakarta Barat', 'Kota', '11220', 'jne', 'REG', 16000, '2-3'),
(30, 6, '2022-07-15', 89000, 'Bandung', 'pending', '', 1000, 'Jawa Barat', 'Bandung', 'Kota', '40111', 'jne', 'OKE', 14000, '4-5'),
(31, 6, '2022-07-15', 295000, '', 'pending', '', 12005, '', '', '', '', '', '', 0, ''),
(32, 6, '2022-07-15', 75000, '', 'pending', '', 1000, '', '', '', '', '', '', 0, ''),
(33, 6, '2022-07-15', 75000, '', 'pending', '', 1000, '', '', '', '', '', '', 0, ''),
(34, 6, '2022-07-15', 445000, '', 'sudah kirim pembayaran', '', 10005, 'DKI Jakarta', 'Jakarta Pusat', 'Kota', '10540', 'tiki', 'ONS', 300000, '1'),
(35, 7, '2022-07-17', 1412000, 'JL.H.BATONG 1', 'barang dikirim', '1214121', 3800, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'jne', 'YES', 152000, '1-1'),
(36, 7, '2022-07-17', 109000, 'afaf', 'pending', '', 1000, 'Lampung', 'Way Kanan', 'Kabupaten', '34711', 'pos', 'Paket Kilat Khusus', 34000, '7 HARI'),
(37, 7, '2022-07-17', 130000, 'gaegae', 'pending', '', 1000, 'Jambi', 'Merangin', 'Kabupaten', '37319', 'pos', 'Paket Kilat Khusus', 55000, '8 HARI'),
(38, 6, '2022-07-19', 684000, 'njjn', 'pending', '', 1900, 'Lampung', 'Metro', 'Kota', '34111', 'tiki', 'ECO', 54000, '5'),
(39, 6, '2022-07-20', 810000, '', 'pending', '', 1900, 'Maluku', 'Tual', 'Kota', '97612', 'pos', 'Paket Kilat Khusus', 180000, '15 HARI'),
(40, 6, '2022-07-20', 690000, '', 'barang dikirim', '45235241', 1900, 'Jawa Barat', 'Bekasi', 'Kota', '17121', 'pos', 'Express Next Day Barang', 60000, '1 HARI'),
(41, 6, '2022-07-25', 1014000, 'hbbh', 'pending', '', 1900, 'Maluku', 'Ambon', 'Kota', '97222', 'jne', 'REG', 164000, '5-6'),
(42, 6, '2022-07-25', 668000, 'ada', 'pending', '', 1900, 'Lampung', 'Way Kanan', 'Kabupaten', '34711', 'pos', 'Paket Kilat Khusus', 68000, '7 HARI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 1, '', 0, 0, 0, 0),
(2, 1, 2, 1, '', 0, 0, 0, 0),
(3, 7, 1, 2, '', 0, 0, 0, 0),
(4, 7, 2, 1, '', 0, 0, 0, 0),
(5, 8, 1, 2, '', 0, 0, 0, 0),
(6, 8, 2, 1, '', 0, 0, 0, 0),
(7, 9, 1, 1, '', 0, 0, 0, 0),
(8, 9, 2, 1, '', 0, 0, 0, 0),
(9, 10, 1, 1, 'Laptop Asus xix', 1000000, 1000, 1000, 1000000),
(10, 10, 2, 1, 'Laptop Acer 212', 500000, 1000, 1000, 500000),
(11, 11, 1, 1, 'Laptop Asus xix', 1500000, 1000, 1000, 1500000),
(12, 11, 2, 1, 'Laptop Acer 212', 500000, 1000, 1000, 500000),
(13, 0, 1, 1, 'Laptop Asus xix', 1500000, 1000, 1000, 1500000),
(14, 0, 2, 1, 'Laptop Acer 212', 500000, 1000, 1000, 500000),
(15, 12, 1, 1, 'Laptop Asus xix', 1500000, 1000, 1000, 1500000),
(16, 12, 2, 1, 'Laptop Acer 212', 500000, 1000, 1000, 500000),
(17, 13, 2, 2, 'Laptop Acer 212', 500000, 1000, 2000, 1000000),
(18, 13, 3, 2, 'Laptop macbook 212', 2500000, 1200, 2400, 5000000),
(23, 16, 3, 2, 'Laptop macbook 212', 2500000, 1200, 2400, 5000000),
(24, 16, 4, 1, 'Laptop Pro', 3000000, 2000, 2000, 3000000),
(25, 17, 4, 2, 'Laptop Pro', 3000000, 2000, 4000, 6000000),
(26, 18, 4, 2, 'Laptop Pro', 3000000, 2000, 4000, 6000000),
(27, 19, 1, 2, 'Laptop Asus xix', 1500000, 1000, 2000, 3000000),
(28, 20, 2, 1, 'Laptop Acer 212', 500000, 1000, 1000, 500000),
(29, 21, 1, 1, 'Laptop Asus ', 1500000, 10005, 10005, 1500000),
(30, 22, 2, 2, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 2000, 150000),
(31, 23, 1, 1, 'Kompor Lipat Ultralight', 145000, 10005, 10005, 145000),
(32, 24, 5, 1, 'Tenda Camping Compass Alloy 2-3P', 600000, 1900, 1900, 600000),
(33, 25, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(34, 26, 16, 1, 'Paket Hemat Kompor Kotak + Windshield', 100000, 700, 700, 100000),
(35, 27, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(36, 28, 7, 1, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 1900, 630000),
(37, 29, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(38, 30, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(39, 31, 2, 2, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 2000, 150000),
(40, 31, 1, 1, 'Kompor Lipat Ultralight', 145000, 10005, 10005, 145000),
(41, 32, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(42, 33, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(43, 34, 1, 1, 'Kompor Lipat Ultralight', 145000, 10005, 10005, 145000),
(44, 35, 7, 2, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 3800, 1260000),
(45, 36, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(46, 37, 2, 1, 'Kepala Kompor Ultraligh Gas Canister', 75000, 1000, 1000, 75000),
(47, 38, 20, 1, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 1900, 630000),
(48, 39, 20, 1, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 1900, 630000),
(49, 40, 20, 1, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 1900, 630000),
(50, 41, 23, 1, 'Tenda Camping Cotrex M27 Fiber 4-5P', 850000, 1900, 1900, 850000),
(51, 42, 19, 1, 'Tenda Camping Compass Alloy 2-3P', 600000, 1900, 1900, 600000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(19, 1, 'Tenda Camping Compass Alloy 2-3P', 600000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.35.jpeg', 'Tenda Ultralight dengan bobot sangat ringan dan harganya pun tidak berat, berat hanya 1,9 kg sangat cocok untuk anda yang mendambakan tenda Ultralight yang ringan dengan harga bersahabat, dengan frame yang sudah alloy. tenda ini mirip dengan tenda Great outdoor fly air, dengan type dan speksifikasi yang mirip tapi harganya lebih murah.\r\n\r\nSpeksifikasi :\r\nCap : 2-3 Person\r\nUkuran : 210x(140+50)x110Cm\r\nFlysheet: 210T polyester PU3000mm\r\nInner : mesh\r\nFloor : 210T polyester PU3000mm\r\nPole : D7.9mm x 2 pcs 7001 Alumunium\r\nPasak : 4mm x 18cm x 10 pcs steel\r\nPacking size : 40 x 16 x 16cm\r\n\r\nready stok warna biru aja seperti gambar', 3),
(20, 1, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.36.jpeg', 'Ready Tenda Lwy Compass Fiber Kapasitas 4-5 Orang ,Double Layer, Alas Terpal, Frame Fiberglass ,Double Pintu Dan Frame / Tiang Tambahan Untuk Kanopi Teras \r\nCek Gambar. \r\n\r\n- Spek :\r\n- Warna: orange dan biru\r\n\r\n- Tenda Lwy Compass 4org (Muat 5org) Original.\r\n(Sesuai Digambar)\r\n- Size : 210 x 210 x 140cm \r\n- Material Outter : 100% Polyester PU3000mm\r\n- Inner Lapisan Jaring\r\n- Cloth : 190T Waterproof\r\n- Double Pintu\r\n- Pole : 7,9mm Fiberglass\r\n- Terdapat Frame / Tiang Tambahan (Untuk Kanopi Depan)\r\n- Weight : 4,1kgs\r\n- Packing Size : 60cm x 15cm x 15cm\r\n\r\n- Sangat Cocok Untuk Kegiatan Camping, Outdoor, Hiking , Holiday Dan Traveling\r\n(Keep Safety Your Trip)', 0),
(23, 1, 'Tenda Camping Cotrex M27 Fiber 4-5P', 850000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.40.jpeg', 'SPESIFIKASI PRODUCT\r\n\r\n190TPu 1500mm Polyester\r\nInner : Polyester Breathable\r\nFloor : 210TPu 3500mm Polyester\r\nPole : dia 8,5mm 2 pc\r\n+1 pc fibergalss\r\nAPPROXIMATE PACKED SIZE ; \r\n- Inner: 50+150+50*220*120 cm, fly \r\n- Outer: L250*W220*H120cm \r\n\r\nFEATURE :\r\n* Two person Operation\r\n* UV protected\r\n* Mould Resistant\r\n* Wont Rust\r\nKapasitas 4 Orang\r\nFull Layer, Waterproof\r\n\r\n\r\nBenefits Product : \"mempunyai durability yang tinggi di design tahan dalam 2 tahun penggunaan\" dibuat melalui sistem pabrikasi dengan teknologi modern.\r\nRegion Manufaktur : \" Made In Indonesia\"', 4),
(24, 1, 'Tenda Camping Bestway Monodome Pavillo 2-3P', 260000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.40 (1).jpeg', 'Bestway Tenda Monodome Pavillo X2 Tent\r\n\r\nPerjalanan berkemah menjadi lebih mudah dan nyaman dengan Bestway Monodome X2 Tent.\r\n\r\nTenda ini memiliki perlindungan dasar PE tahan air yang membuat kelembaban di dalam tenda.  Tenda juga dilengkapi dengan saku dalam sehingga Anda akan memiliki tempat untuk menyimpan barang-barang pribadi Anda.\r\n\r\nBestway Monodome X2 mudah untuk setup dan pemasangannya. \r\n\r\nFitur - Kokoh, pintu jaring anti-serangga.\r\nBahan: 170T polyester PA300mm dilapisi.\r\nAlas/ Perlindungan tanah: 110G / M2 PE.\r\n\r\nMudah untuk pemasangan dan nyaman untuk dibawa.\r\nKualitas, Kenyamanan dan Keamanan Tinggi Bestway Product suduh lulus uji standard international untuk kenyamanan, kelayakan dan keamanan. Terbuat dari bahan berkualitas tinggi dan desain yang spesial. Memberikan Manfaat Lebih Bestway Product sudah terbukti sangat bermanfaat bagi banyak penggunanya, mulai dari kasur angin/ airbed, sleeping bag, sofa angin/ air sofabed, berbagai macam kolam, kacamata renang, arena bermain anak, tenda camping, perahu karet, dsb.', 4),
(25, 2, 'Headlamp Jaks 6', 40000, 500, 'WhatsApp Image 2022-07-18 at 13.18.47.jpeg', 'Lampu dengan 3 mode pencahayaan, Headlamp ini berbentuk mini dan dapat di ikatkan di kepala Anda, membantu penelusuran di tempat gelap, dan perjalanan di malam hari.\r\n\r\nFEATURES\r\n3 Modes Headlight\r\nTerdapat 3 mode pencahayaan lampu yang dapat Anda gunakan untuk menerangi perjalanan Anda dimalam hari atau di tempat gelap.\r\n\r\n45 Degree Rotate\r\nSenter kepala ini sangat fleksibel, dapat digerakkan sebanyak 45 derajat untuk keperluan menyinari area yang Anda inginkan tanpa harus memaksakan kepala Anda mengarah ke arah yang dituju.\r\n\r\nAdjustable Headstrap\r\nIkatan kepala dari Headlamp LED flashlight ini dapat diatur menyesuaikan dengan bentuk kepala Anda.\r\n\r\n18650 Batteries\r\nAnda dapat menggunakan 18650 batteries untuk penjelajahan yang lebih lama dengan headlamp ini, Anda bisa mengkombinasikan kapasitas baterai agar dapat digunakan dalam jangka waktu yang lama.\r\n\r\nPACKAGE CONTENTS\r\nBarang-barang yang anda dapat dalam kotak produk:\r\n\r\n1 x Headlamp Flashlight Headlight LED 3 Modes COB - KX-1804\r\n\r\nLED	Model of LED: 1*XPE +1*COB\r\nLuminious Flux	Lumens: 180lm (COB), 100lm (XPE)\r\nBattery Type	18650\r\nLength	8.5cm x 3.8cm x 4cm\r\nOthers	splashproof', 5),
(26, 2, 'awda', 342, 42, 'WhatsApp Image 2022-07-18 at 13.18.35.jpeg', '                              gvegefa                        ', 23),
(28, 2, 'KARYATI', 242, 242, 'WhatsApp Image 2022-07-18 at 13.18.43.jpeg', '                    afawfaw                ', 424),
(29, 3, 'Evi Sundari', 424, 1241, 'WhatsApp Image 2022-07-18 at 13.18.43 (1).jpeg', '                    afafawf                ', 424),
(30, 3, 'gsee', 42, 42, 'WhatsApp Image 2022-07-18 at 13.18.36.jpeg', '                    afaf                ', 424),
(31, 3, 'rgsrg', 4221, 424, 'WhatsApp Image 2022-07-18 at 13.18.40.jpeg', '                    efeaf                ', 44),
(32, 3, 'drhfh', 24, 242, 'WhatsApp Image 2022-07-18 at 13.18.40 (1).jpeg', '                    gsg                ', 243),
(33, 6, 'hdrhs', 342, 3424, 'WhatsApp Image 2022-07-18 at 13.18.43.jpeg', '                    rdb                ', 43),
(34, 6, 'hmhg', 24, 34, 'WhatsApp Image 2022-07-18 at 13.18.47.jpeg', '                    sgg                ', 42);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(18, 19, 'gg.png'),
(19, 20, 'gg.png'),
(20, 21, 'GoQua.png'),
(21, 22, 'nang.jpg'),
(22, 23, 'gg.png'),
(23, 24, 'gg.png'),
(24, 25, 'gg.png'),
(25, 26, 'gg.png'),
(26, 27, 'gg.png'),
(27, 28, 'gg.png'),
(28, 29, 'gg.png'),
(29, 30, 'gg.png'),
(30, 31, 'gg.png'),
(31, 32, 'gg.png'),
(32, 33, 'gg.png'),
(33, 34, 'gg.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
