;;; start package.el with emacs
(require 'package)

;;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)
;;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;;; initialize package.el
(package-initialize)

;;; add necessary packages
(defconst packages-list '(
			  iedit                         ;; Code refactoring (change variables)
			  yasnippet                     ;; Snipsets
			  ws-butler                     ;; Remove spaces from end of line
			  dtrt-indent                   ;; smart offsets
			  tabbar                        ;; Tabs
			  projectile                    ;; Project
			  git-gutter                    ;; Show changes in file
			  neotree                       ;; File Tree
			  cmake-mode                    ;; Show cmake syntax
			  markdown-mode                 ;; Show markdown syntax
			  smartparens                   ;; hightliht space between pairs
			  magit                         ;; git

			  ;; C++
			  irony                         ;; Auto-complete server
			  company                       ;; Auto-complete
			  company-irony
			  company-c-headers
			  company-irony-c-headers
			  flycheck-irony                ;; Code check

			  helm                          ;; Complete all
			  helm-gtags
			  helm-projectile
			  helm-ag

			  ;; Python
			  company-jedi

			  origami
			  editorconfig
			  ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package packages-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(add-to-list 'load-path "~/.emacs.d/configs")

(require 'setup-configs-init)

(require 'editorconfig)
(editorconfig-mode 1)

(desktop-save-mode 1)
