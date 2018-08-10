<?php
	include_once 'includes/header.php';
	include_once 'includes/menu_top.php';
?>

Listagem de runas<br />
<a href="cadastrar_runa.php">Cadastrar runa</a>

<form action="acoes/exclui_runa.php" method="post">
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
        JOIN atribrunas AS sa4f ON r.SubAtrib4 = sa4f.idAtributo";
        $result = mysqli_query($connect, $sql);
        while($dados = mysqli_fetch_array($result)):
    ?>
    <hr>
    
    <input type="hidden" name="idRuna" value="<?php echo $dados['idRuna']; ?>"><br>
    <input type="hidden" name="Tipo" value="<?php echo $dados['Tipo']; ?>"><br>
    Runa: <?php echo $dados['Tipo']; ?><br>
    Monstro: <?php echo $dados['Monstro']; ?><br>
    Atributo Principal: <?php echo $dados['AtribPrincipal']; ?><?php echo $dados['Flat']; ?><br>
    Atributo Secundário: <?php echo $dados['AtribSecundario']; ?><?php echo $dados['Flat']; ?><br>
    Sub-Atributo 1: <?php echo $dados['SubAtrib1']; ?><?php echo $dados['Flat']; ?><br>
    Sub-Atributo 2: <?php echo $dados['SubAtrib2']; ?><?php echo $dados['Flat']; ?><br>
    Sub-Atributo 3: <?php echo $dados['SubAtrib3']; ?><?php echo $dados['Flat']; ?><br>
    Sub-Atributo 4: <?php echo $dados['SubAtrib4']; ?><?php echo $dados['Flat']; ?><br>
    <a href="editar_runa.php?idRuna=<?php echo $dados['idRuna']; ?>&Monstro=<?php echo $dados['Monstro']; ?>">Editar</a>
    <input type="submit" name="excluir" value="Excluir">
    <?php endwhile; ?>
</form>