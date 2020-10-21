;;; package --- Summary
;;; Commentary:
;;config for spacemacs-theme'
(require 'spacemacs-common)
(deftheme spacemacs-dark "Spacemacs theme,the dark version")
(create-spacemacs-theme 'dark 'spacemacs-dark)
(provide-theme 'spacemacs-dark)
;;加载主题
;;(load-theme 'monokai t)
(load-theme 'spacemacs-dark t)

(provide 'init-ui)
