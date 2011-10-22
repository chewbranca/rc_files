(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages 
  '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-eshell
                starter-kit-ruby starter-kit-js clojure-mode clojure-test-mode clojurescript-mode
                markdown-mode yaml-mode magit erc-hl-nicks)
  ;; disabled rinari due to https://github.com/nonsequitur/inf-ruby/issues/1
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
