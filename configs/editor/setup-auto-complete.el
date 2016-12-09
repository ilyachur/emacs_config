;;; enable company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; C++ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; enable irony-mode
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;;; replace the `completion-at-point' and `complete-symbol' bindings in
;;; irony-mode's buffers by irony-mode's function
(defun my:irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my:irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;;; enable C++17 support in clang 
(setq irony-additional-clang-options '("-std=c++1z"))

(eval-after-load 'company 
  '(add-to-list 'company-backends 'company-irony))

;;; Semantic on
(require 'semantic)
(semantic-mode 1)

;;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") 
	(backward-char 1)
      (if (looking-at "\\.") t
	(backward-char 1)
	(if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

;;(defun tab-indent-or-complete ()
;;  (interactive)
;;  (if (minibufferp)
;;      (minibuffer-complete)
;;    (if (or (not yas/minor-mode)
;;            (null (do-yas-expand)))
;;        (if (check-expansion)
;;            (company-complete-common)
;;          (indent-for-tab-command)))))
;;(global-set-key [tab] 'tab-indent-or-complete)

(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-hook 'python-mode-hook 'jedi:setup)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
  ;;(add-to-list 'company-backends '(company-jedi company-files)))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;;(setq jedi:complete-on-dot t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-auto-complete)
