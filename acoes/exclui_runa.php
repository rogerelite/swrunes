<?php
//Conexão com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['excluir'])):
    $id = $_POST['idRuna'];

    $sql = "DELETE FROM runas WHERE idRuna = '$id'";

    if(mysqli_query($connect, $sql)):
        header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>