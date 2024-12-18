<%@ page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<%
    String returnUrl = request.getParameter("returnUrl");
    if (returnUrl == null || returnUrl.isEmpty()) {
        returnUrl = "productos1.jsp";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

        <%-- Utilizamos una variable en la sesión para informar de los mensajes de Error --%>
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

        <%-- Si no hay usuario o el usuario no es válido --%>
        <%
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null || usuario.getId() <= 0) {
        %>
            <%-- Mostramos el formulario para la introducción del usuario y la clave --%>
            <section class="login-container container">
                <div class="login-form">
                    <h2>Iniciar Sesión</h2>
                    <form id="loginForm" action="./Login" method="post">
                        <input type="hidden" name="returnUrl" value="./login.jsp">
                        <label for="username">Nombre de usuario:</label>
                        <input type="text" id="username" name="username" required>
                        <label for="password">Contraseña:</label>
                        <input type="password" id="password" name="password" required>
                        <button type="submit" class="btn-3">Iniciar Sesión</button>
                    </form>
                    <p class="create-account-text">
                        ¿Todavía no tienes cuenta? <a href="signup.jsp">Crea una cuenta aquí</a>.
                    </p>
                </div>
            </section>
        <%
        } else {
        %>
        <div id="cuerpo">
            <div id="tabla" class="table-responsive">
                <script>
                    document.getElementById("tabla").innerHTML=crearCompraCarrito();
                </script>
            </div>
            <div class="container-fluid mt-3">
                <form method="post" action="./Logout">
                    <input type="hidden" name="url" value="./login.jsp">
                    <input type="button" class="btn-3" value="Continuar comprando" onclick='window.location="./carrito.jsp"'>
                    <input type="button" id="boton-formalizar-compra" class="btn-3" value="Formalizar pedido" onclick="EnviarCarrito('RecogerCarrito','cuerpo',carrito); return false;">

                    <input type="submit" class="btn-3" value="Cerrar sesión">
                </form>
            </div>
        </div>
        <%
        }
        %>
    </div>
</header>

<footer class="footer-container">
    <img class="logo-2" src="images/logo.svg" alt="">
    <div class="links">
        <center>
            <h4>Redes Sociales de la compañía</h4>
            <div class="socials">
                <a href="https://www.facebook.com/?locale=es_ES">
                    <div class="social">
                        <img src="images/s1.svg" alt="">
                    </div>
                </a>
                <a href="https://twitter.com/?lang=es">
                    <div class="social">
                        <img src="images/s2.svg" alt="">
                    </div>
                </a>
                <a href="https://www.instagram.com/?locale=es_ES">
                    <div class="social">
                        <img src="images/s3.svg" alt="">
                    </div>
                </a>
            </div>
        </center>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="js/script.js"></script>
<script src="js/libJson.js"></script>
</body>
</html>
