(define (make-mobile left right)
    (list left right)
)

(define (make-branch length structure)
    (list length structure)
)

(define (left-branch structure)
    (car structure)
)

(define (right-branch structure)
    (cadr structure)
)

(define (branch-length branch)
    (car branch)
)

(define (branch-structure branch)
    (cadr branch)
)

(define (left-branch-structure structure)
    (branch-structure (left-branch structure))
)

(define (right-branch-structure structure)
    (branch-structure (right-branch structure))
)

(define (mobile? structure)
    (list? structure)
)

(define (total-weight structure)
    (if (mobile? structure)
        (+ (total-weight (left-branch-structure structure)) (total-weight (right-branch-structure structure)))
        structure)
)

(define (mobile-balance? structure)
    (if (mobile? structure)
        (and 
            (mobile-balance? (left-branch-structure structure))
            (mobile-balance? (right-branch-structure structure))
            (= 
                (* (branch-length (left-branch structure)) (total-weight (left-branch-structure structure)))
                (* (branch-length (right-branch structure)) (total-weight (right-branch-structure structure)))
            )
        )
        #t)
)
