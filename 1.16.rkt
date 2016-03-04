#lang planet neil/sicp
 
(define (fast-expt b n )
	(cond ((= n 0) 1)
		((even? n)(square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

(define (square a)
  (* a a ))
(define (event? n )
	(= (remainder n 2) 0))
	
(define (fast-expt2 b n)
	(cond ((= n 0) 1)
		((even? n)(fast-expt2  (square b)  (/ n 2)))
		(else (* b (fast-expt2 b (- n 1))))))

(define (fast b n)
  (fast-expt3 1 b n))

(define (fast-expt3 a b n)
	(cond ((= n 0) a)
		((even? n)(fast-expt3 a (square b) (/ n 2)))
		(else (fast-expt3 (* a b) b (- n 1)))))


(fast-expt 10 3)
(fast-expt2 10 5)
(fast 10 5)
