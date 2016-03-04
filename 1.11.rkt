#lang planet neil/sicp
(define (f n)
  (cond ((or (< n 3) (= n 3)) n)
       (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(f 6)

(define (fi n)
  (fiter 3 2 1 n))

(define (fiter a b c n)
  (cond ((= n 1)c)
        ((= n 2)b)
        ((= n 3)a)
        (else (fiter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))

(fi 1)
(fi 2)
(fi 3)
(fi 4)
(fi 5)
(reminder 100 2)