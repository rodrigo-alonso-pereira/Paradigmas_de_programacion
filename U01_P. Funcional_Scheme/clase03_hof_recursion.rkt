#lang racket


;; Paradigma funcional
; La salida sólo depende de la entrada y nada más
; No tenemos variables (i, j) 
; No podemos tener estados intermedios
; No existen iteraciones
; Las funciones puede recibir y/o retornar funciones (High Order Functions)


;; TDA -> Capas, funciones con un objetivo
; Constructor
; Selector
; Modificador
; Validador
; Otros


;; Lisp = List Processor
;; Lisp = Lost in a sea of parenthesis


;; [ ] = listas
;; LISP = todo es una lista, la lista se representa como: ( )
;; LISP todo son funciones


;; cons = fn para crear pares
;; (cons "hola" "chao") = '("hola" . "chao")
;; (cons 1 (cons 2 (cons 3 null))) = (list 1 2 3) = '(1 2 3)


;; Acceso a elementos de una lista
;; 2024 -> variable = ["hola", "chao"]
;; 2024 -> quiero acceder al primer elemento = variable[0]
;; 2024 -> quiero acceder al segundo elemento = variable[1]


;; 1950s
;; RAM -> CAR, CDR
;; CAR = Content Address Register
;; CDR = Content Decrement Register
;; CAR -> accedo al primero elemento de la memoria (lista) -> retorna un elemento
;; CDR -> accedo al resto de elementos en memoria (lista) -> retorna una lista

;; Ej. de implementacion de car y cdr
; (car (cdr (list 1 2 3))) -> entrega el 2do
; (car (cdr (cdr (list 1 2 3)))) -> entrega 3er elemento
; (car (cdr (cdr (cdr (list 1 2 3 4))))) -> entrega 4to elemento


;; formas de abreviarlo
; (car (list 1 2 3))
; (cadr (list 1 2 3))
; (caddr (list 1 2 3))
; (cadddr (list 1 2 3 4))


;; Forma de programación: DECLARATIVA
; nos concentramos en el QUE, no el COMO


;; (first (list 1 2 3))
;; (second (list 1 2 3))
;; last : obtenemos el último elemento de la lista -> FORMA DECLARATIVA
;; (last (list 1 2 3 4)) -> 4
;; reverse -> da vuelta la lista -> FORMA DECLARATIVA
;; obtener el último tambien puede ser: (car (reverse (list 1 2 3))) -> FORMA DECLARATIVA


;; FUNCIONES

;;; Con lambda
(define mi-funcion-1
 (lambda (arg1 arg2)
   (list arg1 arg2)))


;; Llamando a la función
(mi-funcion-1 "hola" "chao")
; -> '("hola" "chao")
(mi-funcion-1 (list 1 2 3) (list 4 5 6))
; -> '((1 2 3) (4 5 6))
(mi-funcion-1 (mi-funcion-1 "chao" (list 1 2 3)) "holi")
; -> '(("chao" (1 2 3)) "holi")
(mi-funcion-1 (mi-funcion-1 "Hola" (mi-funcion-1 "Test" (reverse (list 1 2 3)))) "chao")
;-> '(("Hola" ("Test" (3 2 1))) "chao")

;;; Sin lambda
(define (mi-funcion-2 arg1 arg2)
 (list arg1 arg2))


(mi-funcion-2 "hola fn2" "chao fn2")
; -> '("hola fn2" "chao fn2")
(mi-funcion-2 "Hola fn2" (mi-funcion-2 (mi-funcion-2 "Test"(reverse (list 3 2 1))) "Chao"))
; -> '("Hola fn2" (("Test" (1 2 3)) "Chao"))
;;python:  fn(1, **kwargs)  **kwargs


;; dot operator -> operador punto
;; builder es el nombre que yo le puse a la funcion
;; make-lists, lists, etc, es un constructor de listas
;; (builder 1 2 3 4 5 6 7 8 9 10 11)
(define (builder . elementos) elementos)
(builder (mi-funcion-2 "Hola fn2" (mi-funcion-2 (mi-funcion-2 "Test"(reverse (list 3 2 1))) "Chao")) "Test" 1 2 3 4 5 6 (reverse (list "a" "b" "c")))
; -> '(("Hola fn2" (("Test" (1 2 3)) "Chao")) "Test" 1 2 3 4 5 6 ("c" "b" "a"))

;; TDA Estudiante
;; Estudiante = Nombre (str) X Curso (str)

;; 1. Construir el estudiante (CAPA CONSTRUCTORA)

;; DOM: Nombre (str) X Curso (str)
;; REC: estudiante
(define estudiante
 (lambda (nombre curso)
   (list nombre curso)))


(define get-nombre-estudiante
 (lambda (estudiante)
   (car estudiante)))


;; Main
(estudiante "gonzalo" "paradigmas")
(estudiante "javier" "paradigmas")
(estudiante "joaquin" "paradigmas")
(estudiante "rodrigo" "paradigmas")


; no existen variables
; e1 = ("gonzalo" "paradigmas")
; sólo existen funciones
(define e1 (estudiante "gonzalo M" "paradigmas"))
e1
; -> '("gonzalo M" "paradigmas")
(define e2 (estudiante "javier B" "paradigmas"))
e2
; -> '("javier B" "paradigmas")
(define e3 (estudiante "joaquin P" "paradigmas"))
e3
; -> '("joaquin P" "paradigmas")
(define e4 (estudiante "rodrigo P" "paradigmas"))
e4
; -> '("rodrigo P" "paradigmas")


