package tienda;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RealizarPedido
 */
@WebServlet("/RealizarPedido")
public class RealizarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
		HttpSession sesion = request.getSession(true);
		AccesoBD con = AccesoBD.getInstance();
		String usuario = sesion.getAttribute("usuario").toString();
		
		PedidoDatos pedido = new PedidoDatos();
		Date fecha = new Date();
		
		java.sql.Date fecha2 = new java.sql.Date(fecha.getTime());

	    float importe = 0.0f;
	    List<Producto> producto = null;
		Object carritoCompra = sesion.getAttribute("carritoCompra");
		if  (carritoCompra instanceof List<?>){
			producto = (List<Producto>) carritoCompra;
			}else {
				sesion.setAttribute("mensaje", "Pedido realizado correcamente!");
			}

	    for (Producto prod : producto) {
	    	importe += (prod.getPrecio() * prod.getCantidad());
	    }
		
		int estado=1;
		
		pedido.setPersona(Integer.valueOf(usuario));
	    pedido.setFecha(fecha2);
	    pedido.setImporte(importe);
	    pedido.setEstado(estado);
	    	    
	    if(con.almacenarPedido(pedido,producto))
	    {
	    	sesion.setAttribute("total", importe);
	    	sesion.setAttribute("mensaje", "Pedido realizado correcamente!");
	    	response.sendRedirect("./html/loginTienda.jsp");
	    }
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

