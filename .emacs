(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org ##))))

(ido-mode 1)
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
(setq org-outline-path-complete-in-steps nil)
(setq org-completion-use-ido t)
(setq ido-everywhere t)
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

(setq inhibit-splash-screen t)
(org-agenda-list)
(delete-other-windows)
