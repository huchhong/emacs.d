(require-package 'cmake-mode)

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))

(provide 'init-cmake)
