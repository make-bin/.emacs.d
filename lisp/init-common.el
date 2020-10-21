;;; package --- Summary
;;; Commentary:
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 字体大小
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

;; 显示行号
(global-linum-mode 1)
;;(setq display-line-numbers-mode t)

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


(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-common)
