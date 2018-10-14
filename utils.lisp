(asdf:defsystem #:cl-retrostick.utils
  :description "Describe cl-retrostick here"
  :author "Olivier Lemelin"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on ()
  :components ((:file "utils")))


(defpackage #:cl-retrostick.utils
  (:use #:cl))

(in-package #:cl-retrostick.utils)

;; ----------
;; Utils
;; ----------

(defmacro map-over-range ((var max &key (min 0) (step 1)) &body body)
  `(loop for ,var from ,min below ,max by ,step
         collect ,@body)) 

