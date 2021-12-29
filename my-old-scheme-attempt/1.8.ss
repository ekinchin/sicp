(define (sqrt-iter guess guess-prev x)
  (if (good? guess guess-prev)
      guess
      (sqrt-iter (average guess x) guess x)))

(define (good? guess guess-prev)
  (< (abs (- guess guess-prev)) 0.001))

(define (average y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(define (square x)(* x x))