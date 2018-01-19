(load "iterative-improve.scm")

(define (fixed-point f first-guess i-close-enough?)
    ((iterative-improve i-close-enough? f) first-guess)
)
