package tienda;

public class PedidoDatos {
    private int codigo;
    private int persona;
    private java.sql.Date fecha;
    private float importe;
    private int estado;
    
    
    
  public int getCodigo() {
      return codigo;
  }
  public void setCodigo(int codigo) {
      this.codigo = codigo;
  }
  public int getPersona() {
      return persona;
  }
  public void setPersona(int persona) {
      this.persona = persona;
  }
  public java.sql.Date getFecha() {
      return fecha;
  }
  public void setFecha(java.sql.Date fecha) {
      this.fecha = fecha;
  }
  public float getImporte() {
      return importe;
  }
  public void setImporte(float importe) {
      this.importe = importe;
  }
  public int getEstado() {
      return estado;
  }
  public void setEstado(int estado) {
      this.estado = estado;
  }
  
}
