(require 'cl)

;; My preferred font
;(set-face-font 'default "-apple-Mensch-medium-normal-normal-*-11-*-*-*-m-0-iso10646-1")
(set-face-font 'default "-apple-inconsolata-medium-r-normal--12-0-72-72-m-0-iso10646-1")

;; Setup ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Tabs/indentation
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Some coding preferences
(setq tags-file-name ".TAGS")
(prefer-coding-system 'utf-8)
(setq vc-handled-backends nil)
(setq gist-view-gist t)

;; Cut and paste mode
(cua-mode nil)
(setq cua-highlight-region-shift-only t)

;; Don't emulate 3 button mouse
(setq mac-emulate-three-button-mouse nil)

;; Don't confirm non-existent files
(setq confirm-nonexistent-file-or-buffer nil)

;; Auto revert when switching branches
(global-auto-revert-mode 1)

;; Prevent splash/startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; No menu mode
(menu-bar-mode -1)

;; I use version control, don't annoy me with backup files everywhere
(setq make-backup-files nil)
(setq auto-save-default nil)

;; works in both aquamacs and carbon
(when (functionp 'tool-bar-mode)
  (tool-bar-mode -1))

;; aquamacs specific
(when (boundp 'aquamacs-version)
  (one-buffer-one-frame-mode 0))

;; remove scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;; When selecting a file to visit, // will mean / and
;;; ~ will mean $HOME regardless of preceding text.
(setq file-name-shadow-tty-properties '(invisible t))
(file-name-shadow-mode 1)

;;show a marker in the left fringe for lines not in the buffer
(setq default-indicate-empty-lines t)

;; Set the frame's title. %b is the name of the buffer. %+ indicates the
;; state of the buffer: * if modified, % if read only, or - otherwise.
;; Two of them to emulate the mode line. %f for the file name
;; (absolute path actually).
(setq frame-title-format "Emacs: %b %+%+ %f")