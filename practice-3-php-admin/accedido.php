<?php
session_start();
if (!isset($_SESSION['userid'])) {
    header('Location: login.html');
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Administración</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Bienvenido a la Administración</h1>
    <nav>
        <ul>
            <li><a href="datospersonales.php">Datos Personales</a></li>
            <li><a href="listapedidos.php">Pedidos</a></li>
            <li><a href="cerrarsesion.php">Cerrar Sesión</a></li>
        </ul>
    </nav>
</body>
</html>
