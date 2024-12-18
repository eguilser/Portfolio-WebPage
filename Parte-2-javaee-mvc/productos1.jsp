<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List, tienda.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos y Carrito</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="js/libJson.js"></script>
    <script src="js/script.js"></script>
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
        <% AccesoBD con = AccesoBD.getInstance();
        List<ProductoBD> productos = con.obtenerProductosBD(); %>
        <div>
        <table>
            <tr>
                <th>Código</th>
                <th>&nbsp;</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>&nbsp;</th>
            </tr>
            <% for (ProductoBD producto : productos) {
                int codigo = producto.getCodigo();
                String descripcion = producto.getDescripcion();
                float precio = producto.getPrecio();
                int existencias = producto.getStock();
                String imagen = producto.getImagen();
            %>
            <tr>
                <td>
                    <%=codigo%>
                </td>
                <td>
                    <img src="<%= request.getContextPath() + "/" + imagen %>" alt="<%=descripcion%>" class="product-image">
                </td>
                <td>
                    <%=descripcion%>
                </td>
                <td>
                    <%=precio%>
                </td>
                <td>
                    <% if (existencias > 0) { %>
                        <input type="button" value="Añadir al carrito"
                        onclick="anadirCarrito('<%=codigo%>', '<%=descripcion%>', '<%=precio%>', '<%=existencias%>')">
                        <% } else { %>
                        <span style="color: red;">Producto no disponible</span>
                        <% } %>
                </td>
            </tr>
            <% } %>
        </table>
    </header>
    <main>
        <div class="container">
            <h3>Carrito</h3>
            <section id="productos"></section>
            <section id="contenido-carrito"></section>
            <div id="precio-total" style="margin-top: 10px; font-weight: bold;"></div>
            <button id="boton-formalizar-compra" onclick="formalizarCompra()">Formalizar Compra</button>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
