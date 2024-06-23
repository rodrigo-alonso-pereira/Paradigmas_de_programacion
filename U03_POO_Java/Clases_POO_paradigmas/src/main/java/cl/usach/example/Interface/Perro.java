package cl.usach.example.Interface;

public class Perro implements Animal{

    public Perro() {
    }

    @Override
    public void respirar(int cantidadMinutos) {
        System.out.printf("Respirando el perrito por %s minutos\n", cantidadMinutos);
    }

    @Override
    public boolean estornudo() {
        return false;
    }
}
