<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<?php
include 'navbar.php';
?>
<!-- //header -->

<!-- breadcrumbs -->
<div class="breadcrumbs">
	<div class="container">
		<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
			<li><a href="index.php"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a>
			</li>
			<li class="active">Detail Produk</li>
		</ol>
	</div>
</div>
<!-- //breadcrumbs -->

<!-- single -->
<div class="single">
	<?php
		$ambil = $koneksi->query("SELECT * FROM produk where id_produk='$_GET[id]'");
		while($perproduk = $ambil->fetch_assoc()):
		
			//jika tombol beli di klik
		if(isset($_POST['beli'])){
			//Mendapatkan jumlah yang diinputkan -->
		$jumlah = $_POST['jumlah'];

		//masuk ke keranjang belanja
		$_SESSION['keranjang'][$id_produk] = $jumlah;

		echo "<div class='alert alert-success'>Produk telah masuk ke keranjang</div>";
		echo "<meta http-equiv='refresh' content='1;url=keranjang.php'>";
		}
		?>

	<div class="container">
		<div class="col-md-2 products-left">

		</div>
		<div class="col-md-8 single-right">
			
			<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
				<div class="flexslider">
					<ul class="slides">
						<li data-thumb="images/si.jpg">
							<div class="thumb-image"> <img src="foto_produk/<?=$perproduk['foto_produk'];?>" data-imagezoom="true"
									class="img-responsive"> </div>
						</li>
						<!-- <li data-thumb="images/si1.jpg">
							<div class="thumb-image"> <img src="images/si1.jpg" data-imagezoom="true"
									class="img-responsive"> </div>
						</li>
						<li data-thumb="images/si2.jpg">
							<div class="thumb-image"> <img src="images/si2.jpg" data-imagezoom="true"
									class="img-responsive"> </div>
						</li> -->
					</ul>
				</div>
				<!-- flixslider -->
				<script defer src="js/jquery.flexslider.js"></script>
				<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
				<script>
					// Can also be used with $(document).ready()
					$(window).load(function () {
						$('.flexslider').flexslider({
							animation: "slide",
							controlNav: "thumbnails"
						});
					});
				</script>
				<!-- flixslider -->
			</div>
			<div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight"
				data-wow-delay=".5s">
				<h3><?=$perproduk['nama_produk'];?></h3>
				<h4><span class="item_price">Rp.<?=$perproduk['harga_produk'];?></span></h4>
				<div class="description">
					<h5><i>Description</i></h5>
					<p><?=$perproduk['deskripsi_produk'];?></p>
				</div>
				<h5>Stok : <?= $perproduk['stok_produk']; ?></h5>
				<form action="" method="post">
					<div class="form-group">
						<div class="input-group">
							<input type="number" min="1" max=" <?= $perproduk['stok_produk']; ?>" class="form-control" name="jumlah">
						</div>
					</div>
				</form>

				<div class="occasion-cart">
					<button class="item_add" name="beli">Belanja </button>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="clearfix"> </div>
	</div>
<?php endwhile; ?></div>
<!-- //single -->
<!-- single-related-products -->
<div class="single-related-products">
	
	<div class="new-collections">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Produk lainnya</h3>
				<?php
					$ambil = $koneksi->query("SELECT * FROM produk where id_kategori='$_GET[idk]'");
					while($perproduk = $ambil->fetch_assoc()):
					?>
			<div class="new-collections-grids">
				<div class="col-md-4 new-collections-grid">
					
					<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
								<a href="single.php" class="product-image"><img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" " class="img-responsive" /></a>
								<div class="new-collections-grid1-image-pos">
									<a href="single.php?id=<?=$perproduk['id_produk'];?>&idk=<?=$perproduk['id_kategori'];?>">Detail</a>
								</div>
						
						<h4><?= $perproduk['nama_produk']; ?></h4>
						<div class="new-collections-grid1-left simpleCart_shelfItem">
							<p><span class="item_price">Rp. <?= number_format($perproduk['harga_produk']); ?>,-</span><a class="item_add" href="beli.php?id=<?= $perproduk['id_produk']; ?>">Beli </a></p>
						</div>
					</div>
					
				</div>
					
			</div>
			<?php endwhile; ?>
		</div>
	</div>
</div>
<!-- //single-related-products -->
<!-- footer -->
<?php
	include 'footer.php';
	?>