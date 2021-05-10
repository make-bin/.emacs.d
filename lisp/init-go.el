;;; package --- Summary
;;; Commentary:
;; config for go-mode

;;(use-package go-mode
;;  :init
;;  (setq gofmt-command "goimports")
;;  (bind-key "C-c C-p" 'pop-tag-mark)
;;  :config
;;  (add-hook 'before-save-hook 'gofmt-before-save))

;;(use-package go-guru
;;  :config
;;  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))


(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(global-set-key (kbd "C-c C-p") 'pop-tag-mark)

;; config for go-guru
(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)



(provide 'init-go)

(provide 'init-go)
