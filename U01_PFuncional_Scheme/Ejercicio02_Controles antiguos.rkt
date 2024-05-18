#lang racket

;; CONTROL 1 (2023-2)


;; PREGUNTA II

; DOM = Lista x funcion x entero
; REC = Lista
; Descripcion = Funcion que filta una lista segun una condicion y cambia el elemento por un valor cuando este la cumpla.
; REcursividad = Cola

(define updateElement
  (lambda (lista filtro value)
    (cond
      [(null? lista) null]
      [else
       (if (filtro (car lista))
           (cons value (updateElement (cdr lista) filtro value))
           (cons (car lista) (updateElement (cdr lista) filtro value)))])))

(updateElement (list 1 2 3 4 5 6) odd? -1)
(updateElement (list 1 2 3 4 5 6) even? -1)

; Otra forma es DECLARATIVA
(define updateElementsDeclarativa
  (lambda (lista filtro value)
    (map (lambda (e) (if (filtro e) value e)) lista)))

(updateElementsDeclarativa (list 1 2 3 4 5 6) odd? -1)
(updateElementsDeclarativa (list 1 2 3 4 5 6) even? -1)