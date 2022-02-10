;;org
(defun open-my-init-org ()
  (interactive)
  (find-file "~/.spacemacs.d/init-org.el"))
(global-set-key (kbd "<f2>") 'open-my-init-org)

(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md)
  (setq org-startup-indented t))

;;org-roam
;;必须要有init.el中加入(require 'org-roam-protocol)以及打开Emacs Server，否则网页抓取会出现问题
;;org-roam的网页抓取原理是利用 org-protocol 这样的外部程序和 Emacs 进行通信的机制
(require 'org-roam-protocol)
(setq org-roam-capture-templates
  '(
     ("d" "default" plain "%?"
       :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                 "#+title: ${title}\n#+roam_alias:\n#+roam_key:\n#+roam_tags:\n\n")
       :unnarrowed t)
     ("p" "Paper Note" plain "* 相关工作\n\n%?\n* 观点\n\n* 模型和方法\n\n* 实验\n\n* 结论\n"
       :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                 "#+title: ${title}\n#+roam_alias:\n#+roam_tags:\n\n")
       :unnarrowed t
       )
     )
  )
(setq org-roam-capture-ref-templates
  '(
     ("a" "Annotation" plain
       "%U ${body}\n"
       :target (file+head "${slug}.org"
                 "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n#+roam_tags:\n\n")
       ;; :immediate-finish t
       :unnarrowed t
       )
     ("r" "ref" plain ""
       :target (file+head "${slug}.org"
                 "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n#+roam_tags:\n\n")
       :unnarrowed t)
     )
  )

(use-package org-roam-ui
  :after org-roam
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
    org-roam-ui-follow t
    org-roam-ui-update-on-save t
    org-roam-ui-open-on-start t)
  )

(use-package org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :bind (:map org-mode-map
          (("C-c n a" . orb-note-actions))))
