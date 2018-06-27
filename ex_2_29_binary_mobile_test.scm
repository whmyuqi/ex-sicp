(define x1 
    (make-mobile
        (make-branch 2 3)
        (make-branch 3 2)
    )
)
(define x2 
    (make-mobile
        (make-branch 1 10)
        (make-branch 2 5)
    )
)
(define x3 
    (make-mobile
        (make-branch 6 x1)
        (make-branch 2 x2)
    )
)
(define x4
    (make-mobile
        (make-branch 10 4)
        (make-branch 2 x3)
    )
)
