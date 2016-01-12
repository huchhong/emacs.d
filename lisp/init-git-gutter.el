(require-package 'git-gutter)

(global-git-gutter-mode +1)

(custom-set-variables
 '(git-gutter:separator-sign "|")
 '(git-gutter:always-show-separator t))
(set-face-foreground 'git-gutter:separator "yellow")



(provide 'init-git-gutter)
