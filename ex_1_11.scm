; 1.11 函数f有如下的规则定义: 如果n < 3, 那么 f(n) = n; 如果n ≥ 3, 那么 f(n) = f(n - 1) + 2(fn-2) + 3f(n - 3).
; 请写一个采用递归计算过程计算f的过程. 再写一个采用迭代计算过程计算f的过程.

; 递归计算过程 f1
(define (f1 n)
    (cond ((< n 4) n)
          (else (+ (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3)))))))
; 迭代计算过程 f2
(define (f2 n)
    (define (f2-iter a b c count)
        (if (= count 0)
            c
            (f2-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
    (if (< n 4)
        n
        (f2-iter 1 2 3 (- n 3))))
