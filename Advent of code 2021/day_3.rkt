#lang racket
(require "common.rkt")

(define (epsgamma lst sym j)
  (for/fold ([output (make-string j #\0)])
            ([i (range j 12)])
    (let
        ([digits
          (for/fold ([acc empty])
                    ([arg lst])
            (cons (substring arg i (+ i 1)) acc))])
      
    (if (sym (count (λ(x) (equal? x "1")) digits) (/ (length digits) 2))
        (string-append output "1")
        (string-append output "0")))))

(define (sys-status lst sym)
  (for/fold ([acc lst]
             #:result (first acc))
            ([i (range 12)])
    (if (equal? (length acc) 1)
        acc
        (filter (λ(x) (sfilter x (epsgamma acc sym i) i)) acc))))

(bin-multiply (sys-status (open-day 3) >=) (sys-status (open-day 3) <))