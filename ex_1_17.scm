; 1.17
(define (halve x) (/ x 2))
(define (double x) (+ x x))
(define (*1 a b)
    (define (* a b)
        (cond ((= b 0) 0)
            ((= b 1) a)
            ((even? b) (* (double a) (halve b)))
            (else (+ a (* a (- b 1))))))
    (* a b))


; 1.18
(define (*2 a b)
    (define (*-iter s a b)
        (cond ((= b 0) s)
            ((even? b) (*-iter s (double a) (halve b)))
            (else (*-iter (+ s a) a (- b 1)))))
    (define (* a b)
        (*-iter 0 a b))
    (* a b))
