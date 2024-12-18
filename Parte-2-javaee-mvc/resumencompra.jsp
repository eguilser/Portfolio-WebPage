<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList, tienda.*" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    ArrayList<Producto> carrito = (ArrayList<Producto>) session.getAttribute("carritoJSON");

    if (usuario == null) {
        response.sendRedirect("login.jsp?returnUrl=resumencompra.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resumen de Compra</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="js/script.js"></script>
</head>
<body>
    <header>
        <div class="menu container">
            <a href="index.html" class="logo"></a>
            <input type="checkbox" id="menu" />
            <label for="menu"> <img src="images/menu.png" class="menu-icono" alt=""></label>
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
        </div>

        <%-- Mostrar mensaje de error si existe --%>
        <%
        String mensaje = (String) session.getAttribute("mensaje");

        if (mensaje != null) {
        %>
            <%-- Eliminamos el mensaje consumido --%>
            <%
                session.removeAttribute("mensaje");
            %>
            <h1><%= mensaje %></h1>
        <%
        }
        %>
    </header>

    <main class="container mt-5">
        <h2>Resumen del Pedido</h2>
        <% if (carrito != null && !carrito.isEmpty()) { %>
            <table class="table">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Producto producto : carrito) { %>
                        <tr>
                            <td><%= producto.getCodigo() %></td>
                            <td><%= producto.getDescripcion() %></td>
                            <td><%= producto.getPrecio() %></td>
                            <td><%= producto.getCantidad() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p>No hay productos en el carrito.</p>
        <% } %>
        
        <h3>Datos de Envío</h3>
        <!-- Formulario para datos de envío -->
        <form id="datosEnvioForm" method="post" action="Tramitacion">
            <input type="hidden" name="codigoUsuario" value="<%= usuario.getCodigo() %>">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%= usuario.getNombre() %>" required>
            </div>
            <div class="form-group">
                <label for="apellidos">Apellidos:</label>
                <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%= usuario.getApellidos() %>" required>
            </div>
            <div class="form-group">
                <label for="domicilio">Domicilio:</label>
                <input type="text" class="form-control" id="domicilio" name="domicilio" value="<%= usuario.getDomicilio() %>" required>
            </div>
            <button type="submit" class="btn-3">Confirmar Pedido</button>
        </form>
    </main>
</body>
</html>
