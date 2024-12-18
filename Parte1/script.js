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
}}); 

///////////////////////////////////////////// 2 try

document.addEventListener('DOMContentLoaded', () => {
    const carrito = document.getElementById('carrito');
    const elementos1 = document.getElementById('lista-1');
    const elementos2 = document.getElementById('lista-2');
    const elementos3 = document.getElementById('lista-3');
    const vaciarCarritoBtn = document.getElementById('vaciar-carrito');
    

    cargarEventListeners();

    function cargarEventListeners() {
        if (elementos1) {
            elementos1.addEventListener('click', comprarElemento);
        }
        if (elementos2) {
            elementos2.addEventListener('click', comprarElemento);
        }
        if (elementos3) {
            elementos3.addEventListener('click', comprarElemento);
        }
        carrito.addEventListener('click', eliminarElemento);

        vaciarCarritoBtn.addEventListener('click', vaciarCarrito);
    }

    function comprarElemento(e) {
        e.preventDefault();
        if (e.target.classList.contains('agregar-carrito')) {
            const elemento = e.target.parentElement.parentElement;
            leerDatosElemento(elemento);
        }
    }

    function leerDatosElemento(elemento) {
        const infoElemento = {
            imagen: elemento.querySelector('img').src,
            titulo: elemento.querySelector('h3').textContent,
            precio: elemento.querySelector('.precio').textContent,
            id: elemento.querySelector('a').getAttribute('data-ic')
        }

        insertarCarrito(infoElemento);
    }

    function insertarCarrito(elemento) {
        const lista = document.querySelector('#lista-carrito tbody');
        if (lista) {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>
                    <img src="${elemento.imagen}" width=100>
                </td>

                <td>
                    ${elemento.titulo}
                </td>

                <td> 
                    ${elemento.precio}
                </td>

                <td>
                    <a href="#" class="borrar" data-id="${elemento.id}">X</a>
                </td>
            `;

            console.log('Añadiendo fila al carrito:', row);
            lista.appendChild(row);
        } else {
            console.error('El elemento lista-carrito tbody no fue encontrado en el DOM.');
        }
    }

    function eliminarElemento(e) {
        e.preventDefault();
        if (e.target.classList.contains("borrar")) {
            const elemento = e.target.parentElement.parentElement;
            elemento.remove();
        }
    }

    function vaciarCarrito() {
        const lista = document.querySelector('#lista-carrito tbody');
        while (lista && lista.firstChild) {
            lista.removeChild(lista.firstChild);
        }
        return false;
    }
});





document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signup-form');

    if (loginForm) {
        loginForm.addEventListener('submit', loginUser);
    }

    if (signupForm) {
        signupForm.addEventListener('submit', signupUser);
    }

    function loginUser(e) {
        e.preventDefault();
    
        const email = document.getElementById('username').value;
        const password = document.getElementById('password').value;
    
        const data = new URLSearchParams({
            email: email,
            password: password
        });
    
        fetch('login.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: data.toString(),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            alert(data); // Puedes cambiar esto según tus necesidades
            window.location.href = 'index.html';
        })
        .catch(error => {
            console.error('Error during login:', error);
        });
    }
    
    function signupUser(e) {
        e.preventDefault();
    
        const fullName = document.getElementById('fullName').value;
        const email = document.getElementById('email').value;
        const newUsername = document.getElementById('newUsername').value;
        const newPassword = document.getElementById('newPassword').value;
    
        const data = new URLSearchParams({
            fullName: fullName,
            email: email,
            newUsername: newUsername,
            phone: newPassword,
            newPassword: newPassword
        });
    
        fetch('signup.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: data.toString(),
        })

        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })

        .then(data => {
            alert(data);
            window.location.href = 'index.html';
        })
        .catch(error => {
            console.error('Error during signup, please try again: ', error);
        });
    }

});    


