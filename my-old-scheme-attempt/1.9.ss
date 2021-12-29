(define (add a b)
  (define (inc x)(+ x 1))
  (define (dec x)(- x 1))
  (if (= a 0)
      b
      (inc (add (dec a) b))))

(define (add2 a b)
  (define (inc x)(+ x 1))
  (define (dec x)(- x 1))
  (if (= a 0)
      b
      (add2 (dec a) (inc b))))