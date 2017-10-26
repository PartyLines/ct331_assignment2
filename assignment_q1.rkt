#lang racket

(cons 2 (cons 4 empty))
(cons 2 (cons 3 (cons 4 empty)))
(cons "Hello" (cons 8 (cons '(2 3 4) empty)))
(list "Hello" 8 '(2 3 4))
(append '("Hello") '(8) '((2 3 4)))

;The list function was unsurprisingly the most efficient way to create
;a list from scratch, requiring only the elements in sequence.

;The cons (construct node) function was the least efficient because
;it requires manual specification of each node's value AND next pointer.

;The append function concatenates lists together, so manually providing
;The next pointers is unnecessary. However, it does not accept nonlist
;elements, so each entrant had to be 'boxed' n a list first.
