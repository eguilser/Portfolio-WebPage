<?php
session_start();
if (!isset($_SESSION['userid'])) {
    header('Location: login.html');
    exit();
}

include 'base_de_datos.php';

$usuario_id = $_SESSION['userid'];
$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$domicilio = $_POST['domicilio'];
$poblacion = $_POST['poblacion'];
$provincia = $_POST['provincia'];
$cp = $_POST['cp'];
$telefono = $_POST['telefono'];

$conn = conectar();
$stmt = $conn->prepare("UPDATE usuarios SET nombre=?, apellidos=?, domicilio=?, poblacion=?, provincia=?, cp=?, telefono=? WHERE codigo=?");
$stmt->bind_param("sssssssi", $nombre, $apellidos, $domicilio, $poblacion, $provincia, $cp, $telefono, $usuario_id);
$stmt->execute();
$stmt->close();
desconectar($conn);

header('Location: datospersonales.php');
?>
