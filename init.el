;;; Commentary:
(add-to-list 'load-path
	      (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-path)
(require 'init-package)
(require 'init-ui)
(require 'init-shell)
(require 'init-common)
(require 'init-window)
(require 'init-ac)
(require 'init-search)
(require 'init-tree)
(require 'init-markdown)
;;(require 'init-lsp)
(require 'init-go)



