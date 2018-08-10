<?php
    require_once 'includes/header.php';
    require_once 'includes/menu_top.php';
    $id = $_GET['idRegiao'];
?>

Editar região
<hr>
<?php
    $sql = "SELECT * FROM regioes WHERE idRegiao = '$id'";

    $result = mysqli_query($connect, $sql);
    while($dados = mysqli_fetch_array($result)):
        $regiao = $dados['Regiao'];
?>

<form action="acoes/edita_regiao.php" method="post">
<input type="hidden" name="idRegiao" id="idRegiao" value="<?php echo $dados['idRegiao']; ?>">
    Região: <input type="text" name="regiao" id="regiao" value="<?php echo $dados['Regiao']; ?>">
    <input type="submit" name="editar" id="editar" value="Editar">
</form>

<?php endwhile; ?>