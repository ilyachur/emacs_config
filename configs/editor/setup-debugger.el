(require 'gud)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(defun gud-get-process-name ()
  (let ((process (get-buffer-process gud-comint-buffer)))
	(if (null process)
		nil
	  (process-name process))))

(defconst gdb-save-folder "~/.emacs.d/gdb")

(make-directory gdb-save-folder t)

;;;###autoload
(defun gdb-save-breakpoints ()
  "Save current breakpoint definitions as a script."
  (interactive)
  (let ((gud-process-name (gud-get-process-name)))
	(cond (gud-process-name
		   (gud-basic-call
			(format "save breakpoints ~/.emacs.d/gdb/.%s-bps.gdb"
					gud-process-name))))))

;;;###autoload
(defun gdb-restore-breakpoints ()
  "Restore the saved breakpoint definitions as a script."
  (interactive)
  (let ((breakpoints-file (format "~/.emacs.d/gdb/.%s-bps.gdb" (gud-get-process-name))))
	(if (file-exists-p breakpoints-file)
		(gud-basic-call (format "source %s" breakpoints-file)))))

;;;###autoload
(defun gdb-kill-buffer ()
  "Kill gdb-buffer."
  (interactive)
  (gdb-save-breakpoints)
  (kill-buffer))

(defun gdb-breakpoint-session ()
  (gdb-restore-breakpoints)
  (local-set-key (kbd "C-x k") 'gdb-kill-buffer))
  
(add-hook 'gdb-mode-hook 'gdb-breakpoint-session)


(provide 'setup-debugger)
