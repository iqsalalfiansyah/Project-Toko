<?php
$id_produk = $_GET['id'];

$ambil = $koneksi->query("SELECT * FROM produk LEFT JOIN kategori ON produk.id_kategori=kategori.id_kategori WHERE id_produk='$id_produk'");
$detailproduk = $ambil->fetch_assoc();
?>


<table class="table">
  <tr>
    <th>Produk</th>
    <td><?= $detailproduk['nama_produk']; ?></td>
  </tr>
  <tr>
    <th>Kategori</th>
    <td><?= $detailproduk['nama_kategori']; ?></td>
  </tr>
  <tr>
    <th>Harga</th>
    <td>Rp. <?= number_format($detailproduk['harga_produk']) ?>,-</td>
  </tr>
  <tr>
    <th>Berat</th>
    <td><?= $detailproduk['berat_produk']; ?></td>
  </tr>
  <tr>
    <th>Deskripsi</th>
    <td><?= $detailproduk['deskripsi_produk']; ?></td>
  </tr>
  <tr>
    <th>Stok</th>
    <td><?= $detailproduk['stok_produk']; ?></td>
  </tr>
  <tr>
    <th>Foto</th>
    <td>
      <img src="../foto_produk/<?= $detailproduk["foto_produk"]; ?>" width="200">
      </td>
  </tr>
</table>

      <button><a href="?halaman=produk">close</a></button>