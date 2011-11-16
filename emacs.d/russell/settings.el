;; Misc settings

(setq gnus-select-method '(nntp "news.gmane.org"))

(setq erc-log-channels-directory "~/.erc/logs/")


;; don't sleep emacs accidentally
(global-set-key [(control z)] nil)

;; don't add newline at end of file
(setq require-final-newline nil)

;; visual-line-mode is great for text modes
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; for erc to avoid part/join spam
(setq erc-track-exclude-types (quote ("JOIN" "NICK" "PART" "QUIT" "333" "353")))
;; Some erc config
(setq erc-user-full-name "chewbranca")
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#clojure")))

;; Give me octave, not objective c
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/src/emacs-color-theme-solarized")
;;(require 'solarized-definitions)

(setq epa-armor 't)


;; Enable window-number.el
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
numbers with the C-x C-j prefix.  Another mode,
`window-number-meta-mode' enables the use of the M- prefix."
  t)

(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line."
  t)

(window-number-mode 1)
(global-set-key "\C-c\C-j" 'window-number-select)



(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
(require 'notmuch)
;;(setq mail-header-separator "")
(add-hook 'message-mode-hook 'auto-fill-mode)
(setq notmuch-folders '(("inbox" . "tag:inbox")
						("to-me" . "tag:to-me")
						("todo" . "tag:todo")
						("unread" . "tag:unread")))


(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)
