package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Registro")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getParameter("url"); 
		String usuario = request.getParameter("usuario"); 
		String clave = request.getParameter("clave"); 
		String nombre = request.getParameter("name"); 
		String apellidos = request.getParameter("apellidos"); 
		String direccion = request.getParameter("domicilio"); 
		String poblacion = request.getParameter("poblacion");
		String provincia = request.getParameter("provincia"); 
		String cp = request.getParameter("cp"); 
		String telefono = request.getParameter("phone"); 
		HttpSession session = request.getSession(true); 

		AccesoBD conexion = AccesoBD.getInstance();
		
		if((usuario!=null) && (clave!=null) && (nombre!=null) && (apellidos!=null) && (direccion!=null) && (poblacion!=null) && (provincia!=null) && (cp!=null) && (telefono!=null))
		{
			if(conexion.comprobarUsuarioBD(usuario, clave)>0){
				session.setAttribute("mensaje","Usuario ya existente");
			}
			else
			{
				if(conexion.registrarseBD(usuario, clave, nombre, apellidos, direccion, poblacion, provincia, cp, telefono)){
					session.setAttribute("mensaje","Usuario registrado correctamente");
			
				}
				else{
					session.setAttribute("mensaje","Error en el registro de usuario");
				}
			}
		}
		response.sendRedirect(url);
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

