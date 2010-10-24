; for loading libraries in from the vendor directory
(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (suffix (concat normal ".el"))
         (defunkt (concat "~/.emacs.d/defunkt/" file)))
    (cond
     ((file-directory-p normal) (add-to-list 'load-path normal) (require library))
     ((file-directory-p suffix) (add-to-list 'load-path suffix) (require library))
     ((file-exists-p suffix) (require library)))
    (when (file-exists-p (concat defunkt ".el"))
      (load defunkt))))

(defun kr-ido-find-project-file ()
  "Load a file under one of the source projects."
  (interactive)
  (ido-find-file-in-dir
    (concat "~/source/" (ido-completing-read "Project: "
                          (directory-files "~/source/" nil "^[^.]")))))

(defun kill-current-line ()
  "Kill the current line, no matter where the cursor is."
  (interactive)
  (textmate-select-line) (kill-region (region-beginning) (region-end)))

(defun tf-textmate-ext-previous-line ()
  "Insert a blank line above the cursor and move the cursor up one line."
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
  (indent-according-to-mode))

(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    ;; TODO: switch to nxml/nxhtml mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun gist-buffer-confirm (&optional private)
  (interactive "P")
  (when (yes-or-no-p "Are you sure you want to Gist this buffer? ")
    (gist-region-or-buffer private)))

(defun defunkt-clean-slate ()
  "Kills all buffers except *scratch*"
  (interactive)
  (let ((buffers (buffer-list)) (safe '("*scratch*")))
    (while buffers
      (when (not (member (car buffers) safe))
        (kill-buffer (car buffers))
        (setq buffers (cdr buffers))))))

(defun kr-mark-line ()
  "Sets the mark as the current line."
  (interactive)
  (beginning-of-line)
  (set-mark-command nil)
  (next-line))

(defun backward-delete-whitespace-to-column ()
  "delete back to the previous column of whitespace, or just one char if that's not possible. This emulates vim's softtabs feature."
  (interactive)
  (if indent-tabs-mode
    (call-interactively 'backward-delete-char-untabify)
    ;; let's get to work
    (let ((movement (% (current-column) tab-width))
      (p (point)))
    ;; brain freeze, should be easier to calculate goal
    (when (= movement 0) (setq movement tab-width))
      (if (save-excursion
        (backward-char movement)
          (string-match "^\\s-+$" (buffer-substring-no-properties (point) p)))
        (delete-region (- p movement) p)
        (call-interactively 'backward-delete-char-untabify)))))

(defun ido-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
	(find-file
    (ido-completing-read "Recentf open: "
      (mapcar (lambda (path)
        (replace-regexp-in-string home "~" path))
        recentf-list)
      nil t))))

;; Use ido to find files in tags file
(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
	(let ((enable-recursive-minibuffers t))
	  (visit-tags-table-buffer))
	(find-file
	 (expand-file-name
	  (ido-completing-read
	   "Project file: " (tags-table-files) nil t)))))

;; Find tag using ido
(defun ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
	(mapc (lambda (x)
			(unless (integerp x)
			  (push (prin1-to-string x t) tag-names)))
          tags-completion-table)
	(find-tag (ido-completing-read "Tag: " tag-names))))