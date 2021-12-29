#lang scheme

(define (make-point x y)(cons x y))
(define (make-segment point1 point2)(cons point1 point2))

(define (x-point p)(car p))
(define (y-point p)(cdr p))
(define (start-segment segment)(car segment))
(define (end-segment segment)(cdr segment))

(define (midpoint-segment segment)
  (define (average x1 x2)(/ (+ x1 x2) 2))
  (let ((start-point (start-segment segment))
        (end-point (end-segment segment)))
    (make-point (average (x-point start-point) (x-point end-point))
                (average (y-point start-point) (y-point end-point)))))

(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))

(define p1 (make-point 2 2))
(define p2 (make-point 4 4))
(define segment (make-segment p1 p2))
(midpoint-segment segment)

(print-point p1)
(print-point p2)