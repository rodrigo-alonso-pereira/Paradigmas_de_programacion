package cl.usach.example;

import cl.usach.example.herencia.Estudiante;
import cl.usach.example.herencia.Persona;

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

        Estudiante e1 = new Estudiante("Rodrigo", "16", true,false);
        System.out.println(e1);
        System.out.println(e1.getNombre());
        System.out.println(e1.getNombre());
        System.out.println(e1.isResfriado());
        e1.setNoResfriado();
        System.out.println(e1.isResfriado());
        System.out.println(e1.toString());

        //Polimorfismo de clase
        //e2 y e1 son persona y estudiante a la vez
        Persona e2 = new Estudiante("16", "Pedro", false,true);
        Estudiante e3 = new Estudiante("17", "Juan", true,true);
        //e2 solo expone metodos de persona
        System.out.println(e2.getNombre());
        //e3 expone metodos de persona y estudiante
        System.out.println(e3.isVespertino());
    }
}
