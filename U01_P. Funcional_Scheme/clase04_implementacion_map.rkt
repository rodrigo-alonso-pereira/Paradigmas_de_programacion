#lang racket

;; Type List a = Null | Pair a (List)
;; (cons 1 (cons 2 null)) -> (cons 1 (cons 2 ()) -> (1 . (2 . null)) = LISTA = (1 2)

;; DOM: elemento X Lista
;; REC: Lista
;; Puede ser al principio, al final, al medio, al 3ero, intercalado, etc
(define agregar-elemento-a-lista
  (lambda (elemento lst)
    (cons elemento lst)))

(agregar-elemento-a-lista "hola" (list 1 2 3))

; de forma declarativa, agregando un elemento al final de la lista
(define agregar-elemento-al-final
  (lambda (elemento lst)
    (reverse (cons elemento (reverse lst)))))

(define lista (agregar-elemento-al-final "hola2" (list 1 2 3)))
lista

;; Type List a = Null | Pair a (List)
; (cons "hola" (list 1 2 3))
; > (cons "hola" (cons 1 (cons 2 (cons 3 null))))

;; DECLARATIVO = 1 fn = 1 linea


;; FUNCIONES QUE RECIBEN FUNCIONES O QUE RETORNAN FUNCIONES = High Order Functions (HoF)


;; MAP: aplicar una fn en una lista => (e1Xfn e2Xfn e3xFn)
;; Entra una lista de largo n y sale lista de largo n
(map (lambda (x) (+ x 1)) (list 1 2 3))

(define sumar1
  (lambda (elemento)
    (+ 1 elemento)))

;; Cuantos tipos de recursion existen?
;; 1. Recursion Natural -> dejo ESTADOS PENDIENTES
;;   en 1. cuando llega a condicion de parada, RETURN NULL
;; 2. Tail Recursion (Recursion de cola) -> voy acumulando EL RESULTADO en un arg de la FUNCION
;;  en 2. cuando llego a condicion de parada, RETURN ACC


;; DOM (entrada): fn X Lista
;; REC (salida): Lista
;; Rec: Natural
;; primero hay que ver la condicion de parada -> if/else -> cond 
(define mi-map
  (lambda (fn lst)
    (cond
      [(null? lst) null]
      [else (cons (fn (car lst)) (mi-map fn (cdr lst)))])))

;; fn: (+ x 1) (list 8 9 10)
;; (cons (fn 8) (mi-map fn (list 9 10)))
;; (cons (fn 8) (cons (fn 9) (mi-map fn (list 10)))
;;;; (cons (fn 8) (cons (fn 9) (cons (fn 10) (mi-map fn (cdr (list 10)))
;; (cons (fn 8) (cons (fn 9) (cons (fn 10) null)) = (cons 9 (cons 10 (cons 11 null))) = (list 9 10 11) = (9 10 11)

(mi-map (lambda (x) (+ x 1)) (list 8 9 10))

;; fn: (+ x 1) lst: (list 1 2 3)
;; lo deseado es: (list 2 3 4) = (cons 2 (cons 3 (cons 4 null)))
;; (fn (car lst)) -> (+ 1 1) = 2
;; (cons (fn (car lst)) (fn (car (cdr lst))))
;; -> (cons 2 3) = (2 . 3)
;; (cons (fn (car lst)) (mi-map (cdr lst) fn))) 



;; DOM (entrada): fn X Lista
;; REC (salida): Lista
;; Rec: Tail Recursion (cola)
;; primero hay que ver la condicion de parada -> if/else -> cond 
(define mi-map-tail
  (lambda (fn lst acc)
    (cond
      [(null? lst) (reverse acc)] ;; condicion de termino, es lista null => return acc
      [else (mi-map-tail fn (cdr lst) (cons (fn (car lst)) acc))]))) ;; en acc pasa todo

(mi-map-tail (lambda (x) (+ x 1)) (list 4 5 6) null)

;; map rec natural -> (map fn lst)
;; map tail rec -> (map fn lst acc)
;; Implemente la recursion opuesta RESPETANDO EL NUMERO DE ARGUMENTOS
;; ES DECIR; map rec tail -> (map fn lst)
;; WRAPPER = ENVOLTORIO = FUNCIONES INTERNAS = MASCARA


(define mi-map-tail-envoltorio
  (lambda (fn lst)
    (define mi-map-tail-interno
      (lambda (fn lst acc)
        (cond
          [(null? lst) (reverse acc)] ;; condicion de termino, es lista null => return acc
          [else (mi-map-tail-interno fn (cdr lst) (cons (fn (car lst)) acc))]))) ;; en acc pasa todo
    (mi-map-tail-interno fn lst '())))
;; '() es lo mismo que null


(mi-map-tail-envoltorio (lambda (x) (+ x 1)) (list 98 99 100))


;; (+ x 1) (list 4 5 6)

;; en acc = elemento neutro
;; elemento neutro en las listas? lista vacia -> null

;;   acc = '()
;;   acc = (cons 5 '())
;;   acc = (cons 6 (cons 5 '()))
;;   acc = (cons 7 (cons 6 (cons 5 '()))) = (cons 7 (cons 6 (cons 5 null))) = (7 6 5)

;(mi-map-tail fn lst '())


;; (cons 1 null)
;;   (cons 2 null)
;;      (cons 3 null)

;; Ejercicios

;; FILTER

;; APPLY (REDUCER)

(define agregar_al_principio
  (lambda (n lst)
    (cons n lst)))

(agregar_al_principio "hola" (list 3 2 1))

(define agregar_al_final
  (lambda (n lst)
    (reverse (cons n (reverse lst)))))

(agregar_al_final "adios" (list 1 2 3))