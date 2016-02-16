(require-package 'helm)

(require 'helm-config)

(global-set-key (kbd "C-x c i") 'helm-imenu)

(provide 'init-helm)
