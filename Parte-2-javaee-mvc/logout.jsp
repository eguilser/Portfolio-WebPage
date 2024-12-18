<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.List, tienda.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="menu container">
            <a href="index.html" class="logo"></a>
            <input type="checkbox" id="menu" />
            <label for="menu"> <img src="images/menu.png" class="menu-icono" alt=""></label>
            <%-- Solo mostrar el enlace de "Cerrar sesión" si el usuario está autenticado --%>
            <% if (session.getAttribute("usuario") != null) { %>
                <nav class="navbar">
                    <ul>
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="servicios.html">Servicio</a></li>
                        <li><a href="productos1.jsp">Productos</a></li>
                        <li><a href="contacto.html">Contacto</a></li>
                        <li><a href="carrito.jsp">Carrito</a></li>
                        <li>
                            <a href="<%= session.getAttribute("usuario") == null ? "login.jsp" : "javascript:void(0);" %>">Usuario</a>
                            <% if (session.getAttribute("usuario") != null) { %>
                                <ul>
                                    <li><a href="verPedidos.jsp">Ver mis pedidos</a></li>
                                    <li><a href="verDatosPersonales.jsp">Actualizar datos personales</a></li>
                                </ul>
                            <% } %>
                        </li>
                        <% if (session.getAttribute("usuario") != null) { %>
                            <li><a href="Logout">Cerrar sesión</a></li>
                        <% } else { %>
                            <li><a href="login.jsp">Iniciar sesión</a></li>
                        <% } %>
                    </ul>
                </nav>
            <div>
                <ul>
                    <li class="submenu">
                        <img src="images/car.svg" id="img-carrito" alt="">
                        <div id="carrito">
                            <table id="lista-carrito">
                                <thead>
                                    <tr>
                                        <th>Imagen</th>
                                        <th>Nombre</th>
                                        <th>Precio</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <a href="#" id="vaciar-carrito" class="btn-3">Vaciar carrito</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    <%
        // Invalidar la sesión actual
        session.invalidate();
    %>
    <h2>Has abandonado la sesión correctamente.</h2>
    <p>Serás redirigido a la página de inicio de sesión en unos momentos...</p>
    <p>Si no eres redirigido automáticamente, haz clic <a href="login.jsp">aquí</a>.</p>
</body>
</html>
