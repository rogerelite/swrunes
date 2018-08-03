<?php
//Conexão com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['cadastrar'])):
    $nome = $_POST['nome'];
    $efeito = $_POST['efeito'];

    $sql = "INSERT INTO tiposruna (Tipo, Efeito) values ('$nome', '$efeito')";

    if(mysqli_query($connect, $sql)):
        header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>