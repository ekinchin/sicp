(define (f_rec n)
  (if (< n 3)
      n
      (+ (f_rec (- n 1))
         (f_rec (- n 2))
         (f_rec (- n 3)))))

(define (f-iter n)
  (define (iter res1 res2 res3 count)
    (if (= count n)
        res3
        (iter res2 res3 (+ res1 res2 res3) (+ count 1))))
  (if (< n 3)
      n
      (iter 0 1 2 2)))
