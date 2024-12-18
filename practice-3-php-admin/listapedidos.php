<?php
session_start();
if (!isset($_SESSION['userid'])) {
    header('Location: login.html');
    exit();
}

include 'base_de_datos.php';

    $usuario_id = $_SESSION['userid'];
    $conn = conectar();
    $stmt = $conn->prepare("SELECT p.codigo, p.fecha, p.importe, e.descripcion FROM pedidos p JOIN estados e ON p.estado=e.codigo WHERE p.persona=?");
    $stmt->bind_param("i", $usuario_id);
    $stmt->execute();
    $stmt->bind_result($codigo, $fecha, $importe, $estado);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Lista de Pedidos</title>
    <meta charset="UTF-8">
</head>
    <body>
        <h1>Lista de Pedidos</h1>
            <table>
                <tr>
                    <th>Código</th>
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
                <?php while ($stmt->fetch()): ?>
                <tr>
                    <td><?php echo $codigo; ?></td>
                    <td><?php echo $fecha; ?></td>
                    <td><?php echo $importe; ?></td>
                    <td><?php echo $estado; ?></td>
                    <td><a href="cancelarpedido.php?codigo=<?php echo $codigo; ?>">Cancelar</a></td>
                </tr>
                <?php endwhile; ?>
            </table>
    <?php
    $stmt->close();
    desconectar($conn);
    ?>
</body>
</html>
