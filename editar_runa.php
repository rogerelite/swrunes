<?php
	include_once 'includes/header.php';
	include_once 'includes/menu_top.php';
?>

Edição de runas<br />
<a href="cadastrar_runa.php">Cadastrar runa</a>

<form action="acoes/edita_runa.php" method="post">
    <?php
        $sql = "SELECT * FROM runas";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
    <hr>
    
    Runa: <?php echo $dados['Tipo']; ?>
    Atributo Principal: <?php echo $dados['AtribPrincipal'] ?>
    Atributo Secundário: <?php echo $dados['AtribSecundario'] ?>
    Sub-Atributo 1: <?php echo $dados['SubAtrib1'] ?>
    Sub-Atributo 2: <?php echo $dados['SubAtrib1'] ?>
    Sub-Atributo 3: <?php echo $dados['SubAtrib1'] ?>
    Sub-Atributo 4: <?php echo $dados['SubAtrib1'] ?>
    <a href="acoes/edita_runa.php">Editar</a>
    <a href="acoes/exclui_runa.php">Excluir</a>
    <?php endwhile; ?>
</form>