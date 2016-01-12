(require-package 'helm-gtags)

;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(eval-after-load "helm-gtags"
  '(progn
	 (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
	 (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
	 (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
	 (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
	 (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
	 (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)))


(provide 'init-ggtags)
