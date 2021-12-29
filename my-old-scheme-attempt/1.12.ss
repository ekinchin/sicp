(define (t x)((ttt x 0)))

(define (ttt x y)
  (if (= y 0)
      (ttt x y)
   ((ttt (+ x y) y)
   (ttt x (+ x y)))))


