;;; maximization.asd
;;;
;;; Author: chiku (Takehiko Nawata, samugari.penguin@gmail.com)
;;; License: MIT License
(defsystem maximization
  :name "Maximization"
  :version "0.6.0"
  :maintainer "Takehiko Nawata"
  :author "Takehiko Nawata"
  :license "MIT License"
  :description "Rambling about the Maximization."
  :long-description ""
  :depends-on (:xport :azuki :papply :abackquote)
  :serial t
  :components ((:file "src/packages")
               (:file "src/utils")
               (:file "src/maximization")))
