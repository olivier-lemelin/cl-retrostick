(asdf:defsystem #:cl-retrostick.graphics
  :description "Describe cl-retrostick here"
  :author "Olivier Lemelin"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:sdl2 #:sdl2-image #:sdl2-ttf #:cffi #:alexandria)
  :components ((:file "graphics")))

(defpackage #:cl-retrostick.graphics
  (:use #:cl #:cffi #:alexandria)
  (:import-from
   #:cffi
   #:mem-ref
   #:with-foreign-objects
   #:with-foreign-object
   #:foreign-alloc
   #:foreign-free
   #:null-pointer-p)
  (:export #:with-graphics #:graphics-load))


;; ----------
;; Graphics
;; ----------

(in-package #:cl-retrostick.graphics)

(defun graphics-load (filename)
  (sdl2-image:load-image filename))

(defmacro with-graphics (&body body)
  `(progn
     (sdl2-image:init '(:png :jpg :tif))
     ,@body
     (sdl2-image:quit)))

