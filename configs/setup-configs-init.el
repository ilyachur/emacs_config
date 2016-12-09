
(add-to-list 'load-path "~/.emacs.d/configs/file_types")
(add-to-list 'load-path "~/.emacs.d/configs/editor")

(require 'setup-common)
(require 'setup-file_types-init)
(require 'setup-editor-init)
(require 'setup-keyboard)
(require 'setup-mouse)

(provide 'setup-configs-init)
