(define (make-leaf symbol weight)
    (list 'leaf symbol weight))
(define (leaf? object)
    (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
    (if (leaf? tree)
        (list (symbol-leaf tree))
        (caddr tree)))
(define (weight tree)
    (if (leaf? tree)
        (weight-leaf tree)
        (cadddr tree)))

(define (make-code-tree left right)
    (list left 
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (decode bits tree)
    (define (decode-1 bits current-branch)
        (if (null? bits)
            '()
            (let ((next-branch (choose-branch (car bits) current-branch)))
                (if (leaf? next-branch)
                    (cons (symbol-leaf next-branch)
                        (decode-1 (cdr bits) tree))
                    (decode-1 (cdr bits) next-branch)))))
    (decode-1 bits tree))

(define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))


(define (adjoin-set x set)
    (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
    (if (null? pairs)
        '()
        (let ((pair (car pairs)))
            (adjoin-set (make-leaf (car pair) (cadr pair))
                (make-leaf-set (cdr pairs))))))

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))
(define (encode-symbol symbol tree) 
    (cond 
        ((leaf? tree) '()) 
        ((member symbol (symbols tree))
            (let ((left (left-branch tree)) (right (right-branch tree))) 
                (if (member symbol (symbols left)) 
                    (cons 0 (encode-symbol symbol left)) 
                    (cons 1 (encode-symbol symbol right))))) 
        (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))
        
(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
    (if (= (length set) 1)
        (car set)
        (let ((left (car set)) (right (cadr set)))
            (successive-merge 
                (adjoin-set 
                    (make-code-tree left right)
                    (if (= (length set) 2)
                        '()
                        (cddr set)))))))

; 3 个二进制位
; 3 * 36 = 108 个二进制位