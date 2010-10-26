;; others
(load "ken/ruby")

;; emacs
(define-key emacs-lisp-mode-map (kbd "A-r") 'eval-buffer)

; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

; javascript / js2
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

; yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; textmate.el
(vendor 'textmate)
(textmate-mode)
(setq textmate-find-files-command "git ls-tree --full-tree --name-only -r HEAD")