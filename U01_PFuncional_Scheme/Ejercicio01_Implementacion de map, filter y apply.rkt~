#lang racket

;; IMPLEMENTACION MAP RECURSIVO

; DOM = fn x lst
; REC = lst
; Recursion = Natural
; (mi_map (lambda (x) (+ x 1)) (list 1 2 3)))
(define mi_map_natural
  (lambda (fn lst)
    (cond
      [(null? lst) null]
      [else (cons (fn (car lst)) (mi_map_natural fn (cdr lst)))])))

(mi_map_natural (lambda (x) (+ x 1)) (list 1 2 3))
; '(2 3 4)

; DOM = fn x lst x acc
; REC = lst
; Recursion = Cola
; (mi_map_cola (lambda (x) (+ x 1)) (list 1 2 3))
(define mi_map_cola
  (lambda (fn lst acc)
    (cond
      [(null? lst) (reverse acc)]
      [else (mi_map_cola fn (cdr lst) (cons (fn(car lst)) acc))])))

(mi_map_cola (lambda (x) (+ x 1)) (list 1 2 3) null)
; '(2 3 4)



;; IMPLEMENTACION FILTER RECURSIVO

; DOM = fn x lst
; REC = lst
; Recursion = Natural
; (mi_filter_natural (lambda (x) (> x 4)) (lst (3 4 5 6)))
(define mi_filter_natural
  (lambda (fn lst)
    (cond
      [(null? lst) null]
      [else (if (fn (car lst))
                (cons (car lst) (mi_filter_natural fn (cdr lst)))
                (mi_filter_natural fn (cdr lst)))])))

(mi_filter_natural (lambda (x) (> x 4)) (list 3 4 5 6))
; '(5 6)

; DOM = fn x lst
; REC = lst
; Recursion = Cola
; (mi_filter_cola (lambda (x) (> x 4)) (lst 3 4 5 6))

(define mi_filter_cola
  (lambda (fn lst acc)
    (cond
      [(null? lst) (reverse acc)]
      [else (if (fn (car lst))
                (mi_filter_cola fn (cdr lst) (cons (car lst) acc))
                (mi_filter_cola fn (cdr lst) acc))])))

(mi_filter_cola (lambda (x) (> x 4)) (list  3 4 5 6) null)
; '(5 6)


;; IMPLEMENTACION APPLY RECURSIVO

; DOM = fn x lst
; REC = number
; Recursion = Natural
; (mi_apply_natural * (list 1 2 3 4 5))
(define mi_apply_natural
  (lambda (fn lst)
    (cond
      [(null? lst) null]
      [else (if  (null? (cdr lst))
                (car lst)
                (fn (car lst) (mi_apply_natural fn (cdr lst))))])))

(mi_apply_natural * (list 1 2 3 4 5))
; 120

; DOM = fn x lst
; REC = number
; Recursion = Cola
; (mi_apply_cola * (list 1 2 3 4 5))
(define mi_apply_cola
  (lambda (fn lst acc)
    (cond
      [(null? lst) acc]
      [else (if (null? (cdr lst))
                (fn (car lst) acc)
                (mi_apply_cola fn (cdr lst) (fn (car lst) acc)))])))

(mi_apply_cola + (list 1 2 3 4 5) 1)
; 120
