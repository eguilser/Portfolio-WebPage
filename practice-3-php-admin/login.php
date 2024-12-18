<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
</head>
<body>

<?php
session_start();
if (isset($SESSION['error'])) {
  echo '<h1>' + $SESSION['error'] + '</h1>';
  unset($SESSION['error']);
}
?>
  <form method="post" action="validar.php">
    <label for="usuario">Usuario:</label>
    <input type="text" id="usuario" name="usuario" required>
    <br>
    <label for="clave">Clave:</label>
    <input type="password" id="clave" name="clave" required>
    <br>
    <input type="submit" value="Acceder">
  </form>
</body>
</html>