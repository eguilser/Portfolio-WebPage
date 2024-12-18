package tienda;

public class Producto {
	private int id;
	private String nombre;
	private float precio;
	private int cantidad;
	public int getId() {
	return id;
	}
	public void setId(int id) {
	this.id = id;
	}
	public String getNombre() {
	return nombre;
	}
	public void setNombre(String nombre) {
	this.nombre = nombre;
	}
	public float getPrecio() {
	return precio;
	}
	public void setPrecio(float precio) {
	this.precio = precio;
	}
	public int getCantidad() {
	return cantidad;
	}
	public void setCantidad(int cantidad) {
	this.cantidad = cantidad;
	}
}

