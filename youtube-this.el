;;; youtube-this.el --- Use emacs to watch youtube videos

;; Copyright (C) 2016 Maximilian Roquemore

;; Author: Maximilian Roquemore <maximus12793@gmail.com>
;; Version: {{VERSION}}
;; URL: https://github.com/maximus12793/youtube-this
;; Created: 2016-Oct-19 01:58:25 
;; Keywords: youtube, multimedia

;;; Commentary:

;; This package provides an interactive prompt to search
;; youtube as you code :)

;;; MIT License
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Code:


;;;###autoload
(defun youtube-this()
  (setq *qqJson* "")
  (require 'helm-config)
  (require 'helm)
  (helm-autoresize-mode 1)
  (require 'request)
  (require 'json)
  (interactive)
  (request
   "https://www.googleapis.com/youtube/v3/search"
   :params `(("part" . "snippet")
	     ("q" . ,(read-string "Search YouTube: "))
	     ("type" . "video")
	     ("maxResults" . "20")
	     ("key" . "ENTER KEY HERE"));; INSERT YOUR KEY FROM GOOGLE ACCOUNT!!!
   :parser 'json-read
   :success (function*
	     (lambda (&key data &allow-other-keys)
	       (wrapper data)));;function
   :status-code '((400 . (lambda (&rest _) (message "Got 400.")))
		  ;; (200 . (lambda (&rest _) (message "Got 200.")))
		  (418 . (lambda (&rest _) (message "Got 418."))))
   :complete (message "searching...")))


(defun tree-assoc (key tree)
  (when (consp tree)
    (destructuring-bind (x . y)  tree
      (if (eql x key) tree
	(or (tree-assoc key x) (tree-assoc key y))))))

(defun playvideo (videoId)
  (browse-url
   (concat "http://www.youtube.com/watch?v=" videoId)))


;;handle the json parsing 
(defun wrapper (*qqJson*)
  (setq *qqJson* (cdr (car *qqJson*)))
  (setq *results* '())
  (loop for x being the elements of *qqJson*
	do (push (cons (cdr (tree-assoc 'title x)) (cdr (tree-assoc 'videoId x))) *results*))
  (setq some-helm-source
	`((name . "Youtube Search Results")
	  (candidates . ,(mapcar 'car *results*))
	  (action . (lambda (candidate)
		      ;; (message-box "%s" (candidate))
		      (playvideo (cdr (assoc candidate *results*)))
		      ))))
  (helm :sources '(some-helm-source)))

(provide 'youtube-this)

;; Local Variables:
;; End:

;;; youtube-this.el ends here
