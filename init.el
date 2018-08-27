(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq user-full-name "Ege Güneş")
(setq user-mail-address "egegunes@gmail.com")

; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq confirm-kill-emacs 'y-or-n-p)

; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-screen t)

; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)
; don't use tabs to indent
(setq-default indent-tabs-mode nil)
; but maintain correct appearance
(setq-default tab-width 8)

;; Newline at end of file
(setq require-final-newline t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

; Display time in mode line
(display-time-mode 1)
; do not show menu bar
(menu-bar-mode -1)
; do not show tool bar
(tool-bar-mode -1)
; do not show scroll bar
(scroll-bar-mode -1)
; show matching parentheses
(show-paren-mode 1)
; show line numbers
(global-linum-mode t)
; show line number in mode line
(line-number-mode t)
; show column number in mode line
(column-number-mode t)
; show file size in mode line
(size-indication-mode t)
; highlight current line
(global-hl-line-mode +1)
;; Remove text in active region if inserting text
(delete-selection-mode 1)

(define-minor-mode disable-mouse-mode
  "A minor-mode that disables all mouse keybinds."
  :global t
  :lighter " 🐭"
  :keymap (make-sparse-keymap))

(dolist (type '(mouse down-mouse drag-mouse
                      double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    (dotimes (n 7)
      (let ((k (format "%s%s-%s" prefix type n)))
        (define-key disable-mouse-mode-map
          (vector (intern k)) #'ignore)))))

(disable-mouse-mode 1)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'dark
        sml/no-confirm-load-theme t)
  (sml/setup))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f". helm-find-files)
	 ("C-x b" . helm-mini)
	 ("M-y" . helm-show-kill-ring))
  :config (setq helm-buffers-fuzzy-matching t
                helm-recentf-fuzzy-match    t))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark t))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package projectile
  :ensure t
  :bind (("s-p" . projectile-command-map)
         ("C-c p" . projectile-command-map))
  :config (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :bind ("M-p" . helm-projectile-find-file)
  :config (helm-projectile-on))

(use-package go-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))

(use-package php-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode)))

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-directory (expand-file-name "~/Dropbox/org"))
(setq org-agenda-files (list "~/Dropbox/org"
                             "~/Dropbox/org/work"
                             "~/Dropbox/org/calendar"))
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
(setq org-refile-allow-creating-parent-nodes (quote confirm))
(setq org-refile-use-outline-path t)
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "AGENDA(a)" "WAITING(w@)" "|" "DONE(d)")
              (sequence "PROJECT(p)" "|" "DONE(d)" "CANCELLED(c@)"))))
(setq org-log-done t)
(setq org-capture-templates
      '(("n" "note" entry (file org-default-notes-file)
	 "* %?")
        ("t" "todo" entry (file org-default-notes-file)
         "* TODO %?")
        ("a" "agenda" entry (file org-default-notes-file)
         "* AGENDA %?")
        ("p" "phone" entry (file org-default-notes-file)
         "* PHONE with %? :PHONE:\n%U\n")
        ("m" "meeting" entry (file org-default-notes-file)
         "* MEETING with %? :MEETING:\n%U\n")))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-compact-blocks t)

(defun eg/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

(add-hook 'org-mode-hook 'eg/org-mode-hook)
