#lang planet neil/sicp
 
(define (product a f next b)
  (if (> a b)
      1 (* (f a)
           (product (next a) f next b))))

(define (product2 a f next b)

  (define (iter a result)
    (if ( > a b)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))


(define (inc x)
  (+ x 1))


(define (factorial n)
  (define (f x)
    x)
  (product 1 f inc n))



(factorial 5)

(define (even? x)
  (= 0 (remainder x 2)))

(define (calp n)
  (define (f k)
    (if (even? k)
        (/ (+ k 2) (+ k 1))
        (/ (+ k 1) (+ k 2))))
  (* 4 (product2 1.0 f inc n)))

(calp 10000000)
  
    
