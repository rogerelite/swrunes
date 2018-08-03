<?php
	include_once 'includes/header.php';
    include_once 'includes/menu_top.php';
    $sql = "SELECT * FROM atribrunas";
    $result = mysqli_query($connect, $sql);
?>

Cadastre a runa

<form action="acoes/cadastra_runa.php" method="post">
    Tipo: 
    <select name="tipo">
        <option></option>
    </select>

    Atributo Principal:
    <select name="atribPrincipal" id="atribPrincipal">
    <?php while($dados = mysqli_fetch_array($result)): ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
    <?php endwhile; ?>
    </select>

    Atributo Secundário:
    <select name="atribSecundario" id="atribSecundario">
    <?php while($dados = mysqli_fetch_array($result)): ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
    <?php endwhile; ?>
    </select>

    Sub-Atributo 1:
    <select name="subAtrib1" id="subAtrib1">
        <?php
        $sql = "SELECT * FROM atribrunas";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
    <?php endwhile; ?>
    </select>

    Sub-Atributo 2:
    <select name="subAtrib2" id="subAtrib2">
        <?php
        $sql = "SELECT * FROM atribrunas";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
    <?php endwhile; ?>
    </select>

    Sub-Atributo 3:
    <select name="subAtrib3" id="subAtrib3">
        <?php
        $sql = "SELECT * FROM atribrunas";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
    <?php endwhile; ?>
    </select>

    Sub-Atributo 4:
    <select name="subAtrib4" id="subAtrib4">
        <?php
        $sql = "SELECT * FROM atribrunas";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
    <?php endwhile; ?>
    </select>

    <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar">
</form>