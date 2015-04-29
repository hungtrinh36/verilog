;
; set frame size
;
(setq default-frame-plist '(width 90 height 80))
;;
;; from brad: every possibility covered!!!
;;
(setq-default default-tab-width 4)
(setq default-tab-width 4)
(setq-default tab-width 4)
(setq tab-width 4)

;;
;; remap some key bindings
;;
(define-key global-map "\C-z" 'undo)
(define-key global-map 'f12 'save-buffer)
(define-key global-map 'f2 'end-of-buffer)
(define-key global-map 'f1 'beginning-of-buffer)
(define-key global-map 'f4 'goto-line)
(define-key global-map 'f5 'query-replace)
(define-key global-map "\C-]" 'help-command)
(define-key help-map "\C-]" 'help-for-help)
(define-key global-map "\C-h" 'backward-delete-char)
(define-key global-map "\C-xl" 'goto-line)
(define-key global-map "\C-xn" 'other-window)
(define-key global-map "\C-xp" 'other-window)
(define-key global-map "\M-q" 'query-replace)
(define-key global-map "\C-i" 'self-insert-command)
;(define-key global-map "\C-h" 'backward-delete-char-untabify)

;;
;;install verilog-mode #2 (Dec 4th 00)
;;  
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))
;; Look first in the directory ~/elisp for elisp files
(prepend-path "~/elisp")
;; Load verilog mode only when needed
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; Any files that end in .v should be in verilog mode
(setq auto-mode-alist (cons  '("\\.v\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.vt\\'" . verilog-mode) auto-mode-alist))
;; Any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))
;;
;;
;;
(add-hook 'verilog-mode-hook '(lambda ()
(add-hook 'local-write-file-hooks
(lambda() (untabify (point-min) (point-max))))))
               

;(setq vlog-mode-hook 
;     '(lambda ()  
;         (progn 
;           (auto-fill-mode 1)		; Enable auto-fill-mode
;	   (abbrev-mode 1)              ; Enable abbrev-mode
;           (defvar self-insert-normally t) ; Disable matched parens
;	   ;; Two different indent styles for multi-line module statements 
;	   (setq vlog-module-multiline-to-first-port nil)
;	   ;; Set number of spaces for indent
;	   (setq mode-indent-level 4)
;	   )))
