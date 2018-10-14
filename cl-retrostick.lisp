;;;; cl-retrostick.lisp

(in-package #:cl-retrostick)


;; ----------
;; Utils
;; ----------

(defun system-init-video ()
  (sdl2:init :video)) 

(defun system-destroy-video ()
  (sdl2-ffi.functions:sdl-quit-sub-system sdl2-ffi:+sdl-init-video+)) 

(defun system-quit ()
  (sdl2:quit)) 



;; ----------
;; Parameters
;; ----------

;; ----------
;; Renderer
;; ----------

(defun render-get-number-render-drivers ()
  (sdl2:get-num-render-drivers))

(defun render-get-render-drivers ()
  (map-over-range (n (render-get-number-render-drivers))
    (sdl2:get-render-driver-info n)))

(defun render-make-renderer (win)
  (sdl2:create-renderer win))

(defun render-destroy-renderer (renderer)
  (sdl2:destroy-renderer renderer))

(defun render-set-color (renderer r g b a)
  (sdl2:set-render-draw-color renderer r g b a))

(defun render-get-color (renderer)
  (with-foreign-objects ((r :int)
                         (g :int)
                         (b :int)
                         (a :int))
    (sdl2-ffi.functions:sdl-get-render-draw-color renderer r g b a)
    (list :r r :g g :b b :a a)))


(defun render-clear (render)
  (sdl2:render-clear render))

(defun render-flip (renderer)
  (sdl2:render-present renderer))

;; ----------
;; Main Logic
;; ----------

(defun handle-input ()
  (format t "Handle input...~%"))

(defun handle-logic ()
  (format t "Handle logic...~%"))

(defun draw-graphics (renderer)
  (render-clear renderer)
  (render-flip renderer)
  (format t "Drawing graphics...~%"))

(defun wait (millis)
  (format t "Waiting...~%")
  (sdl2:delay millis))

;; ----------
;; Game Engine
;; ----------

(defclass Game-Engine ()
  ((fun)))

(defmethod initialize-instance :after ((game Game-Engine) &key)
  (system-init-video)
  (sb-ext:finalize game (lambda () (system-quit))))

;; ----------
;; Main
;; ----------

(defun main ()
  (sdl2:with-window (win :flags '(:shown))
    (sdl2:with-renderer (renderer win :flags '(:ACCELERATED))
      (render-set-color renderer 0 0 0 0)
      (loop for i from 0 to 10
         do (progn
              (handle-input)
              (handle-logic)
              (draw-graphics renderer)
              (wait 1000))))))
  
