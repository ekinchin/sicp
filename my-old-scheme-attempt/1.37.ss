#lang scheme
; рекурсивный процесс
(define (cont-frac-r n d k)
  (let ((nk (n k))
        (dk (d k)))
    (if (> k 0)
        (/ nk (+ dk (cont-frac-r n d (- k 1))))
        (/ nk dk))))

; итеративный процесс
(define (cont-frac-i n d k)
  (define (cont-iter i zn)
    (if (= i k)
        (/ (n i) zn)
        (cont-iter (+ i 1) (+ (d (+ i 1)) (/ (n i) zn)))))
  (cont-iter 0 1))

; время выполнения
(define (time f)
  (let ((start (current-milliseconds))
      (result (f))
      (end (current-milliseconds)))
  (display result)
  (newline)
  (display (- end start))))

(newline)
(display "Рекурсивная")
(newline)
(time (lambda ()(cont-frac-r (lambda (i) 1.0) (lambda (i) 1.0) 1000000)))

(newline)
(display "Итеративная")
(newline)
(time (lambda ()(cont-frac-i (lambda (i) 1.0) (lambda (i) 1.0) 1000000)))
