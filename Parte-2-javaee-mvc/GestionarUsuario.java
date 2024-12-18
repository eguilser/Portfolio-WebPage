package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class GestionarUsuario
 */
@WebServlet("/GestionarUsuario")
public class GestionarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String nombre = request.getParameter("name");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String poblacion = request.getParameter("poblacion");
        String provincia= request.getParameter("provincia");
        String cp = request.getParameter("cp");
        String telefono = request.getParameter("telefono");

        HttpSession sesion = request.getSession(true);

        AccesoBD con = AccesoBD.getInstance();

        if((usuario != null) && (clave!=null) && (nombre!=null) && (apellidos!=null) &&  (direccion!=null) && (poblacion!=null) && (provincia!=null) && (cp!=null) && (telefono!=null)){
            UsuarioBD user = new UsuarioBD();
            String idUsuario = (String) sesion.getAttribute("usuario").toString();
            user.setCodigo(Integer.parseInt(idUsuario));
            user.setUsuario(usuario);
            user.setClave(clave);
            user.setNombre(nombre);
            user.setApellidos(apellidos);
            user.setDomicilio(direccion);
            user.setProvincia(provincia);
            user.setPoblacion(poblacion);
            user.setCp(cp);
            user.setTelefono(telefono);
            if(con.modificarUsuario(user)){
                sesion.setAttribute("mensaje","Usuario modificado");
            }
        }
        else{
            sesion.setAttribute("mensaje","Error al actualizar los datos");
        }

        response.sendRedirect("./html/loginTienda.jsp");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
