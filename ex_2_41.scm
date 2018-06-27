(load "global.scm")

(define (sum-list seq)
    (accumulate + 0 seq)
)

(define (remove x seq)
    (filter (lambda (i) (not (= x i))) seq)
)

(define (permutations n seq)
    (if (or (< n 1) (< (length seq) n))
        (list nil)
        (flatmap (lambda (x)
                (map (lambda (item) 
                        (append (list x) item))
                    (permutations (- n 1) (remove x seq)))) 
            seq)))

(define (three-sum-pairs n s)
    (filter (lambda (item) (= s (sum-list item)))
        (permutations 3 (enumerate-interval 1 n)))
)