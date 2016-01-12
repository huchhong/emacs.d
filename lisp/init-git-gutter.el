(require-package 'git-gutter)

(global-git-gutter-mode +1)

(custom-set-variables
 '(git-gutter:separator-sign "|")
 '(git-gutter:always-show-separator t))
(set-face-foreground 'git-gutter:separator "yellow")

(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

(provide 'init-git-gutter)
