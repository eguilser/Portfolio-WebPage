<?php
session_start();
if (!isset($_SESSION['userid'])) {
    header('Location: login.html');
    exit();
}

include 'base_de_datos.php';

$usuario_id = $_SESSION['userid'];
$conn = conectar();
$stmt = $conn->prepare("SELECT usuario, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono FROM usuarios WHERE codigo=?");
$stmt->bind_param("i", $usuario_id);
$stmt->execute();
$stmt->bind_result($usuario, $nombre, $apellidos, $domicilio, $poblacion, $provincia, $cp, $telefono);
$stmt->fetch();
$stmt->close();
desconectar($conn);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Datos Personales</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Datos Personales</h1>
    <form action="modificar_datos_personales.php" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="<?php echo $nombre; ?>" required><br><br>
        <label for="apellidos">Apellidos:</label>
        <input type="text" id="apellidos" name="apellidos" value="<?php echo $apellidos; ?>" required><br><br>
        <label for="domicilio">Domicilio:</label>
        <input type="text" id="domicilio" name="domicilio" value="<?php echo $domicilio; ?>" required><br><br>
        <label for="poblacion">Población:</label>
        <input type="text" id="poblacion" name="poblacion" value="<?php echo $poblacion; ?>" required><br><br>
        <label for="provincia">Provincia:</label>
        <input type="text" id="provincia" name="provincia" value="<?php echo $provincia; ?>" required><br><br>
        <label for="cp">Código Postal:</label>
        <input type="text" id="cp" name="cp" value="<?php echo $cp; ?>" required><br><br>
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" value="<?php echo $telefono; ?>" required><br><br>
        <input type="submit" value="Guardar cambios">
    </form>
</body>
</html>
