(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map (kbd "RET") 'newline-and-indent))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

(provide 'init-cc-mode)
