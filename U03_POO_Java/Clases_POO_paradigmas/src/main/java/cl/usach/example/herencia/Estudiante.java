package cl.usach.example.herencia;

public class Estudiante extends Persona {
    /**
     * HERENCIA!
     * extends = crear una copia
     * OPP:
     * Clase Padre (Superclase) -> Clase Hijo (Clase)
     */

    boolean isVespertino;
    boolean isResfriado;

    public Estudiante(String rut, String nombre, boolean isVespertino, boolean isResfriado) {
        super(rut, nombre); //Copia all de la superclase
        this.isVespertino = isVespertino;
        this.isResfriado = isResfriado;
    }

    public boolean isResfriado() {
        return isResfriado;
    }

    public void setNoResfriado() {
        isResfriado = false;
    }

    public boolean isVespertino() {
        return isVespertino;
    }

    public void setVespertino(boolean vespertino) {
        isVespertino = vespertino;
    }

    @Override
    public String toString() {
        return "Estudiante{" +
                "isVespertino=" + isVespertino +
                ", isResfriado=" + isResfriado +
                ", rut='" + rut + '\'' +
                ", nombre='" + nombre + '\'' +
                '}';
    }
}
