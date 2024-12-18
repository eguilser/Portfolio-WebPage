package tienda;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public final class AccesoBD {
	private static AccesoBD instanciaUnica = null;
	private Connection conexionBD = null;
	private int codigo;
    private String descripcion;
    private float precio;
    private int stock;
    private String imagen;


	public static AccesoBD getInstanciaUnica() {
		return instanciaUnica;
	}

	public Connection getConexionBD() {
		return conexionBD;
	}

	public static AccesoBD getInstance(){
		if (instanciaUnica == null){
		instanciaUnica = new AccesoBD();
		}
		return instanciaUnica;
	}

	public static void setInstanciaUnica(AccesoBD instanciaUnica) {
		AccesoBD.instanciaUnica = instanciaUnica;
	}

	public void setConexionBD(Connection conexionBD) {
		this.conexionBD = conexionBD;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	private AccesoBD() {

		abrirConexionBD();

	}

	public void abrirConexionBD() {

	if (conexionBD == null)
		{
			String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
			String DB_URL = "jdbc:mariadb://localhost:3008/tfg";
			
			String USER = "root";
			String PASS = "rootroot";
		try {
		Class.forName(JDBC_DRIVER);
		conexionBD = DriverManager.getConnection(DB_URL,USER,PASS);
		}
		catch(Exception e) {
			System.err.println("No se ha podido conectar a la base de datos");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	}
	public boolean comprobarAcceso() {

		abrirConexionBD();
		return (conexionBD != null);
	}
	public List<ProductoBD> obtenerProductosBD() {
		abrirConexionBD();
		ArrayList<ProductoBD> productos = new ArrayList<>();
		try {
				// hay que tener en cuenta las columnas de la tabla de productos
				String con = "SELECT codigo,descripcion,precio,existencias,imagen FROM productos";
				Statement s = conexionBD.createStatement();
				ResultSet resultado = s.executeQuery(con);
				while(resultado.next()){
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(resultado.getInt("codigo"));
				producto.setDescripcion(resultado.getString("descripcion"));
				producto.setPrecio(resultado.getFloat("precio"));
				producto.setStock(resultado.getInt("existencias"));
				producto.setImagen(resultado.getString("imagen"));
				productos.add(producto);
				}
	}catch(Exception e) {

	System.err.println("Error ejecutando la consulta a la base de datos");
	System.err.println(e.getMessage());
	
	}

	return productos;
}

	/////////////
	public boolean almacenarPedido(PedidoDatos pedido, List<Producto> productos) {
    abrirConexionBD();
    if (conexionBD != null) {
        try {
            // Insertar el pedido en la tabla 'pedidos'
            String sqlInsertPedido = "INSERT INTO pedidos (id_usuario, fecha, importe, id_estado) VALUES (?, ?, ?, ?)";
            PreparedStatement statementPedido = conexionBD.prepareStatement(sqlInsertPedido, Statement.RETURN_GENERATED_KEYS);
            statementPedido.setInt(1, pedido.getPersona());
            statementPedido.setDate(2, pedido.getFecha());
            statementPedido.setFloat(3, pedido.getImporte());
            statementPedido.setInt(4, pedido.getEstado());
            statementPedido.executeUpdate();

            // Obtener el ID del pedido recién insertado
            ResultSet generatedKeys = statementPedido.getGeneratedKeys();
            int idPedido = -1;
            if (generatedKeys.next()) {
                idPedido = generatedKeys.getInt(1);
            }

            // Si se pudo obtener el ID del pedido, insertar los productos del pedido en la tabla 'detalle'
            if (idPedido != -1) {
                String sqlInsertDetalle = "INSERT INTO detalle (codigo_pedido, codigo_producto, unidades, precio) VALUES (?, ?, ?, ?)";
                PreparedStatement statementDetalle = conexionBD.prepareStatement(sqlInsertDetalle);
                for (Producto producto : productos) {
                    statementDetalle.setInt(1, idPedido);
                    statementDetalle.setInt(2, producto.getId());
                    statementDetalle.setInt(3, producto.getCantidad());
                    statementDetalle.setFloat(4, producto.getPrecio());
                    statementDetalle.executeUpdate();
                }
            } else {
                System.err.println("Error: No se pudo obtener el ID del pedido.");
                return false;
            }

            return true; // Retorna true si el almacenamiento fue exitoso
        } catch (SQLException e) {
            System.err.println("Error al almacenar el pedido en la base de datos");
            e.printStackTrace();
        }
    }
    return false; // Retorna false si no se pudo almacenar el pedido
}
///chat
public int comprobarUsuarioBD(String usuario, String clave) {
	abrirConexionBD();
	int codigo = -1; // Por defecto, asumimos que el usuario no es válido
	if (conexionBD != null) {
		try {
			// Consulta SQL para comprobar el usuario en la base de datos
			String sql = "SELECT codigo FROM usuarios WHERE nombre_usuario = ? AND clave = ?";
			PreparedStatement statement = conexionBD.prepareStatement(sql);
			statement.setString(1, usuario);
			statement.setString(2, clave);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				// Si se encuentra el usuario en la base de datos, obtenemos su código
				codigo = result.getInt("codigo");
			}
		} catch (SQLException e) {
			System.err.println("Error al comprobar el usuario en la base de datos");
			e.printStackTrace();
		}
	}
	return codigo;
}
///chat
public boolean cancelar(int codigoPedido) {
	abrirConexionBD();
	if (conexionBD != null) {
		try {
			// Realiza la lógica para cancelar el pedido en la base de datos
			String sql = "UPDATE pedidos SET estado = 2 WHERE codigo = ?";
			PreparedStatement statement = conexionBD.prepareStatement(sql);
			statement.setInt(1, codigoPedido);
			int rowsAffected = statement.executeUpdate();
			return rowsAffected > 0; // Retorna true si se canceló correctamente
		} catch (SQLException e) {
			System.err.println("Error al cancelar el pedido en la base de datos");
			e.printStackTrace();
		}
	}
	return false; // Retorna false si no se pudo cancelar el pedido
}

public boolean modificarUsuario(UsuarioBD usuario) {
	abrirConexionBD();
	if (conexionBD != null) {
		try {
			// Consulta SQL para modificar el usuario en la base de datos
			String sql = "UPDATE usuarios SET usuario = ?, clave = ?, nombre = ?, apellidos = ?, direccion = ?, poblacion = ?, provincia = ?, cp = ?, telefono = ? WHERE codigo = ?";
			PreparedStatement statement = conexionBD.prepareStatement(sql);
			statement.setString(1, usuario.getUsuario());
			statement.setString(2, usuario.getClave());
			statement.setString(3, usuario.getNombre());
			statement.setString(4, usuario.getApellidos());
			statement.setString(5, usuario.getDomicilio());
			statement.setString(6, usuario.getPoblacion());
			statement.setString(7, usuario.getProvincia());
			statement.setString(8, usuario.getCp());
			statement.setString(9, usuario.getTelefono());
			statement.setInt(10, usuario.getCodigo());
			
			int rowsAffected = statement.executeUpdate();
			return rowsAffected > 0; // Retorna true si se modificó correctamente
		} catch (SQLException e) {
			System.err.println("Error al modificar el usuario en la base de datos");
			e.printStackTrace();
		}
	}
	return false; // Retorna false si no se pudo modificar el usuario
}

public boolean registrarseBD(String usuario, String clave, String nombre, String apellidos, String direccion, String poblacion, String provincia, String cp, String telefono) {
	abrirConexionBD();
	if (conexionBD != null) {
		try {
			// Consulta SQL para insertar un nuevo usuario en la base de datos
			String sql = "INSERT INTO usuarios (usuario, clave, nombre, apellidos, direccion, poblacion, provincia, cp, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = conexionBD.prepareStatement(sql);
			statement.setString(1, usuario);
			statement.setString(2, clave);
			statement.setString(3, nombre);
			statement.setString(4, apellidos);
			statement.setString(5, direccion);
			statement.setString(6, poblacion);
			statement.setString(7, provincia);
			statement.setString(8, cp);
			statement.setString(9, telefono);
			
			int rowsAffected = statement.executeUpdate();
			return rowsAffected > 0; // Retorna true si se registró correctamente
		} catch (SQLException e) {
			System.err.println("Error al registrar el usuario en la base de datos");
			e.printStackTrace();
		}
	}
	return false; // Retorna false si no se pudo registrar el usuario
}
}