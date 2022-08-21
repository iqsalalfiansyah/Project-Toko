<?php
$ambil = $koneksi->query("SELECT * FROM kategori WHERE id_kategori = '$_GET[id]'");
$pecah = $ambil->fetch_assoc();

include '../koneksi.php'; 
// echo "<pre>";
// print_r($datakategori);
// echo "</pre>";

?>


<h2>Ubah kategori</h2>

<div class="row">
	<div class="col-md-8">
		<form action="" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>Nama</label>
					<input type="text" name="nama" placeholder="<?= $pecah['nama_kategori']; ?>" class="form-control">
				</div>
			<button name="submit" class="btn btn-primary">Simpan</button>
		</form>
	</div>
</div>

<?php  
if(isset($_POST["submit"])){
	// menyimpan ke database
	$result = $koneksi->query("UPDATE kategori SET nama_kategori='$_POST[nama]' WHERE id_kategori='$_GET[id]'");
	if($result){
		echo "<script>alert('Data berhasil ditambahkan');window.location='index.php?halaman=kategori';</script>";
	}
	else{
		echo"<script>alert('Data gagal ditambahkan')</script>";
	}
}
?>


<script>
	$(document).ready(function(){
		$(".btn-tambah").on("click", function(){
			$(".letak-input").append("<input type='file' name='foto[]' class='form-control'>");
		})
	})
</script>
