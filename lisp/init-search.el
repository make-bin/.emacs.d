;;;config for helm-ag


(use-package helm-ag
  :ensure nil
  :config
  (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
  (setq helm-ag-command-option "--all-text")
  (setq helm-ag-fuzzy-match t)
  (setq helm-ag-use-temp-buffer t)
  (setq helm-ag-ignore-buffer-patterns (quote ("\\.txt\\'" "\\.mkd\\'")))
  (setq helm-ag-insert-at-point (quote symbol)))

(global-set-key (kbd "C-c s f") 'helm-do-ag-this-file)
(global-set-key (kbd "C-c s p") 'helm-ag-project-root)


;;config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-c p f") 'counsel-git)


(provide 'init-search)
