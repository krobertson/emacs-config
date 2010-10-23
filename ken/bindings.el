; (global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-c\C-g" 'gist-buffer-confirm)
(global-set-key [(control shift k)] 'kill-current-line)
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [f8] 'delete-window)
(global-set-key [(meta H)] 'delete-other-windows)

(global-set-key (kbd "C-x C-d") 'kr-ido-find-project-file)

(define-key *textmate-mode-map* [(meta /)] 'comment-or-uncomment-region-or-line)
(define-key *textmate-mode-map* [C-return] 'tf-textmate-ext-previous-line)
(define-key *textmate-mode-map* (kbd "M-[") 'align)
(define-key *textmate-mode-map* (kbd "A-t") 'new-tab)

(global-set-key [C-tab] 'other-window)
