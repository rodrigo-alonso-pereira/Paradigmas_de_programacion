package cl.usach.example;

public class Estudiante {

    String nombre;
    String rut;
    boolean isResfriado;

    Estudiante(String nombre, String rut, boolean isResfriado) {
        this.nombre = nombre;
        this.rut = rut;
        this.isResfriado = true;
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

    public void setNoResfriado() {
        this.isResfriado = false;
    }

    @Override
    public String toString() {
        return "Estudiante{" +
                "nombre='" + nombre + '\'' +
                ", rut='" + rut + '\'' +
                ", isResfriado=" + isResfriado +
                '}';
    }
}
