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
        comer();
    }

    //Modificador de acceso protected
    //Solo es accesible por las clases que estas definidas por la misma carpeta (Package)
    protected void comer(){
        System.out.println("Ardilla Pilla come avellanas");
    }


}
