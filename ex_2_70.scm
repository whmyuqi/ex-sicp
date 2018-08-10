(load "huffman_tree.scm")
(define rock-tree
    (generate-huffman-tree '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1))))

(encode-symbol 'Get rock-tree)
(define code (encode '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom) rock-tree))
(display (length code))
(display "\n")
(display code)
