#lang scheme
; f(g(x))
(define (compose f g)
  (lambda (x)(f (g x))))

; f(f(...(f(x))...))
(define (repeat f n)
  (if (> n 1)
      (lambda (x) ((compose (repeat f (- n 1)) f) x))
      f))

; инкремент
(define (inc x)(+ x 1))

; сглаживание
(define (smooth f dx)
  (define (average x1 x x2)(/ (+ x1 x2 x) 3))
  (lambda(x)(average (f (- x dx)) (f x) (f (+ x dx)))))

; n-кратное сглаживание. НЕВЕРНО!
(define (n-smooth-n f dx n)
  (repeat (smooth f dx) n))

; n-кратное сглаживание. ВЕРНО!
(define (n-smooth f dx n)
  ((repeat (lambda (g) (smooth g dx)) n) f))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

((smooth inc 0.00001)  6.0)
((n-smooth inc 0.00001 5) 6.0)
((n-smooth-n inc 0.00001 5) 6.0)