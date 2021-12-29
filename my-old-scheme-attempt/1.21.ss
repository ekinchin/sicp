#lang scheme

(define (smallest-devision n)
  (define (sm-devision n m sq)
    (cond ((= n 0) "n=0!!!")
          ((= n 1) 1)
          ((> m sq) "n is simple!")
          ((= (remainder n m) 0) m)
          (else (sm-devision n (+ m 1) sq))))
  (sm-devision n 2 (sqrt n)))
