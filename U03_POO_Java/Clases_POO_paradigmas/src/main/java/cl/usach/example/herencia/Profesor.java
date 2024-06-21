package cl.usach.example.herencia;

public class Profesor extends Persona {

    boolean isFullTime;

    public Profesor(String rut, String nombre, boolean isFullTime) {
        super(rut, nombre);
        this.isFullTime = isFullTime;
    }

    public boolean isFullTime() {
        return isFullTime;
    }

    public void setFullTime(boolean fullTime) {
        isFullTime = fullTime;
    }
}
