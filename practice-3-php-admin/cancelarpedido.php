<?php
session_start();
if (!isset($_SESSION['userid'])) {
    header('Location: login.html');
    exit();
}

include 'base_de_datos.php';

if (isset($_GET['codigo'])) {
    $codigo_pedido = $_GET['codigo'];
    
    $conn = conectar();
    $stmt = $conn->prepare("UPDATE pedidos SET estado=3 WHERE codigo=?");
    $stmt->bind_param("i", $codigo_pedido); // Suponiendo que el estado 3 es el de cancelado
    $stmt->execute();
    $stmt->close();
    desconectar($conn);
}

header('Location: listapedidos.php');
?>
