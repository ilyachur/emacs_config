(require 'tabbar)

;; Note: for tabbar 2.0 use
;; tabbar-default not tabbar-default-face,
;; tabbar-selected not tabbar-selected-face,
;; tabbar-button not tabbar-button-face,
;; tabbar-separator not tabbar-separator-face
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray60")
(set-face-attribute
 'tabbar-unselected nil
 :background "gray70"
 :foreground "gray30"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "#f2f2f6"
 :foreground "black"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray72" :style released-button))
(set-face-attribute
 'tabbar-separator nil
  :height 0.7)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
    "Return a label for TAB.
That is, a string used to represent it on the tab bar."
    (let ((label  (if tabbar--buffer-show-groups
		      (format "[%s]  " (tabbar-tab-tabset tab))
		    (format "%s  " (tabbar-tab-value tab)))))
      ;; Unless the tab bar auto scrolls to keep the selected tab
      ;; visible, shorten the tab label to keep as many tabs as possible
      ;; in the visible area of the tab bar.
      (if tabbar-auto-scroll-flag
	  label
	(tabbar-shorten
	 label (max 1 (/ (window-width)
			 (length (tabbar-view
				  (tabbar-current-tabset)))))))))


;;; turn on the tabbar
(tabbar-mode t)
;;; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;;;“User Buffer”.

(defun tabbar-buffer-groups ()
    "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
:Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
    (list
     (cond
      ((string-equal "*" (substring (buffer-name) 0 1))
       "Emacs Buffer"
       )
      ((eq major-mode 'dired-mode)
       "Dired"
       )
      (t
       "User Buffer"
       )
      )))

;;(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(global-set-key [M-s-left] 'tabbar-backward)
(global-set-key [M-s-right] 'tabbar-forward)

(provide 'setup-tabs)
