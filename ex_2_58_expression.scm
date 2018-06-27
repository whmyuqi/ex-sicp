; 中缀式
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
    (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))
(define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list b '^ e))))

; 运算符优先级列表，越往后优先级越高
(define symbol-sort '(+ * ^))
; 获取优先级高的运算符列表
(define (higher-symbol-sort sym seq)
    (cond ((not (list? seq)) '())
        ((null? seq) '())
        ((eq? (car seq) sym) seq)
        (else (higher-symbol-sort sym (cdr seq)))))
(define (in-seq? x seq) (pair? (memq x seq)))

(define (exp? sym)
    (let ((skip-sym (higher-symbol-sort sym symbol-sort)))
        (lambda (s)
            (define (exp-iter exp)
                (or (= (length exp) 1)
                    (and (in-seq? (cadr exp) skip-sym)
                        (exp-iter (cddr exp)))))
            (and 
                (pair? s) 
                (in-seq? sym s)
                (exp-iter s)))))
(define (first-var sym) 
    (lambda (s) 
        (define (first-var-iter exp res)
            (if (or (= (length exp) 1) (eq? sym (cadr exp))) 
                (append res (list (car exp)))
                (first-var-iter (cddr exp) (append res (list (car exp) (cadr exp))))))
        (let ((result (first-var-iter s '())))
            (if (= (length result) 1)
                (car result)
                result))))
(define (second-var sym)
    (lambda (s) 
        (let ((sec (cdr (memq sym s))))
            (if (= (length sec) 1)
                (car sec)
                sec))))

(define sum? (exp? '+))
(define addend (first-var '+))
(define augend (second-var '+))

(define product? (exp? '*))
(define multiplier (first-var '*))
(define multiplicand (second-var '*))

(define exponentiation? (exp? '^))
(define base (first-var '^))
(define exponent (second-var '^))