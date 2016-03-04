#lang planet neil/sicp

(define (compose a b)
  (lambda (x)
    (a (b x))))

(define (square x)
  (* x x))

(define (repeated f n)
  (lambda (x)
    (if (= x 1)
        (f n)
        (f ((repeated f n ) (- x 1))))))
  
((repeated square 3) 2 ) 
   
                  