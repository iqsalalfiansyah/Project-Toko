<?php
//koneksi ke database
include 'koneksi.php';
include 'navbar.php';
$id_pembelian = $_GET['id'];

$ambil = $koneksi->query("SELECT * FROM pembayaran JOIN pembelian ON pembayaran.id_pembelian=pembelian.id_pembelian WHERE pembelian.id_pembelian='$id_pembelian'");
$detbay = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detbay);
// echo "</pre>";

// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";

// Jika belum ada pembayaran
if(empty($detbay)){
  echo "<script>alert('Belum ada data pembayaran!');</script>";
  echo "<script>location='riwayat.php';</script>";
}

// Jika data pelanggan yang bayar tidak sesuai yang login
if($_SESSION['pelanggan']['id_pelanggan'] != $detbay['id_pelanggan']){
  echo "<script>alert('Akses ditolak!');</script>";
  echo "<script>location='riwayat.php';</script>";
}

?>
<section class="content">
  <div class="new-collections">
  <div class="container">
    <h3>Lihat Pembayaran</h3>
    <div class="row">
      <div class="col-md-6">
        <table class="table">
          <tr>
            <th>Nama</th>
            <td><?= $detbay['nama']; ?></td>
          </tr>
          <tr>
            <th>Bank</th>
            <td><?= $detbay['bank']; ?></td>
          </tr>
          <tr>
            <th>Tanggal</th>
            <td><?= $detbay['tanggal']; ?></td>
          </tr>
          <tr>
            <th>Jumlah</th>
            <td>Rp. <?= number_format($detbay['jumlah']); ?>,-</td>
          </tr>
        </table>
      </div>
      <div class="col-md-6">
        <img src="bukti_pembayaran/<?= $detbay['bukti']; ?>" alt="" class="img-responsive"> <br><br>
      </div>
      </div>
    </div>
  </div>
</section>
<?php
include 'footer.php';
?>