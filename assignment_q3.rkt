#lang racket
;Leaf node with value n is defined as '(() n ())
;A
(define (in_order_traversal tree)
  (unless (empty? (car tree)) (in_order_traversal (car tree)))
  (display (cadr tree))
  (display " ")
  (unless (empty? (caddr tree)) (in_order_traversal (caddr tree)))
)
;B
(define (search_tree tree val)
  (cond
   [(equal? val (cadr tree)) #t]
   [(< val (cadr tree)) (if (empty? (car tree)) #f (search_tree (car tree) val))]
   [else (if (empty? (caddr tree)) #f (search_tree (caddr tree) val))]
   )
)
;C
(define (insert_tree tree val)
  (cond
   [(equal? val (cadr tree)) tree]
   [(< val (cadr tree)) (if (empty? (car tree))
             (list (list '() val '()) (cadr tree) (caddr tree))
             (list (insert_tree (car tree) val) (cadr tree) (caddr tree)))]
   [else (if (empty? (caddr tree))
             (list (car tree) (cadr tree) (list '() val '()))
             (list (car tree) (cadr tree) (insert_tree (caddr tree) val)))]
   )
)
;D
(define (insert_tree_list tree lst)
  (if (empty? lst)
      tree
      (insert_tree_list (insert_tree tree (car lst)) (cdr lst))
   ))
;E
(define (tree_sort lst)
  (if (empty? lst) #f
      (in_order_traversal(insert_tree_list (list '() (car lst) '()) (cdr lst)))
  )
)
;F
;comp should be a function that takes two arguments and returns:
;1 if the first value should come after the second
;0 if they are "equal"
;-1 if the second value should come after the first

;I had to redefine insert_tree, and all other functions derived from it
(define (custom_insert_tree tree val comp)
  (cond
   [(= 0 (comp val (cadr tree))) tree]
   [(= -1 (comp val (cadr tree))) (if (empty? (car tree))
             (list (list '() val '()) (cadr tree) (caddr tree))
             (list (custom_insert_tree (car tree) val comp) (cadr tree) (caddr tree)))]
   [else (if (empty? (caddr tree))
             (list (car tree) (cadr tree) (list '() val '()))
             (list (car tree) (cadr tree) (custom_insert_tree (caddr tree) val comp)))]
   )
)
(define (custom_insert_tree_list tree lst comp)
  (if (empty? lst)
      tree
      (custom_insert_tree_list (custom_insert_tree tree (car lst) comp) (cdr lst) comp)
   ))
(define (custom_tree_sort lst comp)
  (if (empty? lst) #f
      (in_order_traversal (custom_insert_tree_list (list '() (car lst) '()) (cdr lst) comp))
  )
)
;Ascending function should be identical to normal tree sort
(define (sort_ascending var1 var2)
  (cond
    [(> var1 var2) 1]
    [(< var1 var2) -1]
    [else 0]
  )
  )
;Descending function should be reverse of normal tree sort
(define (sort_descending var1 var2)
  (cond
    [(< var1 var2) 1]
    [(> var1 var2) -1]
    [else 0]
  )
  )

;Ascending modulo function should only account for the last digit.
(define (sort_ascending_modulo var1 var2)
  (cond
    [(> (modulo var1 10) (modulo var2 10)) 1]
    [(< (modulo var1 10) (modulo var2 10)) -1]
    [else 0]
  )
  )