<?php
//Conexão com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['editar'])):
    $id = $_POST['idRegiao'];
    $regiao = $_POST['regiao'];

    $sql = "UPDATE regioes SET Regiao = '$regiao' where idRegiao = '$id'";

    if(mysqli_query($connect, $sql)):
        header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>