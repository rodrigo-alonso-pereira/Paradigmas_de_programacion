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
        super(rut, nombre); //Realiza la copia de la superclase
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

    //Polimorfismo de Metodo (sobrecarga de metodos)
    public String print(String p1) {
        return "Hola soy metodo print, me llego esto: " + p1;
    }

    public String print(String p1, int p2) {
        return "Hola soy metodo print, me llego esto: " + p1 + " y " + p2;
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
