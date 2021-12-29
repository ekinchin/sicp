#lang scheme

(define (numer x)(car x))
(define (denom x)(cdr x))
(define (make-rat n d)
  (define (sign x)
    (cond ((> x 0) 1)
          ((< x 0) -1)
          (else 0)))
  (let ((g (* (gcd (abs n) (abs d)) (sign d))))
    (cons (/ n g) (/ d g))))

; поиск НОД
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+
             (* (numer x) (denom y))
             (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (-
             (* (numer x) (denom y))
             (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


;(define one-third (make-rat -1 3))
;(print-rat (add-rat one-third one-third))
(make-rat -1 -2)
(make-rat 1 -2)
(make-rat -1 2)
(make-rat 1 2)
