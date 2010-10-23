(add-to-list 'load-path "~/.emacs.d/vendor")

; custom place to save customizations
(setq custom-file "~/.emacs.d/ken/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(when (file-exists-p ".passwords") (load ".passwords"))

; (load "ken/lisp")
(load "ken/global")
(load "ken/defuns")
; (load "ken/bindings")
; (load "ken/modes")
; (load "ken/theme")
; (load "ken/temp_files")
; (load "ken/github")
; (load "ken/git")
; (load "ken/todo")

(when (file-exists-p "ken/private")
  (load "ken/private"))

; (vendor 'ack)
; (vendor 'cheat)
(vendor 'magit)
(vendor 'gist)
; (vendor 'growl)
; (vendor 'twittering-mode)
; (vendor 'textile-mode)
(vendor 'yaml-mode)
; (vendor 'tpl-mode)
(vendor 'open-file-in-github)
