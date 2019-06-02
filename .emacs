;;; configuration file of emacs
;;; powered by lin zhang
;;; last modified date: 10/10/08

;;; set global keys
(global-set-key [f8] 'other-window)
(global-set-key [f9] 'list-bookmarks)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key [?\C-2] 'set-mark-command)
(global-set-key (kbd "C-w") 'mix-kill-region)
(global-set-key (kbd "M-w") 'mix-kill-ring-save)
(global-set-key (kbd "C-o") 'next-new-line)
(global-set-key (kbd "C-;") 'delete-this-line)
(global-set-key (kbd "M-n") 'next-n-lines)
(global-set-key (kbd "M-p") 'previous-n-lines)
(global-set-key (kbd "C-.") 'ska-point-to-register)
(global-set-key (kbd "C-,") 'ska-jump-to-register)
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x C-w") 'kill-word)
(global-set-key (kbd "C-x w") 'copy-word)
(global-set-key (kbd "C-x C-p") 'kill-paragraph)
(global-set-key (kbd "C-x p") 'copy-paragraph)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r p") 'rm-set-mark)
(global-set-key (kbd "M-[") 'kill-till-next-paren)
(global-set-key (kbd "M-]") 'kill-till-before-paren)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-auto-revert-mode 1)

(setq mac-option-key-is-meta nil)
;;(setq mac-command-key-is-meta t)

;;; rect-mark
;; (require 'rect-mark)

;;; ido
;;(require 'ido)
;;(ido-mode t)

;;; highlight-regexp
;;(require 'highlight-regexp)

;;; dired
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; Line number
(require 'linum)
(global-linum-mode t)

;;; package
(require 'package)
(setq package-archives '(("gnu"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
						 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;; Some common properties
(setq inhibit-startup-message t)
(setq default-tab-width 4)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq track-eol t)
(setq suggest-key-bindings 1)
(setq kill-ring-max 200)
(setq custom-file "~/.emacs.d/.abbrev_defs")
(fset 'yes-or-no-p 'y-or-n-p)
(column-number-mode 1)
(blink-cursor-mode 1)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(icomplete-mode 1)
(transient-mark-mode t)
(setq default-fill-column 60)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs@%b")
(auto-image-file-mode t)
(setq visible-bell t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq x-select-enable-clipboard t)
(setq-default truncate-partial-width-windows t)
(setq inhibit-splash-screen t)
(put 'narrow-to-region 'disabled nil)
;;(tool-bar-mode nil)
(menu-bar-mode nil)
;;(scroll-bar-mode nil)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq require-final-newline t)
(ansi-color-for-comint-mode-on)


;;; Version and backup related
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions 5)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)

;;; Font lock mode related
(setq font-lock-maximum-decoration t)
(setq font-lock-global-modes '(not shell-mode text-mode))
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))
(setq lazy-lock-defer-on-scrolling t)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

;;; Coding related
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

;;; Set color
(set-foreground-color "wheat")
(set-background-color "gray15")
(set-face-background 'highlight "slate blue")
(set-face-foreground 'highlight "white")
(set-face-background 'region "slate blue")
(set-face-background 'secondary-selection "turquoise")
(setq search-highlight t)
(set-cursor-color "gold1")

;;; ess
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/ess/")
(load "ess-site")

;;; go-mode
;;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/go/")
;;;(require 'go-mode-autoloads)

;;; Customized functions
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		          char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-c a") 'wy-go-to-char)

(defun mix-kill-ring-save (&optional n)
  "If region is active, copy region. Otherwise, copy line."
  (interactive "p")
  (if mark-active
      (kill-ring-save (region-beginning) (region-end))
    (if (> n 0)
        (kill-ring-save (line-beginning-position) (line-end-position n))
      (kill-ring-save (line-beginning-position n) (line-end-position)))))

(defun mix-kill-region (&optional n)
  "If region is active, kill region. Otherwise, kill line."
  (interactive "p")
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (if (> n 0)
	(kill-region (line-beginning-position) (line-end-position n))
      (kill-region (line-beginning-position n) (line-end-position)))))

(defun next-n-lines (&optional number)
  "Go down 5 lines."
  (interactive "p")
  (or (> number 5) (setq number 5))
  (let ((count 0))
    (while (< count number)
      (next-line)
      (setq count (1+ count)))
    count))

(defun previous-n-lines (&optional number)
  "Go up 5 lines."
  (interactive "p")
  (or (> number 5) (setq number 5))
  (let ((count 0))
    (while (< count number)
      (previous-line)
      (setq count (1+ count)))
    count))

(defun next-new-line ()
  "Add a new line next to current line."
  (interactive)
  (end-of-line)
  (newline)
  (indent-according-to-mode))

(defun delete-this-line ()
  "Delete current line no matter where the cursor is."
  (interactive)
  (beginning-of-line)
  (kill-line))

(defun ska-point-to-register()
  "Store cursor position _fast_ in a register.
Use ska-jump-to-register to jump back to the stored position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursor position and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

(defun copy-line (&optional arg)
  "Save current line into kill-ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position))
		(end (line-end_position arg)))
	(copy-region-as-kill beg end))
)

(defun copy-word (&optional arg)
  "Copy word at point"
  (interactive "P")
  (save-excursion
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
		(end (progn (forward-word arg) (point))))
	(copy-region-as-kill beg end)))
)

(defun kill-word (&optional arg)
  "Kill word at point"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
		(end (progn (forward-word arg) (point))))
	(kill-region beg end))
)

(defun copy-paragraph (&optional arg)
  "Copy paragraph at point"
  (interactive "P")
  (save-excursion
  (let ((beg (progn (backward-paragraph 1) (point)))
		(end (progn (forward-paragraph arg) (point))))
	(copy-region-as-kill beg end)))
)

(defun kill-paragraph (&optional arg)
  "Copy paragraph at point"
  (interactive "P")
  (let ((beg (progn (backward-paragraph 1) (point)))
		(end (progn (forward-paragraph arg) (point))))
	(kill-region beg end))
)

(defun kill-till-next-paren (&optional arg)
  "Kill to the next paren"
  (interactive "P")
  (let ((beg (point))
		(end (progn (forward-list) (point))))
	(kill-region beg end))
)

(defun kill-till-before-paren (&optional arg)
  "Kill to the paren ahead"
  (interactive "P")
  (let ((end (point))
		(beg (progn (backward-list) (point))))
	(kill-region beg end))
)

;;; Auto complete
(defun my-Inserting (sta stb stc)
  (if (= (preceding-char) sta )
      (insert stb)
    (progn (insert stc) (backward-char 1))))

(defun inserting-quotes (sta stb stc std)
  (cond ((= (preceding-char) sta) (insert stc))
		((= (following-char) stb) (forward-char))
		(t (progn (insert std) (backward-char 1)))))

(defun no-auto-complete (sta stb)
  (cond ((= (preceding-char) sta) (insert stb))
		((= (following-char) stb) (forward-char))
		(t (insert stb))))

(defun press-tab ()
  (interactive "*")
  (cond ((= (following-char) ?\)) (forward-char))
		((= (following-char) ?\") (forward-char))
		((= (following-char) ?\') (forward-char))
		((= (following-char) ?\]) (forward-char))
		((= (following-char) ?\}) (forward-char))
		(t (lisp-indent-line))))

(defun my-braces () (interactive "*") (my-Inserting ?\\ "{"  "{}"))
(defun left-parent () (interactive "*") (my-Inserting ?\\ "("  "()"))
(defun left-brackt () (interactive "*") (my-Inserting ?\\ "["  "[]"))
(defun left-angle () (interactive "*") (my-Inserting ?\\ "<" "<>"))
(defun double-quote () (interactive "*") (inserting-quotes ?\\ ?\" "\""  "\"\""))
(defun single-quote () (interactive "*") (inserting-quotes ?\\ ?\' "\'"  "\'\'"))
(defun right-parent () (interactive "*") (no-auto-complete ?\\ ?\)))
(defun right-brackt () (interactive "*") (no-auto-complete ?\\ ?\]))
(defun right-angle () (interactive "*") (no-auto-complete ?\\ ?\>))

(add-hook 'python-mode-hook
      '(lambda ()
         ;; in python
         (local-set-key  "{" 'my-braces)
         (local-set-key  "(" 'left-parent)
         (local-set-key  "[" 'left-brackt)
		 (local-set-key  "\"" 'double-quote)
		 (local-set-key  "\'" 'single-quote)
		 (local-set-key  ")" 'right-parent)
		 (local-set-key  "]" 'right-brackt)))

(add-hook 'java-mode-hook
		  '(lambda ()
			 ;; in java
			 (local-set-key "(" 'left-parent)
			 (local-set-key "[" 'left-brackt)
			 (local-set-key ")" 'right-parent)
			 (local-set-key "]" 'right-brackt)
			 (local-set-key "\"" 'double-quote)
			 (local-set-key "\'" 'single-quote)
			 (local-set-key [tab] 'press-tab)))

(add-hook 'xml-mode-hook
		  '(lambda ()
			 ;; in xml
			 (local-set-key "<" 'left-angle)
			 (local-set-key ">" 'right-angle)
			 (local-set-key "\"" 'double-quote)
			 (local-set-key "\'" 'single-quote)))


(add-hook 'html-mode-hook
		  '(lambda ()
			 ;; in html
			 (local-set-key "<" 'left-angle)
			 (local-set-key ">" 'right-angle)
			 (local-set-key "\"" 'double-quote)
			 (local-set-key "\'" 'single-quote)))

; auto complete for java
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe))

(add-hook 'java-mode-hook 'my-c-mode-auto-pair)

;;; File type associate
(setq auto-mode-alist
	  (append '(("\\.py$" . python-mode)
				("\\.java$" . java-mode)
				) auto-mode-alist))

(setq interpreter-mode-alist
	  (cons '("python" . python-mode)
			interpreter-mode-alist))

(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-complete-file-name-partially
		try-complete-file-name
		try-expand-all-abbrevs
		try-expand-list
		try-expand-line
		try-complete-lisp-symbol-partially
		try-complete-lisp-symbol))

(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))


;; ecb
;; (require 'ecb)
;; (setq ecb-auto-activate t
;;	  ecb-tip-of-the-day nil)
