<?php
include "koneksi.php";
include "navbar.php";
?>
<div class="container-fluid">
    <h1>asdasd</h1>
    <div class="row">
    <?php
    $ambil = $koneksi->query("SELECT * FROM produk");
        while($perproduk =mysqli_fetch_array($ambil)):
    ?>
        <div class="col-md-4">
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
                        <a href="single.php" class="product-image">
                <img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" "height="200" width="300"/>
                <!-- <img src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" " class="img-responsive" /> -->
                </a>
                <div class="new-collections-grid1-image-pos">
                    <a href="single.php?id=<?=$perproduk['id_produk'];?>&idk=<?=$perproduk['id_kategori'];?>">Detail</a>
                </div>
                <h4><?= $perproduk['nama_produk']; ?></h4>
                <div class="new-collections-grid1-left simpleCart_shelfItem">
                    <p><span class="item_price">Rp. <?= number_format($perproduk['harga_produk']); ?>,-</span><a class="item_add" href="beli.php?id=<?= $perproduk['id_produk']; ?>">Beli </a></p>
                </div>
            </div>
        </div>
        <?php endwhile; ?>
    </div>
</div>
<?php
include "footer.php";
?>