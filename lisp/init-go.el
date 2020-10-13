;; config for go-mode
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; config for go-guru
(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)


(provide 'init-go)
