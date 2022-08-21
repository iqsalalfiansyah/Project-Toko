<?php
// $datakategori = [];
// $ambil = $koneksi->query("SELECT * FROM kategori");
// while($tiap = $ambil->fetch_assoc()){
// 	$datakategori[] = $tiap;
// }
include '../koneksi.php'; 
// echo "<pre>";
// print_r($datakategori);
// echo "</pre>";

?>


<h2>Tambah kategori</h2>

<div class="row">
	<div class="col-md-8">
		<form action="" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>Nama</label>
					<input type="text" name="nama" class="form-control" required>
				</div>
			<button name="submit" class="btn btn-primary">Simpan</button>
		</form>
	</div>
</div>

<?php  
if(isset($_POST["submit"])){
	// menyimpan ke database
	$result = $koneksi->query("INSERT INTO kategori VALUES('', '$_POST[nama]')");
	if($result){
		echo "<script>alert('Data berhasil ditambahkan');window.location='index.php?halaman=kategori';</script>";
	}
	else {
		echo "<script>alert('Data gagal ditambahkan')</script>";
	}
}
?>


<script>
	$(document).ready(function(){
		$(".btn-tambah").on("click", function(){
			$(".letak-input").append("<input type='file' name='foto[]' class='form-control'>");
		})
	})
</>



















 