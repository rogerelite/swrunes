<?php
//conexão com o banco de dados
$server = "localhost";
$user = "root";
$psw = "";
$bd = "sw_runes";

$connect = mysqli_connect($server, $user, $psw, $bd);
mysqli_set_charset($connect, "utf8");

if (mysqli_connect_error()):
	echo "Erro ao conectar a base de dados: ".mysqli_connect_error();
endif;
?>