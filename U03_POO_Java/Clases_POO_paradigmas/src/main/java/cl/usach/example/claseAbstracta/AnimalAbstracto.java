package cl.usach.example.claseAbstracta;

public abstract class AnimalAbstracto {

    private String nombre;
    private String direccion;

    public AnimalAbstracto(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    //Metodo abstracto
    public abstract void hacerRuido();
}
