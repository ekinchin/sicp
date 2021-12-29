#lang scheme

(define (inc x)(+ x 1))
(define (square x)(* x x))

; f(g(x))
(define (compose f g)
  (lambda (x)(f (g x))))

; f(f(...(f(x))...))
(define (repeat f n)
  (if (> n 1)
      (lambda (x) ((compose (repeat f (- n 1)) f) x))
      f))

((repeat inc 4) 6)