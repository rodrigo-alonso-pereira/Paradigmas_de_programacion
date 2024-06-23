package cl.usach.example.Interface;

public interface Animal {

    //Metodos
    //Las interfaces es para  escribir comportamientos
    //Separo el QUE del COMO
    //Interface es menos acoplado que la herencia
    // Mayor Cohesion
    void respirar(int cantidadMinutos);
    boolean estornudo();
}
