var swiper = new Swiper(".mySwiper-1", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    }
});

var swiper = new Swiper(".mySwiper-2", {
    slidesPerView: 3,
    spaceBetween: 30,
    loop: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    },
    breakpoints: {
        0: {
            slidesPerView: 1
        },
        520: {
            slidesPerView: 2
        },
        950: {
            slidesPerView: 3
        }
    }
});

var carrito = [];

// Función para cargar el carrito desde localStorage
function cargarCarrito() {
    var carritoGuardado = localStorage.getItem('carrito');
    if (carritoGuardado) {
        carrito = JSON.parse(carritoGuardado);
    } else {
        carrito = [];
    }

    // Verificar que carrito sea un array
    if (!Array.isArray(carrito)) {
        carrito = [];
    }
}

// Función para guardar el carrito en localStorage
function guardarCarrito() {
    localStorage.setItem("carrito", JSON.stringify(carrito));
    console.log("Carrito guardado: ", carrito);
}

/* Una función que compruebe si un producto ya existe en el listado de productos del carrito y, en caso afirmativo,
   aumente el valor de su cantidad, mientras que en caso negativo se debe insertar ese nuevo producto en el carrito */
function anadirCarrito(codigo, descripcion, precio, existencias) {
    var encontrado = false;
    
    cargarCarrito(); // Asegurar que el carrito está actualizado antes de añadir

    for (var i = 0; i < carrito.length; i++) {
        if (carrito[i].codigo === parseInt(codigo)) {
            carrito[i].cantidad++;
            encontrado = true;
            break;
        }
    }
    
    if (!encontrado) {
        var producto = {codigo: parseInt(codigo), descripcion: descripcion, cantidad: 1, precio: parseFloat(precio)};
        carrito.push(producto);
        alert("El producto ha sido añadido al carrito correctamente.");
    }
    guardarCarrito();
    actualizarCarrito(); // Actualizar el carrito en el DOM
    mostrarMensaje("Producto añadido al carrito.");
}

function actualizarCarrito() {
    var contenidoCarrito = document.getElementById('contenido-carrito');
    if (!contenidoCarrito) {
        console.error('El elemento con id "contenido-carrito" no fue encontrado en el DOM.');
        return;
    }
    contenidoCarrito.innerHTML = '';

    if (carrito.length === 0) {
        contenidoCarrito.innerHTML = '<p>El carrito está vacío.</p>';
        return;
    }

    var tabla = document.createElement('table');
    var encabezado = tabla.insertRow();
    encabezado.insertCell().textContent = 'Producto';
    encabezado.insertCell().textContent = 'Cantidad';
    encabezado.insertCell().textContent = 'Precio';

    var totalCarrito = 0;

    for (var i = 0; i < carrito.length; i++) {
        if (carrito[i] && typeof carrito[i] === 'object') {
            var fila = tabla.insertRow();
            fila.insertCell().textContent = carrito[i].descripcion;
            fila.insertCell().textContent = carrito[i].cantidad;
            var precioTotalProducto = carrito[i].cantidad * carrito[i].precio;
            fila.insertCell().textContent = precioTotalProducto.toFixed(2); // Precio total del producto

            totalCarrito += precioTotalProducto;

            var eliminarCelda = fila.insertCell();
            var botonEliminar = document.createElement('button');
            botonEliminar.textContent = 'Eliminar';
            botonEliminar.setAttribute('data-index', i);
            botonEliminar.addEventListener('click', function(event) {
                var index = event.target.getAttribute('data-index');
                carrito.splice(index, 1);
                guardarCarrito();
                actualizarCarrito();
            });
            eliminarCelda.appendChild(botonEliminar);
        } else {
            console.error(`Elemento no válido en el carrito en la posición ${i}`, carrito[i]);
        }
    }

    // Añadir la fila para el total del carrito
    var filaTotal = tabla.insertRow();
    filaTotal.insertCell().textContent = 'Total:';
    filaTotal.insertCell();
    filaTotal.insertCell().textContent = totalCarrito.toFixed(2);
    filaTotal.insertCell(); // Celda vacía para mantener el diseño

    contenidoCarrito.appendChild(tabla);
}


function formalizarCompra() {
    cargarCarrito(); // Asegurarse de que el carrito esté cargado desde localStorage

    // Verificar si el carrito está vacío
    if (carrito.length === 0) {
        console.error('No se puede formalizar la compra porque el carrito está vacío');
        alert('No se puede formalizar la compra porque el carrito está vacío');
        return;
    }

    // Verificar si el usuario ha iniciado sesión
    var usuario = '<%= session.getAttribute("usuario") %>';
    if (usuario == 'null' || usuario == '') {
        window.location.href = 'login.jsp?returnUrl=productos1.jsp';
    } else {
        EnviarCarrito('RecogerCarrito', 'contenido-carrito', carrito);
    }
}

// Mostrar un mensaje temporal en la página
function mostrarMensaje(mensaje) {
    var mensajeDiv = document.createElement('div');
    mensajeDiv.textContent = mensaje;
    mensajeDiv.className = 'mensaje-flotante';
    document.body.appendChild(mensajeDiv);
    setTimeout(function() {
        mensajeDiv.remove();
    }, 3000);
}

// Función para vaciar el carrito
function vaciarCarrito() {
    carrito = [];
    guardarCarrito();
    actualizarCarrito();
}

// Asegúrate de tener un botón con id 'boton-formalizar-compra'
document.addEventListener('DOMContentLoaded', () => {
    cargarCarrito();
    actualizarCarrito();
    const botonFormalizarCompra = document.getElementById('boton-formalizar-compra');
    if (botonFormalizarCompra) {
        botonFormalizarCompra.addEventListener('click', formalizarCompra);
    } else {
        console.error('El elemento con id "boton-formalizar-compra" no fue encontrado en el DOM.');
    }

    const botonVaciarCarrito = document.getElementById('vaciar-carrito');
    if (botonVaciarCarrito) {
        botonVaciarCarrito.addEventListener('click', vaciarCarrito);
    } else {
        console.error('El elemento con id "vaciar-carrito" no fue encontrado en el DOM.');
    }
});
