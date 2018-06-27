(define (smooth f)
    (define dx 0.000001)
    (lambda (x)
        (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)
    )
)

(load "ex_1_43.scm")

(define (n_smooth f n)
    ((repeated smooth n) f)
)