<%@ page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="header">
        <div class="menu container">
            <a href="index.jsp" class="logo"></a>
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
        <div class="header-content container">
            <div class="swiper mySwiper-1">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="header-info">
                            <div class="header-txt">
                                <h1>Auriculares premium - Versión 1</h1>
                                <div class="prices">
                                    <p class="price-1">$199</p>
                                    <p class="price-2">$150</p>
                                </div>
                                <a href="info1.html" class="btn-1">Información</a>
                            </div>
                            <div class="header-img">
                                <img src="images/bg1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="header-info">
                            <div class="header-txt">
                                <h1>Auriculares premium - Versión 2</h1>
                                <div class="prices">
                                    <p class="price-1">$199</p>
                                    <p class="price-2">$150</p>
                                </div>
                                <a href="info2.html" class="btn-1">Información</a>
                            </div>
                            <div class="header-img">
                                <img src="images/bg2.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="header-info">
                            <div class="header-txt">
                                <h1>Auriculares premium - Versión 3</h1>
                                <div class="prices">
                                    <p class="price-1">$199</p>
                                    <p class="price-2">$150</p>
                                </div>
                                <a href="info3.html" class="btn-1">Información</a>
                            </div>
                            <div class="header-img">
                                <img src="images/bg3.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </header>
    <hr>
    <section class="promos container" id="lista-1">
        <h2>Promociones</h2>
        <div class="categories">
            <div class="categorie">
                <div class="categorie-1">
                    <h3>Promo 1</h3>
                    <div class="prices">
                        <p class="price-1">$199</p>
                        <p class="precio">$150</p>
                    </div>
                </div>
                <div class="categorie-img">
                    <img src="images/ph1.png" alt="">
                </div>
            </div>
            <div class="categorie">
                <div class="categorie-1">
                    <h3>Promo 2</h3>
                    <div class="prices">
                        <p class="price-1">$199</p>
                        <p class="precio">$150</p>
                    </div>
                </div>
                <div class="categorie-img">
                    <img src="images/ph2.png" alt="">
                </div>
            </div>
            <div class="categorie">
                <div class="categorie-1">
                    <h3>Promo 3</h3>
                    <div class="prices">
                        <p class="price-1">$199</p>
                        <p class="precio">$150</p>
                    </div>
                </div>
                <div class="categorie-img">
                    <img src="images/ph3.png" alt="">
                </div>
            </div>
            <div class="categorie">
                <div class="categorie-1">
                    <h3>Promo 4</h3>
                    <div class="prices">
                        <p class="price-1">$199</p>
                        <p class="precio">$150</p>
                    </div>
                </div>
                <div class="categorie-img">
                    <img src="images/ph4.png" alt="">
                </div>
            </div>
        </div>
    </section>
    <hr>
     <section class="products container" id="lista-2">

                <h2>Nuevos Productos</h2>

                <div class="swiper mySwiper-2">
                    
                    <div class="swiper-wrapper">

                        <div class="swiper-slide">
                            
                            <div class="product">
                                <img src="images/ph1.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="5">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                        <div class="swiper-slide">

                            <div class="product">
                                <img src="images/ph2.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="6">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                        <div class="swiper-slide">

                            <div class="product">
                                <img src="images/ph3.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="7">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                        <div class="swiper-slide">

                            <div class="product">
                                <img src="images/ph4.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="8">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </section>

            <hr>

            <section class="products container" id="lista-2">

                <h2>Productos</h2>

                <div class="swiper mySwiper-2">
                    
                    <div class="swiper-wrapper">

                        <div class="swiper-slide">
                            
                            <div class="product">
                                <img src="images/ph1.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="9">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                        <div class="swiper-slide">

                            <div class="product">
                                <img src="images/ph2.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="10">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                        <div class="swiper-slide">

                            <div class="product">
                                <img src="images/ph3.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="11">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                        <div class="swiper-slide">

                            <div class="product">
                                <img src="images/ph4.png" alt="">
                                <div class="product-txt">
                                    <h3>Elisyum</h3>
                                    <p>Calidad premium</p>
                                    <p class="precio">$200</p>
                                    <a href="#" class="agregar-carrito btn-3" data-id="12">Agregar al carrito</a>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </section>
    <hr>
    <section class="products container" id="lista-2">

        <h2>Nuevos Productos</h2>

        <div class="swiper mySwiper-2">
            
            <div class="swiper-wrapper">

                <div class="swiper-slide">
                    
                    <div class="product">
                        <img src="images/ph1.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="5">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide">

                    <div class="product">
                        <img src="images/ph2.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="6">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide">

                    <div class="product">
                        <img src="images/ph3.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="7">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide">

                    <div class="product">
                        <img src="images/ph4.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="8">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </section>

    <hr>

    <section class="products container" id="lista-2">

        <h2>Productos</h2>

        <div class="swiper mySwiper-2">
            
            <div class="swiper-wrapper">

                <div class="swiper-slide">
                    
                    <div class="product">
                        <img src="images/ph1.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="9">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide">

                    <div class="product">
                        <img src="images/ph2.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="10">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide">

                    <div class="product">
                        <img src="images/ph3.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="11">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-slide">

                    <div class="product">
                        <img src="images/ph4.png" alt="">
                        <div class="product-txt">
                            <h3>Elisyum</h3>
                            <p>Calidad premium</p>
                            <p class="precio">$200</p>
                            <a href="#" class="agregar-carrito btn-3" data-id="12">Agregar al carrito</a>
                        </div>
                    </div>

                </div>

            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </section>
    <!-- Fin de productos -->
     
    <footer class="footer-container">
        <div class="links">
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
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
