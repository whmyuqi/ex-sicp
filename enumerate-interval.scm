(define (enumerate-interval m n)
    (define (enumerate-iter seq cur min)
        (if (< cur min)
            seq
            (enumerate-iter (cons cur seq) (- cur 1) min)
        )
    )
    (enumerate-iter (list) n m)
)