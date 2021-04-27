;;; package --- Summary
;;; Commentary:
;; config for go-mode

;;(setq gofmt-command "goimports")
;;(add-hook 'before-save-hook 'gofmt-before-save)
;;(global-set-key (kbd "C-c C-p") 'pop-tag-mark)

(use-package go-mode
  :init
  (setq gofmt-command "goimports")
  (bind-key "C-c C-p" 'pop-tag-mark)
  :hook (before-save-hook . gofmt-before-save))

;; config for go-guru
;;(require 'go-guru)
;;(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

(use-package go-guru
  :hook (go-mode . go-guru-hl-identifier-mode))


(provide 'init-go)
