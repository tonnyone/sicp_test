#lang planet neil/sicp
 

(define tolerance 0.00001)
(define (fix-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
          (if (close-enough? guess next)
              next
              (try next))))
  (try first-guess))

(define (connect d n st en)
  (if (= st en)
      (/ (n st) (d st))
      (/ (n st) (+ (d st) (connect d n (+ st 1) en)))))

(define (cont-frac n d k)
  (define (iter x )
    (if (= x k )
        (/ (n k) (d k))
        (/ (n x) (+ (d x)(iter (+ x 1))))))
  (iter 1))

(define (cont-frac2 n d k)
  (define (iter x result)
    (if (= x 1)
        result
        (iter (- x 1)
              (/ (n (- x 1))
                 (+ (d (- x 1)) result)))))
  
  (iter k (/ (n k) (d k))))

(cont-frac2 (lambda (i) 1.0) (lambda (i) 1.0) 1000)