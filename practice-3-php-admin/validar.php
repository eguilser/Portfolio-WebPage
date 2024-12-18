<?php
session_start();
require_once('base_de_datos.php');

if (isset($_POST['usuario']) && isset($_POST['clave'])) {
    $usuario = $_POST['usuario'];
    $clave = $_POST['clave'];

    $usuario_data = obtenerUsuario($usuario);

    if ($usuario_data && password_verify($clave, $usuario_data['clave'])) {
        $_SESSION['userid'] = $usuario_data['id'];
        $_SESSION['admin'] = $usuario_data['es_admin'];
        session_regenerate_id(true); // Para evitar fijación de sesión

        if ($usuario_data['es_admin']) {
            header('Location: ./admin_dashboard.php');
        } else {
            header('Location: ./accedido.php');
        }
    } else {
        $_SESSION['error'] = "Usuario o clave incorrectos";
        header('Location: ./login.php');
    }
} else {
    header('Location: ./login.php');
}
exit();
?>
