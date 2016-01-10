(semantic-mode 1)

(add-hook 'c-mode-common-hook
		  (lambda ()
			(add-to-list 'ac-sources 'ac-source-semantic)))

(define-key semantic-mode-map (kbd "C-c , s") 'semantic-ia-show-summary)

(global-ede-mode 1)

;; set custom project
(ede-cpp-root-project "qemu" :file "~/qemu/vl.c"
					  :include-path '("/include"))

(provide 'init-semantic)
