<?php

$koneksi->query("DELETE FROM pelanggan WHERE id_pelanggan = '$_GET[id]'");

echo "<script>alert('kategori terhapus');</script>";
echo "<script>location='index.php?halaman=kategori';</script>";