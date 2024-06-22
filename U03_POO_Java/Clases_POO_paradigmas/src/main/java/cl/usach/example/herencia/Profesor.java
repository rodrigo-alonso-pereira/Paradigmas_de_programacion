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

    //Sobrescritura de metodos
    @Override
    public void setRut(String rut) {
        this.rut = rut.concat("-RUT CHILE");
    }
    
}
