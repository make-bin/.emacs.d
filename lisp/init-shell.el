(use-package shell-pop
  :ensure t
  :bind ("C-t" . shell-pop)
  :config
  (setq shell-pop-default-directory "/Users/kyagi/git")
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/bash") 
  (setq shell-pop-window-size 30)
  (setq shell-pop-full-span t)
  (setq shell-pop-window-position "right")
  (setq shell-pop-autocd-to-working-dir t)
  (setq shell-pop-restore-window-configuration t)
  (setq shell-pop-cleanup-buffer-at-process-exit t))

(provide 'init-shell)
