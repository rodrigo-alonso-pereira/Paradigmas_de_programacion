package cl.usach.example.Interface;

public class Gato implements Animal {
    //Interface es un contrato que debe ser cumplido por todas las clases que lo implementan
    private String nombre;
    private int numeroVidas;
    private String domicilio;

    public Gato(String nombre, int numeroVidas, String domicilio) {
        this.nombre = nombre;
        this.numeroVidas = numeroVidas;
        this.domicilio = domicilio;
    }

    @Override
    public void respirar(int cantidadMinutos) {
        System.out.printf("Respirando el gatito por %s minutos\n", cantidadMinutos);
    }

    @Override
    public boolean estornudo() {
        return false;
    }
}
