#lang racket

;; Scheme es un lenguaje donde todo es una funcion
;; La unica estructura de datos es una lista.
;; Las listas son pares de pares
;; pair (a b)
;; cons (a b)
;; (cons 1(cons 2(cons 3 null))) -> '(1 2 3)
;; (cons "hola" "mundo") -> '("hola" . "mundo")
(define nombre-funcion
  (lambda (arg1 arg2 arg3)  ;argumentos
    (list arg1 arg2 arg3))) ;retorno