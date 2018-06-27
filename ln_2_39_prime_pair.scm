(load "prime.scm")
(define accumulate fold-right)
(define nil `())

(define (enumerate-interval m n)
    (define (enumerate-iter list cur min)
        (if (< cur min)
            list
            (enumerate-iter (cons cur list) (- cur 1) min)
        )
    )
    (enumerate-iter (list) n m)
)

(define (flatmap proc seq)
    (accumulate append nil (map proc seq))
)

(define (d-n-pairs n)
    (flatmap (lambda (i) 
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))
            )
        )
        (enumerate-interval 1 n)
    )
)

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair)))
)

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum?
            (d-n-pairs n)
        )
    )
)