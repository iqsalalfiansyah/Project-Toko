<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<?php
//koneksi ke database
include 'koneksi.php';

$idk = $_GET['id_kategori'];
?>


	<?php
	include 'navbar.php';
	?>
	<!-- //header -->
	<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a>
				</li>
				<li class="active">Products</li>
			</ol>
		</div>
	</div>
	<div class="products">
		<div class="container">

			<div class="col-md-12 products-right">
				<?php
					$ambil = $koneksi->query("SELECT * from produk where id_kategori='$idk' order by id_produk ASC");
					while($perproduk = $ambil->fetch_assoc()):
					?>
					<div class="new-collections-grids">
						<div class="col-md-4 new-collections-grid">
							
							<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
										<a href="single.html" class="product-image"><img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" " class="img-responsive" /></a>
										<div class="new-collections-grid1-image-pos">
										<a href="detail.php?id=<?=$perproduk['id_produk'];?>&idk=<?=$perproduk['id_kategori'];?>">Beli</a>
										</div>
								
								<h4><?= $perproduk['nama_produk']; ?></h4>
								<div class="new-collections-grid1-left simpleCart_shelfItem">
									<p><span class="item_price">Rp. <?= number_format($perproduk['harga_produk']); ?>,-</span></p>
								</div>
							</div>
							
						</div>
							
					</div>
					<?php endwhile; ?>
				</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<?php
	include 'footer.php';
	?>
	<!-- //footer -->
