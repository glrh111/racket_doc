#lang racket

(define (extract str)
  (substring str 1 3))

(extract "wocao")