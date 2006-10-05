;;;; Demonstration/Test of using SDL (Simple Media Layer) library
;;;; using CFFI for foreign function interfacing...
;;;; (C)2006 Frank Busse
;;;; see COPYING for license

;;;; From "http://www.frank-buss.de/lisp/canvas.html"

(in-package #:sdl-examples) 

(defun line-drawing ()
  (sdl:with-init ()
    (sdl:with-display (300 300)
      (sdl:clear-display :color #(255 255 255))
      (sdl:draw-box-xy 50 50 250 250 :color #(0 255 255))
      (sdl:with-color (#(0 0 0))
	(loop for i from 50 to 250 by 5 do (sdl:draw-line-xy (- 300 i) 50 50 i))
	(sdl:draw-line-xy 250 250 250 50)
	(sdl:draw-line-xy 250 250 50 250))
      (sdl:with-events ()
	(:quit () t)
	(:keydown (:key key)
		  (if (sdl:key= key :SDLK_ESCAPE)
		      (sdl:push-quitevent)))
	(:videoexpose () (sdl:update-display))))))
