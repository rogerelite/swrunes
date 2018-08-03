<?php
	include_once 'includes/header.php';
	include_once 'includes/menu_top.php';
?>
	
Cadastro de monstro

<form action="acoes/cadastrar_monstro.php" method="POST">
	Nome: <input type="text" name="nome" id="nome">
	Atributo: 
	<select name="atributo" id="atributo">
		<?php
			$sql = "SELECT * FROM atribmonstros";
			$result = mysqli_query($connect, $sql);
			while($dados = mysqli_fetch_array($result)):
		?>
		<option value="<?php echo $dados['idAtributo']; ?>">
			<?php echo $dados['Atributo']; ?>
		</option>
		<?php endwhile; ?>
	</select>
	Observação: <input type="text" name="observacao" id="observacao">
	<input type="submit" name="cadastrar" value="Cadastrar" id="cadastrar">
</form>

<?php
	include_once 'includes/footer.php';
?>