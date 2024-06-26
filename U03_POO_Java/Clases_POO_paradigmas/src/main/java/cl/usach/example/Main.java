package cl.usach.example;

import cl.usach.example.Interface.Animal;
import cl.usach.example.Interface.Gato;
import cl.usach.example.Interface.Perro;
import cl.usach.example.claseAbstracta.AnimalAbstracto;
import cl.usach.example.claseAbstracta.Ardilla;
import cl.usach.example.herencia.Estudiante;
import cl.usach.example.herencia.Persona;
import cl.usach.example.herencia.Profesor;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

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

        System.out.println(e3.print("Print con 1 parametro"));
        System.out.println(e3.print("Print con 1 parametro", 2));

        Profesor p1 = new Profesor("10", "Gonzalo", true);
        p1.setRut("999");
        System.out.println(p1.getRut());

        Animal g1 = new Gato("Misifus", 9, "Gatitos #123");
        g1.respirar(99);

        Animal perro1 = new Perro();
        perro1.respirar(100);

        //Lista, una posible lista = ArrayList
        //Se sugiere conmectarse a la interfaz, no a la implementacion.
        //List (Interfaz)
        //LinkedList y ArrayList son clases que implementan esta interfaz (List)
        List<String> curso = new LinkedList<>();
        curso.add("Rodrigo");
        curso.add("Felipe");
        curso.add("Eduardo");
        curso.add("Miguel");
        System.out.println(curso);

        //Clase abstracta
        //Polimorfismo nuevoAnimal tiene los metodos de AnimalAbstracto y Ardilla

        AnimalAbstracto nuevoAnimal = new Ardilla("Ardillita", "Arbol de la esquina");
        //Se puede acceder solo a metodo de AnimalAbstracto (Idem Herencia)
        nuevoAnimal.hacerRuido();

        Ardilla nuevoAnimal2 = new Ardilla("Ardilla Regordeta", "Arbol de al frente");
        //Se puede acceder a medoto de Ardilla y AnimalAbstracto
        nuevoAnimal2.ardillaPilla();
        nuevoAnimal2.hacerRuido();

    }
}
