#lang racket

;file fetchers
(define (open-day n)
  (let [(day-filename (format "day_~a.in" n))]
    (file->lines day-filename)))

(define (conjoin lst n)
  (define (aux args acc)
    (if (< (length args) n)
        (reverse acc)
        (aux (drop args n) (cons (take args n) acc))))
  (aux lst empty))

;check if strings match at k
(define (sfilter s1 s2 k)
  (equal? (substring s1 k (+ k 1)) (substring s2 k (+ k 1))))

;binary garbage
(define (binstr->integer binstr)
  (string->number (format "#b~a" binstr)))

(define (bin-multiply x y)
  (* (binstr->integer x) (binstr->integer y)))

(provide (all-defined-out))