#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)

;A
(define (ins_beg el lst)
  (cons el lst) )
;B
(define (ins_end el lst)
  (append lst (cons el empty)) )
;C
(define (cout_top_level lst)
  (if (empty? lst) 0 (+ 1 (cout_top_level (cdr lst)))) )
;D
(define (count_instances lst)
  (cond [(empty? lst) 0]
        [(list? (car lst)) (+ (count_instances (cadar lst)) (count_instances (cdr lst)))]
        [else (+ (count_instances (cdr lst)) 1)]
        )
  )
;E
(define (count_instances_tr lst)
  (citr_func lst 0)
  )
(define (citr_func lst val)
  (cond [(empty? lst) val]
        [(list? (car lst)) (citr_func (append (cadar lst) (cdr lst)) val)]
        [else (citr_func (cdr lst) (+ val 1))]
        )
  )
;F
(define (count_instances_deep lst comp)
  (cid_func lst 0 comp)
  )
(define (cid_func lst val comp)
  (cond [(empty? lst) val]
        [(list? (car lst)) (cid_func (append (cadar lst) (cdr lst)) val comp)]
        [else (cid_func (cdr lst) (+ val (if (equal? comp (car lst)) 1 0)) comp)]
        )
  )
