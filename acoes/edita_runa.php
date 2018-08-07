<?php  
//Conexão com o banco
require_once '../conexao/conexao.php';

if(isset($_POST['editar'])):
    $id = $_POST['idRuna'];
    $tipo = $_POST['tipo'];
    $mob = $_POST['monstro'];
    $slot = $_POST['slot'];
    $atrPri = $_POST['atribPrincipal'];
    $atrSec = $_POST['atribSecundario'];
    $sub1 = $_POST['subAtrib1'];
    $sub2 = $_POST['subAtrib2'];
    $sub3 = $_POST['subAtrib3'];
    $sub4 = $_POST['subAtrib4'];

    $sql = "UPDATE runas SET
    Tipo = '$tipo',
    Monstro = '$mob',
    Slot = '$slot',
    AtribPrincipal = '$atrPri',
    AtribSecundario = '$atrSec',
    SubAtrib1 = '$sub1',
    SubAtrib2 = '$sub2',
    SubAtrib3 = '$sub3',
    SubAtrib4 = '$sub4' 
    WHERE idRuna = '$id'";
    
    if(mysqli_query($connect, $sql)):
        header('Location: index.php?Sucesso');
	else:
		header('Location: index.php?Erro');
    endif;
endif;
?>