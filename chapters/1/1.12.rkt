#lang racket

(#%require rackunit)

(define (pascal column row)
  (cond
    ((= column row) 1)
    ((= column 1) 1)
    (else
      (+
        (pascal (- column 1) (- row 1))
        (pascal column (- row 1))
      )
    )
  )
)


(check-equal? (pascal 2 3) 2)
(check-equal? (pascal 2 5) 4)
(check-equal? (pascal 3 5) 6)
