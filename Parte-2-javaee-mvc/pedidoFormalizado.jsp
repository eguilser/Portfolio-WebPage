<%@ page language="java" contentType="text/html;charset=UTF-8" import="tienda.*, java.util.List" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedido Formalizado</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="header">
        <div class="menu container">
            <a href="index.html" class="logo"></a>
            <input type="checkbox" id="menu" />
            <label for="menu"><img src="images/menu.png" class="menu-icono" alt=""></label>
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
    
        <section class="container mt-5">
            <h1>Pedido Formalizado</h1>
            <p>Tu pedido ha sido registrado con éxito. ¡Gracias por tu compra!</p>
            <a href="productos1.jsp" class="btn btn-primary">Seguir Comprando</a>
        </section>
    </header>

        <section class="container mt-5">
            <h2>Productos Sugeridos</h2>
            <div class="swiper-container mySwiper">
                <div class="swiper-wrapper">
                    <% 
                        AccesoBD con = AccesoBD.getInstance();
                        List<ProductoBD> productosSugeridos = con.obtenerProductosSugeridos();
                        for (ProductoBD producto : productosSugeridos) { 
                    %>
                        <div class="swiper-slide">
                            <div class="product">
                                <img src="<%= producto.getImagen() %>" alt="<%= producto.getDescripcion() %>">
                                <div class="product-txt">
                                    <h3><%= producto.getDescripcion() %></h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">€<%= producto.getPrecio() %></p>
                                    <a href="producto.jsp?codigo=<%= producto.getCodigo() %>" class="btn btn-primary">Ver Productos</a>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
                <!-- Add Navigation -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </section>

    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
