(define (iterative-improve good-enough? improve)
    (define (iterator-guess guess)
        (let ((next (improve guess)))
            (if (good-enough? guess next)
                next
                (iterator-guess next)
            )
        )
    )
    (lambda (guess)
        (iterator-guess guess)
    )
)
