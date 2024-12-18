<?php
session_start();
require_once('base_de_datos.php');

if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
    header('Location: ./login.html');
    exit();
}

$bbdd = conectar();

// Cliente que más compra
$query_cliente = "SELECT usuarios.usuario, SUM(pedidos.importe) AS total_comprado
                  FROM pedidos
                  JOIN usuarios ON pedidos.persona = usuarios.codigo
                  GROUP BY usuarios.usuario
                  ORDER BY total_comprado DESC
                  LIMIT 1";
$resultado_cliente = mysqli_query($bbdd, $query_cliente);
$cliente_top = mysqli_fetch_assoc($resultado_cliente);

// Producto más vendido
$query_producto_mas = "SELECT productos.descripcion, SUM(detalle.unidades) AS total_vendido
                       FROM detalle
                       JOIN productos ON detalle.codigo_producto = productos.codigo
                       GROUP BY productos.descripcion
                       ORDER BY total_vendido DESC
                       LIMIT 1";
$resultado_producto_mas = mysqli_query($bbdd, $query_producto_mas);
$producto_top = mysqli_fetch_assoc($resultado_producto_mas);

// Producto menos vendido
$query_producto_menos = "SELECT productos.descripcion, SUM(detalle.unidades) AS total_vendido
                         FROM detalle
                         JOIN productos ON detalle.codigo_producto = productos.codigo
                         GROUP BY productos.descripcion
                         ORDER BY total_vendido ASC
                         LIMIT 1";
$resultado_producto_menos = mysqli_query($bbdd, $query_producto_menos);
$producto_menos = mysqli_fetch_assoc($resultado_producto_menos);

// Organización de ventas por mes
$query_ventas_mes = "SELECT DATE_FORMAT(fecha, '%Y-%m') AS mes, SUM(importe) AS total_ventas
                     FROM pedidos
                     GROUP BY mes
                     ORDER BY mes DESC";
$resultado_ventas_mes = mysqli_query($bbdd, $query_ventas_mes);

desconectar($bbdd);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Administrativo</title>
    <style>
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Dashboard Administrativo</h1>
    <h2>Cliente que más compra</h2>
    <p><?php echo $cliente_top['usuario']; ?> con un total de <?php echo $cliente_top['total_comprado']; ?>€</p>
    
    <h2>Producto más vendido</h2>
    <p><?php echo $producto_top['descripcion']; ?> con un total de <?php echo $producto_top['total_vendido']; ?> unidades vendidas</p>
    
    <h2>Producto menos vendido</h2>
    <p><?php echo $producto_menos['descripcion']; ?> con un total de <?php echo $producto_menos['total_vendido']; ?> unidades vendidas</p>
    
    <h2>Ventas por Mes</h2>
    <table>
        <tr>
            <th>Mes</th>
            <th>Total Ventas (€)</th>
        </tr>
        <?php while ($fila = mysqli_fetch_assoc($resultado_ventas_mes)) { ?>
        <tr>
            <td><?php echo $fila['mes']; ?></td>
            <td><?php echo $fila['total_ventas']; ?></td>
        </tr>
        <?php } ?>
    </table>
</body>
</html>
