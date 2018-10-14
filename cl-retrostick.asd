;;;; cl-retrostick.asd

(asdf:defsystem #:cl-retrostick
  :description "Describe cl-retrostick here"
  :author "Olivier Lemelin"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:sdl2 #:cffi #:alexandria)
  :components ((:file "package")
	       (:file "utils")
	       (:file "display" :depends-on ("utils"))
	       (:file "window")
	       (:file "graphics")
               (:file "cl-retrostick")))
