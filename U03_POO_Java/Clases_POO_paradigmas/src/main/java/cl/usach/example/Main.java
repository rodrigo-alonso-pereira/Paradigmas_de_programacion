package cl.usach.example;

public class Main {

    public static void main(String[] args) {
        //Definicion de una variable
        String valor = "Hola Mundo!";
        int miNumero = 1;
        double miOtroNUmero = 1.5;
        System.out.println(valor);
        System.out.println(miNumero);
        System.out.println(miOtroNUmero);

        //Nuevas versiones solo usar var para declarar variable
        //Inferencia
        var valor2 = "Hola Mundo 2!";
        var miNumero2 = 2;
        var miOtroNUmero2 = 2.5;
        System.out.println(valor2);
        System.out.println(miNumero2);
        System.out.println(miOtroNUmero2);

        //sout
        System.out.println("Esto es un shortcout");

        Estudiante e1 = new Estudiante("Rodrigo", "16", false);
        System.out.println(e1);
        System.out.println(e1.getNombre());
        System.out.println(e1.getNombre());
        System.out.println(e1.getIsResfriado());
    }
}
