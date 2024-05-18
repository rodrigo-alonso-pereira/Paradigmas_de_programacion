#lang racket

(define alternar_elementos_natural
  (lambda (lst1 lst2)
    (cond
      [(null? lst1) lst2]
      [(null? lst2) lst1]
      [else (cons (car lst1)
                  (cons (car lst2)
                        (alternar_elementos_natural (cdr lst1) (cdr lst2))))])))

(alternar_elementos_natural (list 1 2 3) (list 4 6))

(define alternar_elementos_cola
  (lambda (lst1 lst2)
    (define alternar_elementos_cola_int
      (lambda (lst1 lst2 acc)
        (cond
          [(null? lst1) (append (reverse acc) lst2)]
          [(null? lst2) (append (reverse acc) lst1)]
          [else (alternar_elementos_cola_int
                 (cdr lst1)
                 (cdr lst2)
                 (cons (car lst2) (cons (car lst1) acc)))])))
   (alternar_elementos_cola_int lst1 lst2 null)))

(define llamar-funcion (alternar_elementos_cola (list 1 2 3 8) (list 4 5 6)))
llamar-funcion

; DOM = lista
; REC = Entero
; Descripcion = Calcula el largo de la lisa
; Recursion = Cola
(define fn
  (lambda (lst)
    (define fn_interno
      (lambda(lst acc)
        (cond
          [(null? lst) acc]
          [else (fn_interno (cdr lst) (+ 1 acc))])))
    (fn_interno lst 0)))

(fn (list 1 2 3))

(define apply-rec
  (lambda (operacion lst)
    (if (null? lst)
        null
        (if (null? (cdr lst))
            (car lst)
            (operacion (car lst) (apply-rec operacion (cdr lst)))))))
(apply-rec * (list 1 2 3))

(define apply-cola
  (lambda (operacion lst)
    (define wrapper
      (lambda (operacion lst acc)
        (if (null? lst)
            acc
            (wrapper operacion (cdr lst) (operacion (car lst) acc)))))
    (if (eq? operacion +)
        (wrapper operacion lst 0)
        (wrapper operacion lst 1))))
(apply-cola * (list 1 2 4))