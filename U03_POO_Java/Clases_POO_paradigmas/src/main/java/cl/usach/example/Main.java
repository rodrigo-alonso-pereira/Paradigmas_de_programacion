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
    }
}
