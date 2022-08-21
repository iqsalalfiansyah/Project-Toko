<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!-- header -->
	<?php
	include './navbar.php';
	?>

<!-- collections -->
	<!-- <div class="new-collections"> -->
	<div class="container-fluid">
		<h1 class="animated wow zoomIn mb-4" data-wow-delay=".5s" align="center">New Collections</h1>
		<div class="row">
			<?php
				$ambil = $koneksi->query("SELECT * FROM produk");
				while($perproduk = $ambil->fetch_assoc()):
				?>
				<!-- <div class="marginTop"> -->

					<div class="col-md-4 my-2">
						<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
							<!-- <a href="single.php" class="product-image"> -->
										<!-- <img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" " class="img-responsive" /> -->
										<!-- </a> -->
										<!-- <div class="new-collections-grid1-image-pos">
											<a href="single.php?id=<?=$perproduk['id_produk'];?>&idk=<?=$perproduk['id_kategori'];?>">Detail</a>
									</div>
							
							<h4><?= $perproduk['nama_produk']; ?></h4>
							<div class="new-collections-grid1-left simpleCart_shelfItem">
								<p><span class="item_price">Rp. <?= number_format($perproduk['harga_produk']); ?>,-</span><a class="item_add" href="beli.php?id=<?= $perproduk['id_produk']; ?>">Beli </a></p>
							</div>
						</div> -->
						<a href="detail.php" class="product-image">
					<img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" "height="250" width="350"/>
					<!-- <img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" " class="img-responsive" /> -->
					</a>
					<div class="new-collections-grid1-image-pos">
						<a href="detail.php?id=<?=$perproduk['id_produk'];?>&idk=<?=$perproduk['id_kategori'];?>">Beli</a>
					</div>
					<h4><?= $perproduk['nama_produk']; ?></h4>
					<div class="new-collections-grid1-left simpleCart_shelfItem">
						<p><span class="item_price" >Rp. <?= number_format($perproduk['harga_produk']); ?>,-</span></p>
					</div>
				<!-- </div> -->
    <!-- </div> -->
			</div>
		</div>
			<?php endwhile; ?>
		</div>
		</div>
	<!-- </div> -->
<!-- //collections -->
<!-- footer -->
	<?php
	include './footer.php';
	?>