

;;config projectile
(require 'projectile)

;;config for all-the-icons
(require 'all-the-icons)

;;config for neotree
(require 'neotree)
(global-set-key (kbd "C-c p t") 'neotree-toggle)
;;(global-set-key (kbd "C-c p t") 'neotree-projectile-action)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq-default neo-autorefresh t)

;;config imenu-list
(global-set-key (kbd "C-'") 'imenu-list-smart-toggle)'
(setq imenu-list-auto-resize t)
(setq imenu-list-after-jump-hook nil)


(provide 'init-tree)
