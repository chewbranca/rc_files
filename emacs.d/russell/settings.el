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
