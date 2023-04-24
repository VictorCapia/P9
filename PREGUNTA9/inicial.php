<?php

include "conexion.php";
$pdo=new conexion();

switch($_SERVER['REQUEST_METHOD']){
	case 'GET':
		if(isset($_GET['ci'])){
			$sqls = "SELECT * FROM PERSONA WHERE ci=:ci";
			$sql = $pdo->prepare($sqls);
			$sql->bindValue(':ci', $_GET['ci']);
			$sql->execute();
			$sql->setFetchMode(PDO::FETCH_ASSOC);
			header("HTTP/1.1 200 Tengo datos");
			echo json_encode($sql->fetchAll());
			exit;
		}else{
			$sqls="SELECT * FROM PERSONA";
			$sql = $pdo->prepare($sqls);
			$sql->execute();
			$sql->setFetchMode(PDO::FETCH_ASSOC);
			header("HTTP/1.1 200 Tengo datos");
			echo json_encode($sql->fetchAll());
			exit;	
		}
		break;
		
	case 'POST':
		$sqls = "INSERT INTO PERSONA (ci, nombre_completo, fecha_de_nacimiento, telefono, departamento) VALUES (:ci, :nombre_completo, :fecha_de_nacimiento, :telefono, :departamento)";
		//$sql =  $pdo->prepare("INSERT INTO PERSONA (ci, nombre_completo, fecha_de_nacimiento, 
		//telefono, departamento) VALUES (:ci, :nombre_completo, :fecha_de_nacimiento, :telefono, :departamento)");
		$sql = $pdo->prepare($sqls);

		$sql->bindValue(':ci', $_POST['ci']);
		$sql->bindValue(':nombre_completo', $_POST['nombre_completo']);
		$sql->bindValue(':fecha_de_nacimiento', $_POST['fecha_de_nacimiento']);
		$sql->bindValue(':telefono', $_POST['telefono']);
		$sql->bindValue(':departamento', $_POST['departamento']);
		$sql->execute();
	
		if ($sql -> execute()){
			header("HTTP/1.1 200 INSERTADO");
		}else{
			echo $sql->errorInfo()[2];
		}

		exit;
		break;

	case 'PUT':
		$sql = $pdo->prepare("UPDATE PERSONA set ci=:ci,nombre_completo=:nombre_completo,fecha_de_nacimiento=:fecha_de_nacimiento, 
		telefono=:telefono, departamento=:departamento WHERE ci=:ci");
		$sql->bindValue(':ci', $_GET['ci']);
		$sql->bindValue(':nombre_completo', $_GET['nombre_completo']);
		$sql->bindValue(':fecha_de_nacimiento', $_GET['fecha_de_nacimiento']);
		$sql->bindValue(':telefono', $_GET['telefono']);
		$sql->bindValue(':departamento', $_GET['departamento']);
		//$sql->bindValue(':id', $_GET['id']);
		$sql->execute();
		header("HTTP/1.1 200 ACTUALIZADO");
		exit;
		break;

	case 'DELETE':
		$sql = $pdo->prepare("DELETE FROM PERSONA WHERE ci=:ci");
		$sql->bindValue(':ci', $_GET['ci']);
		$sql->execute();
		header("HTTP/1.1 200 ELIMINADO");
		exit;
		break;
		
}

?>