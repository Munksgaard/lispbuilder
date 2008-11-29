
(in-package #:lispbuilder-sdl-ttf)

(defclass ttf-font (sdl::font sdl::foreign-object)
  ((font-style :accessor font-style :initform nil :initarg :style)
   (font-encoding :accessor font-encoding :initform nil :initarg :encoding)
   (generation :accessor generation :initform *generation* :initarg :generation))
  (:default-initargs
   :gc t
    :free (let ((font-generation *generation*))
	    #'(lambda (fp)
		(when (and (is-init)
			   (= (is-init) font-generation))
		  (sdl-ttf-cffi::ttf-close-font fp)))))
  (:documentation
   "A `FONT` object is wrapper around a foreign `TTF_Font` object. 

The `FONT` object maintains the most recent surface `SDL:SURFACE` created by a call to any of the 
`RENDER-STRING*` functions. Use [DRAW-FONT](#draw-font), [DRAW-FONT-AT](#draw-font-at) 
or [DRAW-FONT-AT-*](#draw-font-at-*) to draw the cached surface.

Prior to the first call to a `RENDER-STRING*` function, the cached surface is `NIL`."))

(defmethod set-default-font ((font ttf-font))
  (setf sdl:*default-font* font)
  font)

