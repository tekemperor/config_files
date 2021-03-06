;
;; Enable Package Manager
(require 'package)

; Sometimes needed for outdated repo keys
;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; Package sources
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; disable backup files
(setq make-backup-files nil)

;; disable auto-save files
(setq auto-save-default nil)

;; disable start-up screen
(setq inhibit-startup-message t)

;; Enable evil-mode - package name is evil-mode
(require 'evil)
(evil-mode t)


;; Solarized theme ;;; package name is solarized-theme
;(load-theme 'solarized-light t)

;; Zenburn theme - package name is zenburn-theme
;;(load-theme 'zenburn t)


;; Enable powerline
(require 'powerline)
(powerline-default-theme)

;; Enable powerline-evil
(require 'powerline-evil)
(powerline-evil-vim-theme)

;(require 'relative-line-numbers)
;; Enable line numbering - NOT RELATIVE
;;(global-linum-mode t)
;; Enable relative line numbering linum-mode MUST BE TURNED OFF
;(global-relative-line-numbers-mode)

;; Enable automatic indentation
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching parentheses
(show-paren-mode t)


;; Rememeber cursor position in file
(require 'saveplace)
(setq-default save-place t)

;; Disable GUI scroll-bars
(scroll-bar-mode -1)

; ;; Start in fullscreen mode - all other custom face information will be
; combined into this
; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(initial-frame-alist (quote ((fullscreen . maximized))))
;  '(show-paren-mode t))

;; Highlight the current line
(global-hl-line-mode 1)

; use ibuffer by default, in place of default list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Ruler at 81 columns
(require 'fill-column-indicator)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-column 81)

;; Enable Desktop Mode to save you 'session' on exit and restore at next run
(desktop-save-mode 1)

;; Vim-like leader key
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; Bind <leader> w to write/save the file
(evil-leader/set-key "w" 'save-buffer)

;; 'kj' to go from evil insert mode -> evil normal mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)



;; Auto-wrap at 80 lines for text-mode and modes based off of it - for instance org-mode
(add-hook 'text-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 81)))
(add-hook 'text-mode-hook 'turn-on-auto-fill)


;; automatically check for files updated on disk, notify session, prompt for
;; buffer refresh (adding this for case of working on distributed org files)
(global-auto-revert-mode t)

; Insert a timestamp when toggling org item from a not-Done state to DONE
(setq org-log-done 'time)


; files for org-agenda to work with/on - TODO fill in here locally
(setq org-agenda-files '("~/LOCATION OF/org/"))

; refile targets up to 3 levels deep in all of the above
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))


; Tags should be available for use (and completion) across files
(setq org-complete-tags-always-offer-all-agenda-tags t)


; capture templates - TODO fill in here locally
; Note the metacharacters for prompting tags etc
(setq org-capture-templates '(("i" "Inbox [inbox]" entry
                               (file+headline "~/LOCATION OF/org/inbox.org" "Inbox")
                               "* %i%? %^G \n%U")
                              ))
;(setq org-capture-templates '(("i" "Inbox [inbox]" entry
;                               (file+headline "~/LOCATION OF/org/inbox.org" "Inbox")
;                               "* TODO %i%? %U %^G")
;                              ))


; binding for quick captures
(global-set-key "\C-cc" 'org-capture)

; Start in evil's insert mode when capturing
(add-hook 'org-capture-mode-hook 'evil-insert-state)

; org mode todo states
(setq org-todo-keywords '((sequence "MAYBE(m)" "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

; block parent headings from DONE states if any children are not DONE
(setq org-enforce-todo-dependencies t)

; block parent headings from DONE states if any checkboxes are unfilled
(setq org-enforce-todo-checkbox-dependencies t)


;; Common lisp / SLIME helpers for machines that need that
;(load (expand-file-name "~/.quicklisp/slime-helper.el"))
;(setq inferior-lisp-program "sbcl")

