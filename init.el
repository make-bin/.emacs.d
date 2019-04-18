;;; Commentary:

;;; Code:
;;;(add-to-list 'load-path "~/.emacs.d/lisp/")
;;;(require 'go-mode)
;;;(add-hook 'before-save-hook 'gofmt-before-save)

;;config PATH use shell path
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

;; melpa
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
;; cl - Common Lisp Extension
(require 'cl)
;; Add Packages
(defvar my/packages '(
	              ;; --- Auto-completion ---
		      company
		      hungry-delete
		      swiper
		      counsel
		      smartparens
	              ;; --- Themes ---
			  monokai-theme
			  spacemacs-theme
		      popwin
		      go-mode
		      ycmd
		      company-ycmd
		      flycheck-ycmd
			  all-the-icons
			  neotree
			  imenu-list
			  helm-ag
			  shell-pop
	       ;; solarized-theme
	       ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; config for go-mode
;;(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20181012.329/")
;;(autoload 'go-mode "go-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'before-save-hook 'gofmt-before-save)



;;config for spacemacs-theme'
(require 'spacemacs-common)
(deftheme spacemacs-dark "Spacemacs theme,the dark version")
(create-spacemacs-theme 'dark 'spacemacs-dark)
(provide-theme 'spacemacs-dark)
;;加载主题
;;(load-theme 'monokai t)
(load-theme 'spacemacs-dark t)

;;config for all-the-icons
(require 'all-the-icons)

;;config for neotree
(require 'neotree)
(global-set-key (kbd "C-c p t") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;config imenu-list
(global-set-key (kbd "C-'") 'imenu-list-smart-toggle)'
(setq imenu-list-auto-resize t)
(setq imenu-list-after-jump-hook nil)


;;config for helm-ag
(require 'helm-ag)
(global-set-key (kbd "C-c s f") 'helm-do-ag-this-file)
(global-set-key (kbd "C-c s p") 'helm-ag-project-root)

;;config for shell-pop
(require 'shell-pop)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
	("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-fuzzy-match t)
 '(helm-ag-ignore-buffer-patterns (quote ("\\.txt\\'" "\\.mkd\\'")))
 '(helm-ag-insert-at-point (quote symbol))
 '(package-selected-packages
   (quote
	(adjust-parens company hungry-delete swiper counsel smartparens monokai-theme spacemacs-theme popwin go-mode ycmd company-ycmd flycheck-ycmd neotree)))
 '(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
	("ansi-term" "*ansi-term*"
	 (lambda nil
	   (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "right")
 '(shell-pop-window-size 30)
 '(spacemacs-theme-custom-colors
   (quote
	((act1 . "#ff0000")
	 (act2 . "#0000ff")
	 (var . "#756df7")
	 (base . "#ffffff")))))




;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;;f2 打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;;开启全局补全
(global-company-mode t)

;;关闭备份文件
(setq make-backup-files nil)

;;光标定位到新buffer窗口
(require 'popwin)
(popwin-mode 1)

;;关闭自动保存
(setq auto-save-default nil) 

;;打开最近编辑的文件
;;(require 'recentf)
;;(recentf-mode 1)
;;(setq recentf-max-menu-item 10)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;org文件中显示语法
(require 'org)
(setq org-src-fontify-natively t)

;;选中删除替换
(delete-selection-mode t)

;;打开全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;自动补全括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;显示当前行高亮
(global-hl-line-mode t)

;;加载插件
(require 'hungry-delete)
(global-hungry-delete-mode)

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


;;config for smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;set tab width with 4
(setq-default tab-width 4)

;; find key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; org
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


;;ycmd
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)

;; Specify how to run the server
(set-variable 'ycmd-server-command '("python" "/Users/makebin/.emacs.d/ycmd/ycmd"))
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



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
