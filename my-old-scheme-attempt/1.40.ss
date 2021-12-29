#lang scheme
; поиск неподвижной точки
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess x)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ x 1)))))
  (try first-guess 0))

; производная
(define (deriv g)
  (define dx 0.00001)
  (lambda (x)(/ (- (g (+ x dx)) (g x))
                dx)))

; метод Ньютона для поиска неподвижной точки
(define (newtons-method g guess)
  (define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))
  (fixed-point (newton-transform g) guess))

; возведение в квадрат
(define (square x)(* x x))

; поиск корня квадратного методом Ньютона
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))

; возвращает функцию вида: x^3 + ax^2 + bx + c
(define (cubic a b c)
  (lambda (x)(+
              (* x x x)
              (* a x x)
              (* b x)
              c)))

(newtons-method (cubic 1 20 3) 27)