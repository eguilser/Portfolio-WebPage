<%@ page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<h2>Mis Datos Personales</h2>

<% 
    String success = request.getParameter("success");
    String error = request.getParameter("error");

    if ("true".equals(success)) {
%>
    <div class="alert alert-success" role="alert">
        ¡Tus datos han sido actualizados exitosamente!
    </div>
<%
    } else if ("actualizacion".equals(error)) {
%>
    <div class="alert alert-danger" role="alert">
        Hubo un problema al actualizar tus datos. Por favor, intenta de nuevo.
    </div>
<%
    } else if ("servidor".equals(error)) {
%>
    <div class="alert alert-danger" role="alert">
        Hubo un problema en el servidor. Por favor, intenta de nuevo más tarde.
    </div>
<%
    }
%>

<form action="ActualizarDatosPersonales" method="post">
    <!-- Formulario con los datos personales -->
    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre:</label>
        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= usuario.getNombre() %>">
    </div>
    <div class="mb-3">
        <label for="apellidos" class="form-label">Apellidos:</label>
        <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%= usuario.getApellidos() %>">
    </div>
    <div class="mb-3">
        <label for="domicilio" class="form-label">Domicilio:</label>
        <input type="text" class="form-control" id="domicilio" name="domicilio" value="<%= usuario.getDomicilio() %>">
    </div>
    <div class="mb-3">
        <label for="poblacion" class="form-label">Población:</label>
        <input type="text" class="form-control" id="poblacion" name="poblacion" value="<%= usuario.getPoblacion() %>">
    </div>
    <div class="mb-3">
        <label for="provincia" class="form-label">Provincia:</label>
        <input type="text" class="form-control" id="provincia" name="provincia" value="<%= usuario.getProvincia() %>">
    </div>
    <div class="mb-3">
        <label for="cp" class="form-label">CP:</label>
        <input type="text" class="form-control" id="cp" name="cp" value="<%= usuario.getCp() %>">
    </div>
    <div class="mb-3">
        <label for="telefono" class="form-label">Teléfono:</label>
        <input type="text" class="form-control" id="telefono" name="telefono" value="<%= usuario.getTelefono() %>">
    </div>
    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
</form>
<a href="pedidos.jsp">Ver mis pedidos</a>
<a href="logout.jsp">Cerrar Sesión</body>
</html>
