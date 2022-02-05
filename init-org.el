(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md))

(setq org-roam-capture-templates
  '(
     ("d" "default" plain "%?"
       :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                 "#+title: ${title}\n#+roam_alias:\n#+roam_key:\n#+roam_tags:\n\n")
       :unnarrowed t)
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
