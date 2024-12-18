package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Pedido extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException {
	String url = request.getParameter("url"); // URL a la que debemos volver
	String usuario = request.getParameter("usuario"); // Nombre del usuario
	String clave = request.getParameter("clave"); // Clave
	HttpSession session = request.getSession(true); // Accedemos al entorno de sesi�n
	AccesoBD con = AccesoBD.getInstance();
	if ((usuario != null) && (clave != null)) {
	int codigo = con.comprobarUsuarioBD(usuario,clave);
	if (codigo>0) {
	session.setAttribute("usuario",codigo);
	}
	else {
	session.setAttribute("mensaje","Usuario y/o clave incorrectos");
	}
	}
	response.sendRedirect(url);
	}

}

