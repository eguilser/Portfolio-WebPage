<%@ page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header class="header">
    <div class="menu container">
        <a href="index.jsp" class="logo"></a>
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
    <div class="header-content container">
        <div class="swiper mySwiper-1">
            <div class="swiper-wrapper">
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>

    <section class="signup-container container">
        <div class="signup-form">
            <h2>Registro</h2>
            <form id="signupForm" action="./Signup" method="post">
                <label for="username">Nombre de usuario:</label>
                <input type="text" id="username" name="username" required>
                <label for="email">Correo electrónico:</label>
                <input type="email" id="email" name="email" required>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                <label for="confirmPassword">Confirmar contraseña:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <!-- Campos adicionales necesarios para la base de datos -->
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" required>
                <label for="domicilio">Domicilio:</label>
                <input type="text" id="domicilio" name="domicilio" required>
                <label for="poblacion">Población:</label>
                <input type="text" id="poblacion" name="poblacion" required>
                <label for="provincia">Provincia:</label>
                <input type="text" id="provincia" name="provincia" required>
                <label for="cp">Código Postal:</label>
                <input type="text" id="cp" name="cp" required>
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" required>
                <button type="submit" class="btn-3">Registrarse</button>
            </form>
            <p class="login-text">
                ¿Ya tienes cuenta? <a href="login.jsp">Iniciar sesión aquí</a>.
            </p>
        </div>
    </section>

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
</body>
</html>
