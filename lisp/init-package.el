;;; package --- Summary
;;; Commentary:
;; melpa
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("melpa" . "https://melpa.org/packages/")
							  ("gnu"   . "http://elpa.emacs-china.org/gnu/")
							  ("org"   . "https://orgmode.org/elpa/")
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
			  ;;monokai-theme
			  spacemacs-theme
		      popwin
		      go-mode
;;			  guru-mode
			  go-guru
;;			  lsp-mode
			  ;;		  flymake-go-staticcheck
			  org-plus-contrib
		      ycmd
		      company-ycmd
		      flycheck-ycmd
			  all-the-icons
			  neotree
			  imenu-list
			  helm-ag
			  shell-pop
			  projectile
			  yaml-mode
			  ace-window
			  compile
			  json
			  cl-lib
			  use-package
			  markdown-mode
			  dashboard
			  dash
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


(provide 'init-package)