;; TDA Curso
;; Curso = nombreCurso (str) X List Estudiantes

(define (curso nombre . estudiantes)
 (list nombre estudiantes))


(define c1 (curso "Paradigmas C1" e1 e2 e3 e4))
c1
; -> '("Paradigmas C1" (("gonzalo M" "paradigmas") ("javier B" "paradigmas") ("joaquin P" "paradigmas") ("rodrigo P" "paradigmas")))
(define c3 (curso "Paradigmas C3" e4 e3 e2 e1))
c3
; -> '("Paradigmas C3" (("rodrigo P" "paradigmas") ("joaquin P" "paradigmas") ("javier B" "paradigmas") ("gonzalo M" "paradigmas")))


;; Obtener nombre del curso
;; CAPA SELECTORA -> GET


(define get-nombre-curso
 (lambda (curso)
   (car curso)))


(get-nombre-curso c1)
; -> "Paradigmas C1"
(get-nombre-curso c3)
; -> "Paradigmas C3"

(define get-alumnos-curso
 (lambda (curso)
   (cadr curso)))


(get-alumnos-curso c1)
; -> '(("gonzalo M" "paradigmas") ("javier B" "paradigmas") ("joaquin P" "paradigmas") ("rodrigo P" "paradigmas"))
(get-alumnos-curso c3)
; -> '(("rodrigo P" "paradigmas") ("joaquin P" "paradigmas") ("javier B" "paradigmas") ("gonzalo M" "paradigmas"))


;; CAPA MODIFICADORA (set)

;; Curso = Nombre X List Estudiantes
;; Quiero el nombre del curso de "paradigmas" a "Paradigmas de Programacion"


;; Dom: Curso X nombre (str)
;; Rec: Curso
(define set-curso-nombre
 (lambda (current-curso new-nombre)
   (curso new-nombre
          (get-alumnos-curso current-curso))))


(define set-curso-nombre2
  (lambda (curso-actual nuevo-nombre)
    (curso nuevo-nombre
           (get-alumnos-curso curso-actual))))


(define c2 (set-curso-nombre c1 "Paradigmas de Programacion C2"))
c2
; -> '("Paradigmas de Programacion C2" ((("gonzalo M" "paradigmas") ("javier B" "paradigmas") ("joaquin P" "paradigmas") ("rodrigo P" "paradigmas"))))

(define c4 (set-curso-nombre2 c3 "Paradigmas de Programacion C4"))
c4
; -> '("Paradigmas de Programacion C4" ((("rodrigo P" "paradigmas") ("joaquin P" "paradigmas") ("javier B" "paradigmas") ("gonzalo M" "paradigmas"))))


;; VALIDACIONES

; (string? 1)
; -> f
; (number? 1)
; -> t

;; LISTAS OK
;; TDAs OK
;; CONSTRUCTORES DE LISTAS OK


;; Problema:
;; Fn X List 1 2 3 = (+ x 1) (list 1 2 3) = (list 2 3 4)


;; Solución: RECURSIÓN


;; 1. Recursión natural


;; (+ x 1) (list 1 2 3)
;; 1 + rec (2)
;; 1 + 2 + rec(3)


;; sumar los n primeros numeros de una lista
;; Recursion natural
;; (list 1 2 3)


; Recursion en Python

; def sumatoria_natural_recursion(n):
;   if n == 1:
;     return n
;   else:
;     return n + sumatoria_natural_recursion(n - 1)


; sumatoria de los primeros n numeros
; Dom: number
; Rec: number
; Tipo de recursión: natural
; uso de cond
(define sum-natural
 (lambda (n)
   (cond [(eq? n 0) n]
         [else (+ n (sum-natural (- n 1)))])))

(sum-natural 4)
; -> 10

; sumatoria de los primeros n numeros
; Dom: number
; Rec: number
; Tipo de recursión: Natural
; uso de if
(define sum-natural-if
  (lambda (n)
    (if (eq? n 0) n
        (+ n (sum-natural-if (- n 1))))))

(sum-natural-if 5)
; -> 15

;; Sumatoria de los primeros n numeros
;; DOM: number
;; REC: number
;; Tipo de recursion: Cola

(define suma_natural_cola_envoltorio
  (lambda (n)
    (define suma_natural_cola
      (lambda (n acc)
        (cond
          [(eq? n 0) acc]
          [else (suma_natural_cola (- n 1) (+ n acc))])))
  (suma_natural_cola n 0)))


(suma_natural_cola_envoltorio 5)


;; High Order Functions
;; Funciones que aceptan funciones
;; Funciones que retornan funciones




;; 1. MAP
;; (map fn lst) -> (lst fnXe1 fnXe2 fnXe3)
;; (map (+ x 1) (list 1 2 3)) -> (list 2 3 4)




;; FUNCIONES ANONIMAS


(define sumar
 (lambda (x)
   (+ x 1)))


(sumar 4)


;; LAS SIGUIENTES FUNCIONES SON DECLARATIVAS
;; función anonima es una función sin nombre
;; (lambda (x) (+ x 1))


;; (map (lambda (x) (+ x 1)) (list 1 2 3))




;; map sirve para aplanar (flatten list) listas
(map (lambda (e) (get-nombre-estudiante e)) (get-alumnos-curso c1))




;; FILTER
;; (filter pred lst)
;; pred es una función que retorna true or false
(filter (lambda (x) (> x 4)) (list 1 2 3 4 5 6))


;; APPLY (en algunos lenguajes, se llama REDUCER)
;; reduce toda una lista en terminos de una sola función
(apply * (list 1 2 3 4 5))
