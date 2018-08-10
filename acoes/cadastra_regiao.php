<?php
//Conexão com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['cadastrar'])):
    $regiao = $_POST['regiao'];
     $sql = "INSERT INTO regioes (Regiao) values ('$regiao')";

     if(mysqli_query($connect, $sql)):
		header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>