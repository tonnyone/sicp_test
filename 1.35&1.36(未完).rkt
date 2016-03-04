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

(fix-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

(fix-point (lambda (x) (/ (log 1000) (log x))) 2.0)


(define (cifang a b)
  (define (iter a b result)
    (if (= b 0)
      result
      (iter a (- b 1) (* result a))))
  (iter a b 1))

(define (cfself x)
  (cifang x x))

(cfself 4.0)

(define (xx guess result)

  (define (iter min max)
    (define gue (/ (+ min max) 2))
    (display gue)
    (newline)
    (let ((compare (- (cfself gue) result)))
      (cond (( and (< compare tolerance)
                  (> compare 0)) gue)
            ((< compare 0) (iter (/ (+ gue min) 2) max) )
            ((> compare tolerance)
             (display gue)
             (iter min (/ (+ max gue) 2))))))
  
  (iter 0 result))
    
(xx 2.0 1000)