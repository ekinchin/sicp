#lang scheme

; рекурсивный процесс
(define (tan-cf x k)
  (define (tan-cf-i x k i)
    (if (= k 0)
        (/ (* x x) i)
        (/ (* x x) (- i (tan-cf-i x (- k 1) (+ i 2))))))    
  (/ x (- 1 (tan-cf-i x (- k 1) 3))))

(define (time f)
  (let ((start (current-milliseconds))
      (result (f))
      (end (current-milliseconds)))
  (display result)
  (newline)
  (display (- end start))))

(time (lambda ()(tan-cf 1.04 1000000)))