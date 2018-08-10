<?php
//Conexão com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['excluir'])):
    $id = $_POST['idRegiao'];

    $sql = "DELETE FROM regioes WHERE idRegiao = '$id'";

    var_dump($sql);
    die();

    if(mysqli_query($connect, $sql)):
        header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>