package cl.usach.example.herencia;

public class Estudiante extends Persona {
    /**
     * HERENCIA!
     * extends = crear una copia
     * OPP:
     * Clase Padre (Superclase) -> Clase Hijo (Clase)
     */

    boolean isVespertino;

    public Estudiante(String rut, String nombre, boolean isVespertino) {
        super(rut, nombre); //Copia all de la superclase
        this.isVespertino = isVespertino;
    }

    public boolean isVespertino() {
        return isVespertino;
    }

    public void setVespertino(boolean vespertino) {
        isVespertino = vespertino;
    }
}
