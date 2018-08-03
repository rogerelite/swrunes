<?php  
//Conexao com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['cadastrar'])):
    $tipo = $_POST['tipo'];
    $atrPri = $_POST['atribPrincipal'];
    $atrSec = $_POST['atribSecundario'];
    $sub1 = $_POST['subAtrib1'];
    $sub2 = $_POST['subAtrib2'];
    $sub3 = $_POST['subAtrib3'];
    $sub4 = $_POST['subAtrib4'];

    $sql = "INSERT INTO runas (Tipo, AtribPrincipal, AtribSecundario, SubAtrib1, SubAtrib2, SubAtrib3, SubAtrib4) values ('$tipo', '$atrPri', '$atrSec', '$sub1', '$sub2', '$sub3', '$sub4')";
    if(mysqli_query($connect, $sql)):
        header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>