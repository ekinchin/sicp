#lang racket

(#%require rackunit)

(define (even? n) (= (remainder n 2) 0))
(define (square n) (* n n))
(define (expt-iter b n a)
  (cond
    ((= n 0) a)
    ((= n 1) (if (= a 1) b a))
    ((even? n) (expt-iter b (/ n 2) (* a (square b))))
    (else (expt-iter b (- n 1) (* a b)))
  )
)

(define (fast-expt b n) (expt-iter b n 1))

(check-equal? (fast-expt 2 2) 4)
(check-equal? (fast-expt 2 4) 16)
(check-equal? (fast-expt 3 5) 243)
