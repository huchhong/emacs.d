(require-package 'yasnippet)

(require 'yasnippet)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-yasnippet)
