package cl.usach.example;

public class Profesor {

    String rut;
    String nombre;
    boolean isFullTime;

    public Profesor(String rut, String nombre, boolean isFullTime) {
        this.rut = rut;
        this.nombre = nombre;
        this.isFullTime = isFullTime;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isFullTime() {
        return isFullTime;
    }

    public void setFullTime(boolean fullTime) {
        isFullTime = fullTime;
    }
}
