(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(require-package 'company)
(require-package 'elpy)


(defun python-mode-hook-setup ()
  ;; run command `pip install jedi flake8 importmagic autopep8 yapf` in shell,
  ;; or just check https://github.com/jorgenschaefer/elpy
  (elpy-mode 1)
  ;; http://emacs.stackexchange.com/questions/3322/python-auto-indent-problem/3338#3338
  ;; emacs 24.4 only
  (setq electric-indent-chars (delq ?: electric-indent-chars))
  (define-key python-mode-map (kbd "M-,") 'pop-tag-mark)
  (setq python-shell-interpreter "ipython")
  )

(add-hook 'python-mode-hook 'python-mode-hook-setup)

(provide 'init-python-mode)
