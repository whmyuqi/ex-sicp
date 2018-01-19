(load "global.scm")
(load "fixed-point.scm")

(define (cont-frac n d k)
    (cont-frac-iter 0 k n d k)
)
(define (cont-frac-iter res iter n d k)
    (if (= iter 0)
        res
        (cont-frac-iter (/ (n iter) (+ (d iter) res)) (- iter 1) n d k)
    )
)
(define (phi k)
    (cont-frac (lambda (i) 1.0)
               (lambda (i) 1.0)
               k
    )
)

(define (find-phi-k)
    (define my-close-enough? (close-enough? tolerance))
    
    (let ((phi-val (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0 my-close-enough?)))
        (define (find-iter f k next)
            (let ((cur (f k)))
                (if (my-close-enough? phi-val (/ 1 cur))
                    k
                    (find-iter f (next k) next)
                )
            )
        )
        (find-iter (lambda (x) (time-test (lambda () (phi x)) x)) 1 (lambda (x) (+ x 1)))
    )
)