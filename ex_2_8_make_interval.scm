(load "ex_2_7_make_interval.scm")

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
        (- (upper-bound x) (lower-bound y)) 
    )
)