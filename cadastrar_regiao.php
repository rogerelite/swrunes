<?php
    include_once 'includes/header.php';
    include_once 'includes/menu_top.php';
?>

Cadastre a região
<form action="acoes/cadastra_regiao.php" method="post">
    Nome: <input type="text" name="regiao" id="regiao">
    <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar">
</form>