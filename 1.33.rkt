#lang planet neil/sicp

(define (accumulate2 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
    (iter a null-value))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a) (iter (next a) (combiner result (term a)))
            (iter (next a ) result))))
  (iter a null-value))

(define (square x)
  (* x x))

(define (prime? x)
  (= x (smallest-divisor x)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (inc x)
  (+ x 1))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (self x)
  x)

(define (gcd a b)
  (if (=  b 0)
      a
      (gcd b (remainder a b))))


(define (result133 n) 
  (define (gcdfilter k)
     ( = (gcd k n) 1))
  (filtered-accumulate * 1 self 1 inc n gcdfilter))

(result133 10)
  
(filtered-accumulate + 0 self 1 inc 5 prime?)







        