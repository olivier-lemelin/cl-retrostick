;;;; package.lisp

(defpackage #:cl-retrostick
  (:use #:cl #:cffi #:alexandria)
  (:import-from
   #:cffi
   #:mem-ref
   #:with-foreign-objects
   #:with-foreign-object
   #:foreign-alloc
   #:foreign-free
   #:null-pointer-p)) 
