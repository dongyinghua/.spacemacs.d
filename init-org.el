;;org相关配置
(defun open-my-init-org ()
  (interactive)
  (find-file "~/.spacemacs.d/init-org.el"))
(global-set-key (kbd "<f2>") 'open-my-init-org)

;;Important Note by Spacemacs
(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md)
  (setq org-startup-indented t)
  ;;Different bullets. By default the list is set to ("◉" "○" "✸" "✿").
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))

  ;;org-mode for GTD
  (with-eval-after-load 'org-agenda
    (setq org-agenda-files "/Users/yinghuadong/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/inbox.org")
    (require 'org-projectile)
    (push (org-projectile:todo-files) org-agenda-files))

  ;;org-roam
  ;;必须要有init.el中加入(require 'org-roam-protocol)以及打开Emacs Server，否则网页抓取会出现问题
  ;;org-roam的网页抓取原理是利用 org-protocol 这样的外部程序和 Emacs 进行通信的机制
  (require 'org-roam-protocol)
  (setq org-roam-capture-templates
    '(
       ("d" "default" plain "%?"
         :target (file+head "%<%Y%m%d%H>_${slug}.org"
                   "#+latex_header:\n#+title: ${title}\n#+roam_alias:\n#+roam_key:\n#+roam_tags:\n\n")
         :unnarrowed t)
       ("p" "Paper Note" plain "* FIRST PASS\n\n ** Category\n\n** Context\n\n** Correctness\n\n** Contribution\n\n** Clarity\n * SECOND PASS\n\n* * THIRD PASS"
         :target (file+head "%<%Y%m%d%H>_${slug}.org"
                   "#+latex_header:\n#+title: ${title}\n#+roam_alias:\n#+roam_key:\n#+roam_tags:\n#+keywords:\n\n")
         :unnarrowed t
         )
       )
    )

  ;;网页抓取
  (setq org-roam-capture-ref-templates
    '(
       ("a" "Annotation" plain
         "%U ${body}\n"
         :target (file+head "${slug}.org"
                   "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n#+roam_tags:\n\n")
         ;; :immediate-finish t
         :unnarrowed t
         )
       ("r" "ref" plain "* FIRST PASS\n\n** Category\n\n** Context\n\n** Correctness\n\n** Contribution\n\n** Clarity\n\n* SECOND PASS\n\n* THIRD PASS\n\n"
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

  )
