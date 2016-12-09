;;; Add cmake support
(require 'cmake-mode)

(setq cmake-tab-width 4)

;;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
          auto-mode-alist))

(provide 'setup-cmake)
