(load "global.scm")
(load "fixed-point.scm")

(define (t1)
    (fixed-point
        (lambda (x)
            (let ((val (/ (log 1000) (log x))))
                (newline)
                (display val)
                val
            )
        )
        2.0
        (close-enough? tolerance)
    )
)

(define (t2)
    (fixed-point
        (lambda (x)
            (let ((val (/ (+ x (/ (log 1000) (log x))) 2)))
                (newline)
                (display val)
                val
            )
        )
        2.0
        (close-enough? tolerance)
    )
)
; 平均阻尼的步数少。因为减少了震荡次数