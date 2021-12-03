#lang racket
(require "common.rkt")

(define input (open-day 1))

(define (counter list)
  (for/fold ([sum 0])
            ([arg1 list] [arg2 (rest list)])
    (if (< arg1 arg2) (+ 1 sum) sum)))

(define (summarum list)
  (define (aux args acc)
    (match args
      [(list a b c d ...) (aux (rest args) (cons (+ a b c) acc))]
      [else (reverse acc)]))
  (aux list empty))