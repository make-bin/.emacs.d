;;; Commentary:



(add-to-list 'load-path
	      (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(require 'init-package)
(require 'init-ui)
(require 'init-shell)
(require 'init-common)
(require 'init-window)
(require 'init-ac)
(require 'init-search)
(require 'init-tree)

;; config for go-mode
;;(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20181012.329/")
;;(autoload 'go-mode "go-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; config for go-guru
(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

;; config go staticcheck
;;(add-hook 'go-mode-hook #'flymake-go-staticcheck-enable)
;;(add-hook 'go-mode-hook #'flymake-mode)


;;打开最近编辑的文件
;;(require 'recentf)
;;(recentf-mode 1)
;;(setq recentf-max-menu-item 10)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;org文件中显示语法
(require 'org)
(setq org-src-fontify-natively t)
;; org
;;(setq org-agenda-files '("~/org"))
;;(global-set-key (kbd "C-c a") 'org-agenda)
;; 打开 org-indent mode
;;(setq org-startup-indented t)
;; 设置 bullet list
;;(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
