;;; package --- Summary
;;; Commentary:
(use-package dashboard
  :ensure t
  :config
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  ;; Set the title
  (setq dashboard-banner-logo-title "大部分时间我都机制的一比")
  ;; Set the banner
  (setq dashboard-startup-banner "~/.emacs.d/image/image.png")
  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((recents  . 20)
 ;;                         (bookmarks . 5)
                          (projects . 5)))
;;                          (agenda . 5)
;;                          (registers . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-init-info " ")
  (setq dashboard-set-footer nil)
  (setq dashboard-footer-messages '("Dashboard is pretty cool!"))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
