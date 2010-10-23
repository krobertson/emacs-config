(add-to-list 'load-path "~/.emacs.d/vendor")

; custom place to save customizations
(setq custom-file "~/.emacs.d/ken/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(when (file-exists-p ".passwords") (load ".passwords"))

; (load "ken/lisp")
(load "ken/global")
(load "ken/defuns")
(load "ken/modes")
(load "ken/bindings")
(load "ken/theme")
(load "ken/misc")

; (load "ken/temp_files")
; (load "ken/github")
; (load "ken/git")
; (load "ken/todo")

(when (file-exists-p "ken/private")
  (load "ken/private"))

; (vendor 'ack)
(vendor 'haml-mode)
(vendor 'gist)
(vendor 'magit)
(vendor 'markdown-mode)
(vendor 'open-file-in-github)
(vendor 'textile-mode)
; (vendor 'tpl-mode)
(vendor 'twittering-mode)
(vendor 'whitespace)
(vendor 'yaml-mode)
