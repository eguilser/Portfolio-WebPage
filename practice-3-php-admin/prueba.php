<?php
$hostname = 'localhost';
$username = 'root';
$password = 'rootroot';
$database = 'tgf';

$conexion = mysqli_connect($hostname, $username, $password, $database);

if (!$conexion) {
    die('Error de Conexión: ' . mysqli_connect_error());
}

echo 'Conexión exitosa';

mysqli_close($conexion);
?>
