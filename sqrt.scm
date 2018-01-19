(load "global.scm")

(define (my-sqrt x)
    ((iterative-improve 
        (lambda (guess next)
            (close-enough? (square guess) x tolerance)
        )
        (lambda (guess)
            (average guess (/ x guess))
        )
    ) 1.0)
)