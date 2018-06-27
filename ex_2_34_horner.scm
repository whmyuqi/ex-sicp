(load "global.scm")
(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coeff higher-terms)
                    (display this-coeff)
                    (display "\t")
                    (display higher-terms)
                    (display "\n")
                    (+ this-coeff (* x higher-terms))
                )
                0
                coefficient-sequence
    )
)