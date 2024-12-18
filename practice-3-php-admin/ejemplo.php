<?php require_once('base_de_datos.php');?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Consulta a la base de datos</title>
</head>
<body>
    <table>
        <tr>
            <th>Código</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Existencias</th>
            <th>Imagen</th>
        </tr>
        <?php
        $resultados = obtenerProductos();
        while ($fila = mysqli_fetch_row($resultados)) {
            ?>
            <tr>
                <td><?php echo $fila[0];?></td>
                <td><?php echo $fila[1];?></td>
                <td><?php echo $fila[2];?></td>
                <td><?php echo $fila[3];?></td>
                <td><img src="<?php echo $fila[4];?>" alt="Imagen del producto"></td>
            </tr>
            <?php
        }
        ?>
    </table>
</body>
</html>


