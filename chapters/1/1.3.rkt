#lang racket

(#%require rackunit)

(define (square x) (* x x))

(define (sum-of-square x y) (+ (square x) (square y)))

(define (solution a b c)
  (max
    (sum-of-square a b)
    (sum-of-square a c)
    (sum-of-square b c)))

(check-equal? (solution 4 2 2) 20)
(check-equal? (solution 4 2 1) 20)
(check-equal? (solution 4 4 2) 32)
