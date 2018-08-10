<?php
	include_once 'includes/header.php';
	include_once 'includes/menu_top.php';
    $id = $_GET['idRuna'];
?>

Editar runa<br />
<hr>
<?php
$sql = "SELECT r.idRuna AS idRuna,  t.Tipo AS Tipo, m.Nome AS Monstro, r.Slot AS Slot,  atp.Atributo AS AtribPrincipal, atpf.Flat AS Flat, ats.Atributo AS AtribSecundario, atsf.Flat AS Flat, sa1.Atributo AS SubAtrib1, sa1f.Flat AS Flat, sa2.Atributo AS SubAtrib2, sa2f.Flat AS Flat, sa3.Atributo AS SubAtrib3, sa3f.Flat AS Flat, sa4.Atributo AS SubAtrib4, sa4f.Flat AS Flat
FROM runas AS r
JOIN tiposruna AS t ON r.Tipo = t.idTipo
JOIN monstros AS m ON r.Monstro = m.idMonstro
JOIN atribrunas AS atp ON r.AtribPrincipal = atp.idAtributo
JOIN atribrunas AS atpf ON r.AtribPrincipal = atpf.idAtributo
JOIN atribrunas AS ats ON r.AtribSecundario = ats.idAtributo
JOIN atribrunas AS atsf ON r.AtribSecundario = atsf.idAtributo
JOIN atribrunas AS sa1 ON r.SubAtrib1 = sa1.idAtributo
JOIN atribrunas AS sa1f ON r.SubAtrib1 = sa1f.idAtributo
JOIN atribrunas AS sa2 ON r.SubAtrib2 = sa2.idAtributo
JOIN atribrunas AS sa2f ON r.SubAtrib2 = sa2f.idAtributo
JOIN atribrunas AS sa3 ON r.SubAtrib3 = sa3.idAtributo
JOIN atribrunas AS sa3f ON r.SubAtrib3 = sa3f.idAtributo
JOIN atribrunas AS sa4 ON r.SubAtrib4 = sa4.idAtributo
JOIN atribrunas AS sa4f ON r.SubAtrib4 = sa4f.idAtributo
WHERE idRuna = '$id'";

$result = mysqli_query($connect, $sql);
while($dados = mysqli_fetch_array($result)):
    $tipo = $dados['Tipo'];
    $mob = $dados['Monstro'];
    $slot = $dados['Slot'];
    $ap = $dados['AtribPrincipal'];
    $as = $dados['AtribSecundario'];
    $sa1 = $dados['SubAtrib1'];
    $sa2 = $dados['SubAtrib2'];
    $sa3 = $dados['SubAtrib3'];
    $sa4 = $dados['SubAtrib4'];
endwhile;
?>

<form action="acoes/edita_runa.php" method="post">
    <input type="hidden" name="idRuna" value="<?php echo $id; ?>">
    Tipo: 
    <select name="tipo" id="tipo">
        <?php
            $sql = "SELECT idTipo, Tipo FROM tiposruna ORDER BY Tipo != '$tipo'";
            $result = mysqli_query($connect, $sql);
            while($dados = mysqli_fetch_array($result)):
        ?>
        <option value="<?php echo $dados['idTipo']; ?>"><?php echo $dados['Tipo'];?></option>
            <?php endwhile; ?>
    </select>
    <br>
    Monstro a qual vai pertencer:
    <select name="monstro" id="monstro">
        <?php
            $sql = "SELECT idMonstro, Nome FROM monstros ORDER BY Nome != '$mob'";
            $result = mysqli_query($connect, $sql); 
            while($dados = mysqli_fetch_array($result)): 
        ?>
        <option value="<?php echo $dados['idMonstro']; ?>"><?php echo $dados['Nome']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    Slot:
    <select name="slot" id="slot">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
    </select>
    <br>
    Atributo Principal:
    <select name="atribPrincipal" id="atribPrincipal">
        <?php
            $sql = "SELECT * FROM atribrunas ORDER BY Atributo != '$ap'";
            $result = mysqli_query($connect, $sql); 
            while($dados = mysqli_fetch_array($result)): 
        ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    Atributo Secundário:
    <select name="atribSecundario" id="atribSecundario">
        <?php 
            $sql = "SELECT * FROM atribrunas ORDER BY Atributo != '$as'";
            $result = mysqli_query($connect, $sql);
            while($dados = mysqli_fetch_array($result)): 
        ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    Sub-Atributo 1:
    <select name="subAtrib1" id="subAtrib1">
        <?php
            $sql = "SELECT * FROM atribrunas ORDER BY Atributo != '$sa1'";
            $result = mysqli_query($connect, $sql);
            while($dados = mysqli_fetch_array($result)):
        ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    Sub-Atributo 2:
    <select name="subAtrib2" id="subAtrib2">
        <?php
            $sql = "SELECT * FROM atribrunas ORDER BY Atributo != '$sa2'";
            $result = mysqli_query($connect, $sql);
            while($dados = mysqli_fetch_array($result)):
        ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    Sub-Atributo 3:
    <select name="subAtrib3" id="subAtrib3">
        <?php
            $sql = "SELECT * FROM atribrunas ORDER BY Atributo != '$sa3'";
            $result = mysqli_query($connect, $sql);
            while($dados = mysqli_fetch_array($result)):
        ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    Sub-Atributo 4:
    <select name="subAtrib4" id="subAtrib4">
        <?php
            $sql = "SELECT * FROM atribrunas ORDER BY Atributo != '$sa4'";
            $result = mysqli_query($connect, $sql);
            while($dados = mysqli_fetch_array($result)):
        ?>
        <option value="<?php echo $dados['idAtributo']; ?>"><?php echo $dados['Atributo'], $dados['Flat']; ?></option>
        <?php endwhile; ?>
    </select>
    <br>
    <input type="submit" name="editar" id="editar" value="Editar">
</form>
