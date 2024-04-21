#lang racket

;; CONTROL 1_Paradigmas de Programacion
; 1er. Semestre 2024
; Ing. Ejec. Computacion e Informatica, USACH.

#|
(30 pts) Pregunta I (Procure responder todos los ítems de esta pregunta en esta misma hoja (puede usar ambos lados)
1.- Dada la siguiente función:

(define fn (lambda (f l)
   (if (null? l) '()
       (cons (f (car l)) (fn f (cdr l))))))

a) (3 pts) ¿Qué realiza el código previamente mostrado?
R: Aplica una funcion f en cada elemento de una lista l y retorna una nueva lista. Es un MAP

b) (3 pts) ¿Qué tipo de recursión se aprecia en el código?
R: Natural


c) (4 pts) Señale en el código anterior aquellos elementos distintivos que lo llevaron
a la clasificación del tipo de recursividad que señaló en b?
R: (cons (f (car l)) (fn f (cdr l)))))) -> Tiene estados pendientes y luego hace la llamada recursiva

d) (15 pts) Respetando el encabezado de la función, esto es, su nombre, los
argumentos de entrada y el orden de estos; implementar una alternativa usando otro tipo
de recursividad distinta a la señalada en la pregunta b) y además señale que elementos
distintivos se relacionan con la recursión implementada.
|#

(define fn
  (lambda (f l)
    (define fn-int
      (lambda (fn lst acc)
        (cond
          [(null? lst) (reverse acc)]
          [else (fn-int fn (cdr lst) (cons (fn (car lst)) acc))])))
    (fn-int f l null)))

(fn (lambda (x) (+ x 1)) (list 1 2 3)) ; '(2 3 4)

;b) R: (lambda (fn lst acc) | [else (fn-int fn (cdr lst) (cons (fn (car lst)) acc))]))) -> Tiene acumulador y no tiene estados pendientes.

#|
e) (5 pts) Documente la implementación de la función de referencia fn y la
implementada en el ítem (d) indicando Dominio, Recorrido, Descripción y Tipo de
recursividad empleada.
R: Dom = Funcion (f) x Lista (l)
   Rec = Lista
   Descripcion = Aplica una funcion f en cada elemento de una lista l y retorna una nueva lista. Es un MAP
   Recursividad = Cola

Nota: Para esta pregunta puede usar funciones como cons, car, cdr, null,
null?, if, not, append, =, cond, let, reverse, map, filter
|#

; =========================================================================================================================================

#|

(30 pts) Pregunta II (Procure responder todos los ítems de esta pregunta en esta misma hoja (puede usar ambos lados)

2.- Dentro del lenguaje racket existen distintas funciones para listas. Implementar las siguientes
funciones:

a) (5 pts) (findf proc lst) la cual permite retornar el primer elemento dentro de la lista
que cumpla con el criterio especificado en proc (función booleana). Implementar de
una forma no declarativa.
Ej:
(findf (lambda (arg)
               (> arg 9))
               '(7 8 9 10 11))

Output: 10
|#
(define findf
  (lambda (fn lst)
    (cond
      [(null? lst) null]
      [else (if (fn (car lst))
                (car lst)
                (findf fn (cdr lst)))])))

(findf (lambda (x) (> x 9)) (list 7 8 9 10 11)) ; 10

; PAUTA
(define (findf2 proc lst)
  (cond [(null? lst) #f] ; Si la lista está vacía, retorna falso
        [(proc (car lst)) (car lst)] ; Si primer elemento cumple criterio, retorna ese elemento
        [else (findf2 proc (cdr lst))])) ; Avanza con el resto de la list.

(findf2 (lambda (x) (> x 9)) (list 7 8 9 10 11)) ; 10

#|
b) (10 pts) (remove-duplicates lst) la cual remueve de la lista lst todos los duplicados,
dejando una única ocurrencia de cada elemento. Implementar de una forma no
declarativa.
|#

(define remove-duplicates
  (lambda (lst)
    (cond
      [(null? lst) null]
      [else (if (member (car lst) (cdr lst))
                (remove-duplicates (cdr lst))
                (cons (car lst) (remove-duplicates (cdr lst))))])))

(remove-duplicates (list 1 2 3 1 2 3 4 5 5)) ; '(1 2 3 4 5)

; PAUTA
(define (remove-duplicates2 lst)
  (define (aux lst result)
    (cond [(null? lst) result] ; Cuando la lista es vacía, devuelve el resultado acumulado
          [(member (car lst) result) (aux (cdr lst) result)] ; Si el primer elemento ya está en el resultado, saltalo.
          [else (aux (cdr lst) (cons (car lst) result))])) ; Si no está, agregalo al acumulador.
  (reverse (aux lst '()))) ; lo doy vuelta afuera

(remove-duplicates2 (list 1 2 3 1 2 3 4 5 5)) ; '(1 2 3 4 5)

#|
c) (5 pts) (filter-map flt proc lst) la que permite aplicar la función proc solo a aquellos
elementos que cumplan con el filtro especificado a través de la función booleana flt.
La lista resultante sólo contiene los elementos transformados de la lista de entrada
que pasaron el filtro flt. Implementar esta función de manera completamente
declarativa, sin hacer uso explícito de recursividad.
|#

(define filter-map
  (lambda (flt proc lst)
    (map proc (filter flt lst))))

(filter-map (lambda (x) (> x 2)) (lambda (x) (+ x 1)) (list 1 2 3 4 5)) ; '(4 5 6)


#|
d) (10 pts) (inclusive-range start end [step]) la cual permite generar una lista con
valores comprendidos entre start y end, con diferencia step entre elementos. Dado
que step es opcional, en caso de no incluirse se asume que su valor es 1.

Ejemplos:
> (inclusive-range 10 20)
'(10 11 12 13 14 15 16 17 18 19 20)
> (inclusive-range 20 40 2)
'(20 22 24 26 28 30 32 34 36 38 40)
|#

(define inclusive-range
  (lambda (start end . step)
    (define inclusive-range-int
      (lambda (start end step last acc)
        (cond
         [(if (= last end)
             (reverse acc)
             (inclusive-range-int start end step (+ last step) (cons (+ last step) acc)))])))
    (inclusive-range-int start end (if (null? step) 1 (car step)) start (cons start null))))

(inclusive-range 10 20)   ; '(10 11 12 13 14 15 16 17 18 19 20)
(inclusive-range 20 40 2) ; '(20 22 24 26 28 30 32 34 36 38 40)

; PAUTA
(define (inclusive-range2 start end . restoArgumentos)
  (define step (if (null? restoArgumentos) 1 (car restoArgumentos)))
    (define (fn-interna actual acc)
      (cond [(and (> step 0) (> actual end)) (reverse acc)] ; Si el step es positivo y el actual supera el final, termina.
            [(and (< step 0) (< actual end)) (reverse acc)] ; Si el step es negativo y el actual es menor que el final, termina.
            [else (fn-interna (+ actual step) (cons actual acc))])) ; En cualquier otro caso, sigue la recursión.
    (fn-interna start '()))

(inclusive-range2 10 20)   ; '(10 11 12 13 14 15 16 17 18 19 20)
(inclusive-range2 20 40 2) ; '(20 22 24 26 28 30 32 34 36 38 40)