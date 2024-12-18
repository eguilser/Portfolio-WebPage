<?php

function conectar() {
    $hostname = 'localhost';
    $username = 'root';
    $password = 'rootroot';
    $database = 'tfg';
    $port = '3008';

    $conexion = mysqli_connect($hostname,$username,$password,$database,$port);
    if (mysqli_connect_error()) {
        die('Error de Conexión: ' . mysqli_connect_error());
    }
    return $conexion;
}

function desconectar($conexion) {
    mysqli_close($conexion);
}

function obtenerProductos() {
    $conexion = conectar();
    $consulta = "SELECT * FROM productos";
    $resultado = mysqli_query($conexion, $consulta);
    desconectar($conexion);
    return $resultado;
}

function obtenerUsuario($usuario) {
    $conexion = conectar();
    $stmt = $conexion->prepare("SELECT id, clave, es_admin FROM usuarios WHERE usuario = ?");
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $stmt->bind_result($id, $hash_clave, $es_admin);
    $stmt->fetch();
    $stmt->close();
    desconectar($conexion);
    return array('id' => $id, 'clave' => $hash_clave, 'es_admin' => $es_admin);
}
?>
