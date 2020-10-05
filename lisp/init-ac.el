;;ycmd
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)

;; Specify how to run the server
(set-variable 'ycmd-server-command '("/usr/local/bin/python3.7" "/Users/makebin/.emacs.d/ycmd/ycmd"))
(setq ycmd-startup-timeout 5)
;; Specify a global emacs configuration
(set-variable 'ycmd-global-config "/Users/makebin/.emacs.d/ycmd/examples/.ycm_extra_conf.py")

;; Completion framework
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook #'global-company-mode)

;; Enable flycheck
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(add-hook 'after-init-hook #'global-flycheck-mode)


(provide 'init-ac)
