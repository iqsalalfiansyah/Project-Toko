<?php
// Koneksi ke database
include 'koneksi.php';
include 'navbar.php';
// Jika tidak ada session pelanggan (belum login)
if(!isset($_SESSION['pelanggan']) OR empty($_SESSION['pelanggan'])){
	echo "<script>alert('Silahkan login');</script>";
	echo "<script>location='login.php';</script>";
	exit();
}

// Mendapatkan id_pembelian dari url
$idpem = $_GET['id'];
$ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pembelian='$idpem'");
$detpem = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detpem);
// print_r($_SESSION);
// echo "</pre>";

// Mendapatkan id_pelanggan yg beli
$id_pelanggan_beli = $detpem['id_pelanggan'];
// Mendapatkan id_pelanggan yg login
$id_pelanggan_login = $_SESSION['pelanggan']['id_pelanggan'];

if($id_pelanggan_beli != $id_pelanggan_login){
  echo "<script>alert('Akses ditolak!');</script>";
	echo "<script>location='riwayat.php';</script>";
	exit();
}

?>
<section class="content">
  <div class="new-collections">
  <div class="container">
    <h3>Konfirmasi Pembayaran</h3>
    <p>Kirim bukti pembayaran anda disini</p>
    <div class="row">
      <div class="col-md-8">
        <div class="alert alert-info">total tagihan anda <strong>Rp. <?= number_format($detpem['total_pembelian']); ?>,-</strong></div>
         <div class="alert alert-info">
            Silahkan lakukan pembayaran ke <strong>BANK MANDIRI 123-111-111 AN Asal Koding</strong>
        </div>
        <form action="" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="">Nama Penyetor</label>
            <input type="text" class="form-control" name="nama" required>
          </div>
          <div class="form-group">
            <label for="">Bank</label>
            <input type="text" class="form-control" name="bank" required>
          </div>
          <div class="form-group">
            <label for="">Jumlah</label>
            <input type="number" class="form-control" name="jumlah" min="1" required>
          </div>
          <div class="form-group">
            <label for="">Foto Bukti</label>
            <input type="file" class="form-control" name="bukti" required>
            <p class="text-danger">foto bukti harus JPG maksimal 2 MB</p>
          </div>
          <button class="btn btn-primary" name="kirim">Kirim</button>
        </form>

        <?php
        // Jika tombol kirim di pencet
        if(isset($_POST['kirim'])){
          // Upload dulu foto bukti
          $namabukti = $_FILES['bukti']['name'];
          $lokasibukti = $_FILES['bukti']['tmp_name'];
          $namafiks = date('YmdHis').$namabukti;
          move_uploaded_file($lokasibukti, "bukti_pembayaran/$namafiks");

          $nama = $_POST['nama'];
          $bank = $_POST['bank'];
          $jumlah = $_POST['jumlah'];
          $tanggal = date('Y-m-d');

          // Insert ke tabel pembayaran
          $koneksi->query("INSERT INTO pembayaran(id_pembelian, nama, bank, jumlah, tanggal, bukti) VALUES('$idpem', '$nama', '$bank', '$jumlah', '$tanggal', '$namafiks')");

          // Update data pembelian dari pending menjadi sudah kirim pembayaran
          $koneksi->query("UPDATE pembelian SET status_pembelian='sudah kirim pembayaran' WHERE id_pembelian='$idpem'");

          echo "<script>alert('Terima kasih sudah melakukan pembayaran');</script>";
	        echo "<script>location='riwayat.php';</script>";
        }
        ?>
      </div>
    </div>
  </div>
  </div>
</section>
  <?php
  include 'footer.php';
  ?>