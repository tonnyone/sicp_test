#lang planet neil/sicp

(define (compose a b)
  (lambda (x)
    (a (b x))))
(define (square x)
  (* x x))
((compose square inc) 6)

