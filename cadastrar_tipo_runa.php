<?php
	include_once 'includes/header.php';
    include_once 'includes/menu_top.php';
?>

Cadastre o tipo de runa

<form action="acoes/cadastra_tipo_runa.php" method="post">
    Nome: <input type="text" name="nome" id="nome">
    Efeito: <input type="text" name="efeito" id="efeito">
    <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar">
</form>