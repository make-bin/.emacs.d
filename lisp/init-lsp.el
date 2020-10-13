;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
    :hook  ((lsp-mode . lsp-enable-which-key-integration)
		   (c-mode . lsp-deferred))
    :commands (lsp lsp-deferred)
    :init (setq lsp-keep-workspace-alive nil ;; Auto kill LSP server
                lsp-enable-indentation nil
                lsp-enable-on-type-formatting nil
                lsp-auto-guess-root nil
                lsp-enable-snippet t))
;;    :config
    ;; Configure LSP Clients
;;    (use-package lsp-clients
;;      :ensure nil
;;      :functions (lsp-format-buffer lsp-organize-imports)))


;;; Optionally: lsp-ui, company-lsp
(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :init (setq lsp-ui-doc-enable t
              lsp-ui-doc-use-webkit nil
              lsp-ui-doc-delay 0
              lsp-ui-doc-include-signature t
              lsp-ui-doc-position 'at-point
              lsp-eldoc-enable-hover nil ;; Disable eldoc displays in minibuffer
              lsp-ui-sideline-enable t
              lsp-ui-sideline-show-hover nil
              lsp-ui-sideline-show-diagnostics nil
              lsp-ui-sideline-ignore-duplicate t)
  :config (setq lsp-ui-flycheck-enable t)
  :commands lsp-ui-mode)


(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :diminish
  :hook ((lsp-mode . dap-mode)
         (dap-mode . dap-ui-mode)
	     (dap-mode . dap-tooltip-mode)
         (c-mode . (lambda() (require 'dap-c)))))


(provide 'init-lsp)
