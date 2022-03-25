;;此文件存放与快捷键相关的配置
(defun open-my-init ()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-my-init)

(defun open-my-init-org ()
  (interactive)
  (find-file "~/.spacemacs.d/init-org.el"))
(global-set-key (kbd "<f2>") 'open-my-init-org)

(defun open-my-init-keybindings ()
  (interactive)
  (find-file "~/.spacemacs.d/init-keybindings.el"))
(global-set-key (kbd "<f3>") 'open-my-init-keybindings)

(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
;;错误跳转快捷键绑定
(global-set-key (kbd "M-n") 'flycheck-next-error)
(global-set-key (kbd "M-p") 'flycheck-previous-error)
