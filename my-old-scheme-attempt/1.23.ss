#lang scheme
(define (timed-prime-test n)
  
  (define (runtime)
    (current-milliseconds))
  
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  
  (define (start-prime-test n start-time)
    (if (smallest-devision n)
        (report-prime (- (runtime) start-time))))
  
  (newline)
  (display n)
  (start-prime-test n (runtime)))


(define (smallest-devision n)
  (define (sm-devision n m sq)
    (cond ((= n 0) "n=0!!!")
          ((= n 1) 1)
          ((> m sq) "n is simple!")
          ((= (remainder n m) 0) m)
          (else (cond ((= n 3) (sm-devision n (+ m 2) sq))
                      (else (sm-devision n (+ m 1) sq))))))
  (sm-devision n 2 (sqrt n)))

(timed-prime-test 561)