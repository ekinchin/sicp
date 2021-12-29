(define (inc n) 
  (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (identity x)
  x)

(define (sum-integers a b)
  (sum identity a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(sum-cubes 1 10)
(sum-integers 1 10)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)