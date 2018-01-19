(load "global.scm")
(load "fixed-point.scm")

(define (fixed-point-phi)
    (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0 (close-enough? tolerance))
)
