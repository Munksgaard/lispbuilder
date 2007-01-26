;;; -*- lisp -*-

(in-package #:lispbuilder-sdl-ttf-cffi) 

#+win32(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew (merge-pathnames "../bin/" (directory-namestring (or *load-truename* *default-pathname-defaults*)))
	   cffi:*foreign-library-directories*
	   :test #'equal))

(cffi:define-foreign-library sdl-ttf
  (:darwin (:framework "libSDL_ttf-2.0"))
  (:windows (:or "SDL_ttf.dll" "SDL_ttf2.0.dll"))
  (:unix (:or "libSDL_ttf2.0" "libSDL_ttf-2.0.so.0")))

(cffi:define-foreign-library sdl-ttf-glue
  (:windows "ttf_glue.dll"))

(cffi:use-foreign-library sdl-ttf)
(cffi:use-foreign-library sdl-ttf-glue)