(asdf:defsystem #:cl-retrostick.window
  :description "Describe cl-retrostick here"
  :author "Olivier Lemelin"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:sdl2 #:cffi #:alexandria)
  :components ((:file "window")))

(defpackage #:cl-retrostick.window
  (:use #:cl #:cffi #:alexandria)
  (:import-from
   #:cffi
   #:mem-ref
   #:with-foreign-objects
   #:with-foreign-object
   #:foreign-alloc
   #:foreign-free
   #:null-pointer-p))

;; ----------
;; Window
;; ----------

(in-package #:cl-retrostick.window)

(defun create (&key (title "SDL2 Window") (x :centered) (y :centered) (w 800) (h 600) (flags '()))
  (sdl2:create-window :title title :x x :y y :w w :h h :flags flags)) 

(defun destroy (win)
  (sdl2:destroy-window win)) 

(defun set-icon (win icon)
  (sdl2-ffi.functions:sdl-set-window-icon win icon)) 

(defun set-caption (win caption)
  (sdl2:set-window-title win caption)) 

(defun get-caption (win)
  (sdl2:get-window-title win)) 

(defun get-dimensions (win)
  (multiple-value-bind (width height)
      (sdl2:get-window-size win)
    (list :width width :height height))) 

(defun get-height (win)
  (getf (get-dimensions win) :height)) 

(defun get-width (win)
  (getf (get-dimensions win) :width)) 

(defun toggle-fullscreen (win)
  (sdl2:set-window-fullscreen win (if (not (equalp *the-window-is-fullscreen* T))
                                      (setf *the-window-is-fullscreen* T)
                                      (setf *the-window-is-fullscreen* 'desktop)))) 

(defun focus (win)
  (sdl2-ffi.functions:sdl-raise-window win)) 

(defun resize (win &key width height)
  (let ((new-width (or width (get-width win)))
        (new-height (or height (get-height win))))
    (sdl2:set-window-size win new-width new-height))) 

(defun set-height (win h)
  (resize win :height h))

(defun set-width (win w)
  (resize win :width w))

(defun hide (win)
  (sdl2:hide-window win))

(defun show (win)
  (sdl2:show-window win))

(defun maximize (win)
  (sdl2:maximize-window win))

(defun minimize (win)
  (sdl2:minimize-window win))

(defun restore (win)
  (sdl2:restore-window win))

(defun update (win)
  (sdl2:update-window win))

