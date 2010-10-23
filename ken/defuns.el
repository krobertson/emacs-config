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
