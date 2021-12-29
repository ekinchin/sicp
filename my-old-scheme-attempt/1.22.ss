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
