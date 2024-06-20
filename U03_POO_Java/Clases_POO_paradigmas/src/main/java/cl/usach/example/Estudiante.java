package cl.usach.example;

public class Estudiante {

    String nombre;
    String rut;
    boolean isResfriado;

    Estudiante(String nombre, String rut, boolean isResfriado) {
        this.nombre = nombre;
        this.rut = rut;
        this.isResfriado = isResfriado;
    }

    public String getNombre() {
        return nombre;
    }

    public String getRut() {
        return rut;
    }

    public boolean getIsResfriado() {
        return isResfriado;
    }
}
