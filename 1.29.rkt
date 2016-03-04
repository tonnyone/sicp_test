#lang planet neil/sicp
(define (cube a)
  (* a a a ))

(define (sum term a next b)
  (if (> a b )
      0
      (+(term a)
        (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a(/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.001)
(integral cube 0 1 0.01)




(define (integral2 f a b n)

  (define h (/ (- b a) n))
  
  (define (y k)
     (f(+ a (* k h))))

  (define (factor k)
    (cond ((or (= k 0)(= k n))1)
          ((odd? k)4)
          (else 2)))
  
  (define (term k)
    (* (factor k) (y k)))

  (define (next k)
    (+ k 1))
  
  (*(/ h 3) (sum term (exact->inexact 0) next n)))

(integral2 cube 0 1 10000)     