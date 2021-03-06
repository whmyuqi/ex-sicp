(load "ex_2_8_make_interval.scm")

(define (interval-over-zero? x)
    (or (> (lower-bound x) 0) (< (upper-bound x) 0))
)
(define (div-interval x y)
    (if ((interval-over-zero? y))
        (error "Argument for divisor cannot over zero: " y)
        (mul-interval x
            (make-interval (/ 1.0 (upper-bound y))
                        (/ 1.0 (lower-bound y))
            )
        )
    )
)
