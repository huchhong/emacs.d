(semantic-mode 1)

(defvar semantic-tags-location-ring (make-ring 20))

(defun semantic-goto-definition (point)
  "Goto definition using semantic-ia-fast-jump
   save the pointer marker if tag is found"
  (interactive "d")
  (condition-case err
	  (progn
		(ring-insert semantic-tags-location-ring (point-marker))
		(semantic-ia-fast-jump point))
	(error
	 ;;if not found remove the tag saved in the ring
	 (set-marker (ring-remove semantic-tags-location-ring 0) nil nil)
	 (signal (car err) (cdr err)))))

(defun semantic-pop-tag-mark ()
  "popup the tag save by semantic-goto-definition"
  (interactive)
  (if (ring-empty-p semantic-tags-location-ring)
	  (message "%s" "No more tags available")
	(let* ((marker (ring-remove semantic-tags-location-ring 0))
		   (buff (marker-buffer marker))
		   (pos (marker-position marker)))
	  (if (not buff)
		  (message "Buffer has been deleted")
		(switch-to-buffer buff)
		(goto-char pos))
	  (set-marker marker nil nil))))

(global-set-key (kbd "C-]") 'semantic-goto-definition)
(global-set-key (kbd "C-t") 'semantic-pop-tag-mark)

(defvar c-files-regex ".*\\.\\(c\\|cpp\\|h\\|hpp\\)"
  "A regular expression to match any c/c++ related files under a directory")

(defun my-semantic-parse-dir (root regex)
  "
   This function is an attempt of mine to force semantic to
   parse all source files under a root directory. Arguments:
   -- root: The full path to the root directory
   -- regex: A regular expression against which to match all files in the directory
  "
  (let (
		;;make sure that root has a trailing slash and is a dir
		(root (file-name-as-directory root))
		(files (directory-files root t)))
	;; remove current dir and parent dir from list
	(setq files (delete (format "%s." root) files))
	(setq files (delete (format "%s.." root) files))
	(while files
	  (setq file (pop files))
	  (if (not (file-accessible-directory-p file))
		  ;;if it's a file that matches the regex we seek
		  (progn (when (string-match-p regex file)
				   (save-excursion
					 (semanticdb-file-table-object file))))
		;;else if it's a directory
		(my-semantic-parse-dir file regex)))))

(defun my-semantic-parse-current-dir (regex)
  "
   Parses all files under the current directory matching regex
  "
  (my-semantic-parse-dir (file-name-directory (buffer-file-name)) regex))

(defun semantic-parse-curdir-c ()
  "
   Parses all the c/c++ related files under the current directory
   and inputs their data into semantic
  "
  (interactive)
  (my-semantic-parse-current-dir c-files-regex))

(defun semantic-parse-dir-c (dir)
  "Prompts the user for a directory and parses all c/c++ related files
   under the directory
  "
  (interactive (list (read-directory-name "Provide the directory to search in:")))
  (my-semantic-parse-dir (expand-file-name dir) c-files-regex))


(add-hook 'c-mode-common-hook
		  (lambda ()
			(add-to-list 'ac-sources 'ac-source-semantic)))

(define-key semantic-mode-map (kbd "C-c , s") 'semantic-ia-show-summary)
(define-key semantic-mode-map (kbd "C-c C-j") 'helm-semantic-or-imenu)

(global-ede-mode 1)

;; set custom project. Put following code to custom.el.
;; (ede-cpp-root-project "qemu" :file "~/qemu/vl.c"
;;					  :include-path '("/include"))

(provide 'init-semantic)
