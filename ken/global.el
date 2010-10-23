(require 'cl)
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(setq tags-file-name ".TAGS")
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq mac-emulate-three-button-mouse nil)
(setq cua-highlight-region-shift-only t)
(prefer-coding-system 'utf-8)
(setq vc-handled-backends nil)
(cua-mode nil)
(setq gist-view-gist t)
(menu-bar-mode -1)

(set-face-font 'default "-apple-Mensch-medium-normal-normal-*-11-*-*-*-m-0-iso10646-1")

;; works in both aquamacs and carbon
(when (functionp 'tool-bar-mode)
  (tool-bar-mode -1))

;; aquamacs specific
(when (boundp 'aquamacs-version)
  (one-buffer-one-frame-mode 0))

;; remove scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
