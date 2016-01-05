(require-package 'find-file-in-project)

;; {{ find-file-in-project (ffip)
(autoload 'find-file-in-project "find-file-in-project" "" t)
(autoload 'find-file-in-project-by-selected "find-file-in-project" "" t)
(autoload 'ffip-get-project-root-directory "find-file-in-project" "" t)
(setq ffip-match-path-instead-of-filename t)

(provide 'init-ffip)
