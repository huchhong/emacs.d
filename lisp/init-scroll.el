(require-package 'smooth-scrolling)

(setq smooth-scroll-margin 5)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(provide 'init-scroll)
