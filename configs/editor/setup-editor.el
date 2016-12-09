;;; paren matching
(show-paren-mode t)
(setq show-paren-style 'expression)

;;; Trim spaces at the end of line
;;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Enamle line numbers
(global-linum-mode t)
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
    (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)

;; Enable CUA mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)     ;; Don't tabify after rectangle commands
(transient-mark-mode 1)                   ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t)       ;; Standard Windows behaviour

;; dealing with pairs
;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;;; Smart indents
;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Text scale
(define-globalized-minor-mode 
    global-text-scale-mode
    text-scale-mode
    (lambda () (text-scale-mode 1)))
  
(defun global-text-scale-adjust (inc) (interactive)
	(text-scale-set 1)
	(kill-local-variable 'text-scale-mode-amount)
	(setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
	(global-text-scale-mode 1)
	)

;; Find string in project
(defun find-in-files ()
  (interactive)
   (if (projectile-project-p) (helm-projectile-grep) (helm-do-ag))
   )

;; Improve performance
(setq projectile-mode-line "Projectile")

;; Fold test

(require 'origami)

(add-hook 'prog-mode-hook
	  (lambda () (origami-mode)))

(provide 'setup-editor)
