(define (split op1 op2)
    (define (rec painter n) 
        (if (= n 0)
            painter
            (let ((smaller (rec painter (- n 1))))
                (op1 painter (op2 smaller smaller)))))
    rec)
