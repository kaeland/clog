(defpackage #:clog-user
  (:use #:cl #:clog)
  (:export start-tutorial))

(in-package :clog-user)

(defun on-new-window (body)

  (let* ((vid (create-video body :source "https://www.w3schools.com/html/mov_bbb.mp4"))
	 (tmp (create-br body))
	 (vpl (create-button body :content ">"))
	 (vst (create-button body :content "||"))
	 (vlc (create-form-element body :input))
	 (tmp (create-hr body))
	 (aud (create-audio body :source "https://www.w3schools.com/html/horse.ogg"))
	 (tmp (create-br body))
	 (apl (create-button body :content ">"))
	 (ast (create-button body :content "||"))
	 (alc (create-form-element body :input))
	 (tmp (create-hr body)))

    (set-on-click vpl (lambda (obj)(play-media vid)))
    (set-on-click apl (lambda (obj)(play-media aud)))
    (set-on-click vst (lambda (obj)(pause-media vid)))
    (set-on-click ast (lambda (obj)(pause-media aud)))

    (set-on-time-update vid (lambda (obj)(setf (value vlc) (media-position vid))))
    (set-on-time-update aud (lambda (obj)(setf (value alc) (media-position aud))))
    
  (run body)))

(defun start-tutorial ()
  "Start turtorial."

  (initialize #'on-new-window)
  (open-browser))
