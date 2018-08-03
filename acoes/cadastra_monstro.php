<?php
//Conexao com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['cadastrar'])):
	$nome = $_POST['nome'];
	$atrib = $_POST['atributo'];
	$obs = $_POST['observacao'];
	
	$sql = "INSERT INTO monstros (Nome, Atributo, Observacao) values ('$nome', '$atrib', '$obs')";


	if(mysqli_query($connect, $sql)):
		header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
	endif;
endif;
?>