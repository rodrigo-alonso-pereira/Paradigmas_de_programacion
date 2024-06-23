package cl.usach.example.claseAbstracta;

public class Ardilla extends AnimalAbstracto {

    public Ardilla(String nombre, String direccion) {
        super(nombre, direccion);
    }

    @Override
    public void hacerRuido() {
        System.out.println("Ardilla hacerRuido");
    }

    public void ardillaPilla(){
        System.out.println("Ardilla Pilla");
    }


}
