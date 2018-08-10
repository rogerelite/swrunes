<?php
    require_once 'includes/header.php';
    require_once 'includes/menu_top.php';
?>
Listagem de regiões<br>
<a href="cadastrar_regiao.php">Cadastrar Região</a>

<form action="acoes/exclui_regiao.php" method="post">
    <?php
        $sql = "SELECT * FROM regioes";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
    <hr>
    <input type="hidden" name="idRegiao" value="<?php echo $dados['idRegiao']; ?>"><br>
    Região: <?php echo $dados['Regiao']; ?>
    <a href="editar_regiao.php?idRegiao=<?php echo $dados['idRegiao']; ?>">Editar</a>
    <input type="submit" name="excluir" value="Excluir">
        <?php endwhile; ?>
</form>