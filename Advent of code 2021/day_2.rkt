#lang racket
(require "common.rkt")

(define (part1 list)
  (for/fold ([depth 0]
             [hor 0]
             #:result (* depth hor))
            ([arg list])
    (match arg
      [(list 'forward n) (values depth (+ hor n))]
      [(list 'up n) (values (- depth n) hor)]
      [(list 'down n) (values (+ depth n) hor)])))

(define (part2 list)
  (for/fold ([depth 0]
             [hor 0]
             [aim 0]
             #:result (* depth hor))
            ([arg list])
    (match arg
      [(list 'forward n) (values (+ depth (* aim n)) (+ hor n) aim)]
      [(list 'up n) (values depth hor (- aim n))]
      [(list 'down n) (values depth hor (+ aim n))])))