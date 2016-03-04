#lang planet neil/sicp


(define (double g)
  (lambda (x)
    (g (g x))))

(define (inc x)
  (+ x 1))

((double inc) 1)

(( (double double) inc) 2)
(((double (double double )) inc) 5)
