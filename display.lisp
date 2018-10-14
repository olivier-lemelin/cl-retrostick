(asdf:defsystem #:cl-retrostick.display
  :description "Describe cl-retrostick here"
  :author "Olivier Lemelin"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:sdl2 #:cffi #:alexandria #:cl-retrostick.utils)
  :components ((:file "display")))


(defpackage #:cl-retrostick.display
  (:use #:cl #:cffi #:alexandria)
  (:import-from
   #:cffi
   #:mem-ref
   #:with-foreign-objects
   #:with-foreign-object
   #:foreign-alloc
   #:foreign-free
   #:null-pointer-p))

(in-package #:cl-retrostick.display)

;; ----------
;; Display
;; ----------

(defun get-dpi (display-index)
  (with-foreign-objects ((ddpi :float)
                         (hdpi :float)
                         (vdpi :float))
    (sdl2-ffi.functions:sdl-get-display-dpi display-index ddpi hdpi vdpi)
    (list :ddpi (mem-ref ddpi :float)
          :hdpi (mem-ref hdpi :float)
          :vdpi (mem-ref vdpi :float)))) 

(defun enable-screensaver ()
  (sdl2:enable-screensaver)) 

(defun disable-screensaver ()
  (sdl2:disable-screensaver)) 

(defun screensaver-enabled? ()
  (sdl2:screensaver-enabled-p)) 

(defun get-monitor-count ()
  (sdl2-ffi.functions:sdl-get-num-video-displays)) 

(defun get-current-video-driver ()
  (sdl2-ffi.functions:sdl-get-current-video-driver)) 

(defun get-display-name (display-index)
  (sdl2-ffi.functions:sdl-get-display-name display-index)) 

(defun get-number-display-modes (display-index)
  (sdl2:get-num-display-modes display-index)) 

(defun get-display-modes (display-index)
  (map-over-range (n (display-get-number-display-modes display-index))
		  (multiple-value-bind (format w h refresh-rate)
		      (sdl2:get-display-mode display-index n)
		    (list :w w :h h :refresh-rate refresh-rate :pixel-format format)))) 
