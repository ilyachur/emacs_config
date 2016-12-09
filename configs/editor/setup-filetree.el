;;;(require 'ecb)

;;;(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)

(require 'neotree)

(setq neo-smart-open t)

(setq-default neo-show-hidden-files t)
(setq neo-window-fixed-size nil)

;;; When running projectile-switch-project (C-c p p), neotree will change root automatically.
(setq projectile-switch-project-action 'neotree-projectile-action)

(defun projectile-open-current-file-in-tree ()
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-projectile-action)
    (neotree-find file-name)
    )
  )

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (if (neo-global--window-exists-p)
      (neotree-hide)
    (if (projectile-project-p) (projectile-open-current-file-in-tree) (neotree-show))

     )
  )

(provide 'setup-filetree)
