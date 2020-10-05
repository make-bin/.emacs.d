;;config for helm-ag
(require 'helm-ag)
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
