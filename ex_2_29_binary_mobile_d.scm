(load "ex_2_29_binary_mobile.scm")

(define (make-mobile left right)
    (cons left right)
)
(define (make-branch length structrue)
    (cons length structrue)
)


(define (right-branch structure)
    (cdr structure)
)

(define (branch-structure branch)
    (cdr branch)
)

(define (mobile? structure)
    (pair? structure)
)