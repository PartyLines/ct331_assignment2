#lang racket


(provide ins_beg)

;A
(define (ins_beg el lst)
  (cons el lst) )
;B
(define (ins_end el lst)
  (append lst (cons el empty)) )
;C
(define (count_top_level lst)
  (if (empty? lst) 0 (+ 1 (count_top_level (cdr lst)))) )
;D
(define (count_instances el lst)
  (if (empty? lst) 0 
  (+ (if (equal? el (car lst)) 1 0) (count_instances el (cdr lst)))
  ))
;E
(define (count_instances_tr el lst)
  (citr_func el lst 0)
  )
(define (citr_func el lst val)
  (if (empty? lst) val 
  (citr_func el (cdr lst) (+ (if (equal? el (car lst)) 1 0) val))
  ))
;F
(define (count_instances_deep lst)
  (cid_func lst 0 comp)
  )
(define (cid_func lst val)
  (cond [(empty? lst) val]
        [(list? (car lst)) (cid_func (append (cadar lst) (cdr lst)) val)]
        [else (cid_func (cdr lst) (+ val (if (equal? comp (car lst)) 1 0)))]
        )
  )
