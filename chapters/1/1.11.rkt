#lang racket

(define (fn-recursive n)
  (cond
    ((< n 3) n)
    (else (+
      (fn-recursive (- n 1))
      (fn-recursive (- n 2))
      (fn-recursive (- n 3))))))

(displayln (fn-recursive 4))

(define (fn-iterative n)
  (define
    (iter s1 s2 s3 count)
      (if (= count n)
        s3
        (iter s2 s3 (+ s1 s2 s3) (+ 1 count))))
  (if (< n 3) n (iter 0 1 2 2))
)
(displayln (fn-recursive 7))
(displayln (fn-iterative 7))
