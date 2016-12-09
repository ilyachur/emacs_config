;;; ====================  Hot Keys  ======================
;;; Open file tree by f8
;;;(global-set-key [f8] 'ecb-activate)
(global-set-key [f8] 'neotree-project-dir)

;;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
			       (interactive)
			       (setq-local compilation-read-command nil)
			       (call-interactively 'projectile-compile-project)))

;;; Switch between source/header files for C/C++
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (define-key c-mode-base-map (kbd "C-c sw") 'ff-find-other-file)))

;; Debugger
;;(global-set-key [f9]    'gdb-toggle-breakpoint)
;;(global-set-key [f10]   'gud-next)
;;(global-set-key [f11]   'gud-step)
;;(global-set-key [(shift f11)]   'gud-finish)

;; Git
(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)

(global-set-key (kbd "C-c fp") 'find-in-files)


;; Helm
;; Jump to
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


;; Smart refactoring
; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; Fold text

(global-set-key (kbd "C-c fa") 'origami-close-all-nodes)
(global-set-key (kbd "C-c sa") 'origami-open-all-nodes)
(global-set-key (kbd "C-c fc") 'origami-close-node)
(global-set-key (kbd "C-c sc") 'origami-open-node-recursively)

;;; ======================================================

(provide 'setup-keyboard)
