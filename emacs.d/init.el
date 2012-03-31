(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages 
  '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-eshell
                starter-kit-ruby starter-kit-js clojure-mode clojure-test-mode clojurescript-mode
                markdown-mode yaml-mode magit erc-hl-nicks flymake flymake-haml haml-mode highline
                buffer-move erc-hl-nicks yaml-mode window-number ipython nginx-mode
                ghc ghci-completion haskell-mode rect-mark)
  ;; disabled rinari due to https://github.com/nonsequitur/inf-ruby/issues/1
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
(require 'solarized-definitions)
;; (require 'solarized-dark-theme)
;; (require 'solarized-light-theme)
(add-to-list 'load-path "~/.emacs.d/themes/")
(require 'sunburst-theme)


;;(require 'inf-ruby)

;;(add-to-list 'load-path "~/.emacs.d/rinari")
;;(require 'rinari)




(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("aa1610894e3435eabcb008a7b782fbd83d1a3082" "5600dc0bb4a2b72a613175da54edb4ad770105aa" "0174d99a8f1fdc506fa54403317072982656f127" "9cdf9fb94f560902b567b73f65c2ed4e5cfbaafe" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eshell)
(set-face-foreground 'eshell-prompt "turquoise")
;;(set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
