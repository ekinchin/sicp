#lang scheme
(define (sqrt-iter guess guess-prev x)
  (if (good? guess guess-prev)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (good? guess guess-prev)
  (< (abs (- guess guess-prev)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))
