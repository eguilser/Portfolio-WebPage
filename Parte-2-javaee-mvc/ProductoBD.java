package tienda;

import java.sql.Connection;

public class ProductoBD{
	
	private int id;
	private String descripcion;
	private Connection conexionBD = null;
	private int codigo;


    public Connection getConexionBD() {
		return conexionBD;
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
	private float precio;
	private int stock;
	private String imagen;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}

