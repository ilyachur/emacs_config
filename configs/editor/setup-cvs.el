;;; git
;;; magit
(require 'magit)

(require 'git-gutter)

(global-git-gutter-mode t)

(git-gutter:linum-setup)

(setq git-gutter:modified-sign "~") ;; two space
(setq git-gutter:added-sign "+")    ;; multiple character is OK
(setq git-gutter:deleted-sign "-")
(setq git-gutter:separator-sign "|")


(set-face-foreground 'git-gutter:separator "black")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
(set-face-foreground 'git-gutter:modified "yellow")

(provide 'setup-cvs)
