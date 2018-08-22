(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq user-full-name "Ege Güneş")
(setq user-mail-address "egegunes@gmail.com")

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f". helm-find-files)
	 ([f10] . helm-buffers-list)
	 ([S-f10] . helm-recentf)))
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

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
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
(setq org-log-done t)
(setq org-capture-templates
      '(("n" "note" entry (file org-default-notes-file)
	 "* %? :NOTE:\n%U\n")
        ("t" "todo" entry (file org-default-notes-file)
         "* TODO %?\n%U\n")
        ("p" "phone" entry (file org-default-notes-file)
         "* PHONE with %? :PHONE:\n%U\n")
        ("m" "meeting" entry (file org-default-notes-file)
         "* MEETING with %? :MEETING:\n%U\n")))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-compact-blocks t)

(setq inhibit-startup-screen t)

; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)
; don't use tabs to indent
(setq-default indent-tabs-mode nil)
; but maintain correct appearance
(setq-default tab-width 8)

;; Newline at end of file
(setq require-final-newline t)

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

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))
