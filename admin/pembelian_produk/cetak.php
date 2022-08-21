<?php
include "../../koneksi.php";

echo "<pre>";
// print_r ($_GET);
echo "</pre>";

$tgl_mulai = $_GET["tglm"];
$tgl_selesai = $_GET["tgls"];

$semuadata = array();
$ambil = $koneksi->query("SELECT * FROM pembelian pm LEFT JOIN pelanggan pl 
         ON pm.id_pelanggan=pl.id_pelanggan WHERE tanggal_pembelian BETWEEN '$tgl_mulai' AND '$tgl_selesai'");
while($pecah = $ambil->fetch_array())
{
   $semuadata[]=$pecah;
}

echo "<table class='table table-bordered'>";
  echo "<thead>";
    echo "<tr>
      <th>No</th>
      <th>Pelanggan</th>
      <th>Tanggal</th>
      <th>Jumlah</th>
      <th>Status</th>
    </tr>";
  echo "</thead>";
  echo "<tbody>";
    $total=0;
    foreach($semuadata as $key => $value):
    $total += $value['total_pembelian'];
    $nomor = 1; $nomor++;
    echo"<tr>";
      echo"<td>".$nomor."</td>";
      echo"<td>".$value['nama_pelanggan']."</td>";
      echo"<td>".$value['tanggal_pembelian']."</td>";
      echo"<td>Rp. ".number_format($value['total_pembelian']).",-</td>";
      echo"<td>".$value['status_pembelian']."</td>";
    echo"</tr>";
    endforeach;
  echo"</tbody>";
  echo"<tfoot>";
    echo"<tr>";
      echo"<th colspan='3'>Total</th>";
      echo"<th>Rp. ".number_format($total).",-</th>";
    echo"</tr>";
  echo"</tfoot>";
echo"</table>";
?>
<script>window.print()</script>