;(set-language-environment "UTF-8")
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil) 
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
 
;; Setting up use-package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; (package-refresh-contents)
; (package-install 'evil)
; (package-install 'helm)
; (package-install 'evil-org)
; (package-install 'darcula)

;; (require 'diminish)
;; (require 'bind-key)
;; Use-package setup complete
;; ------------------------------------------------------------------------------------------------------

;; (setq package-enable-at-startup nil)
;; (package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("92747def068bb9aefaeacc149913ab8c349da57ceff2b86ed977995dfe6785b9" "fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "b11699e28cc2f6c34fa6336e67d443be89fadb6a9b60de0b1594f31340ea87e4" "c19e5291471680e72d8bd98f8d6e84f781754a9e8fc089536cda3f0b7c3550e3" "6973f93f55e4a6ef99aa34e10cd476bc59e2f0c192b46ec00032fe5771afd9ad" "b055150f79035245ae2a0d22d75eed138343223604e83c9d3babad28c9268589" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" default))
 '(helm-completion-style 'emacs)
 '(inhibit-startup-screen t)
 '(org-id-link-to-org-use-id t)
 '(package-selected-packages
   '(eshell-toggle which-key use-package gruvbox-theme poet-theme parchment-theme evil-org spacemacs-theme dracula-theme helm evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Evil mode setup
(require 'evil)
(evil-mode t)

;; HELM config from https://tuhdo.github.io/helm-intro.html
;; ------------------------------------------------------------------------------------------------------
(require 'helm)
(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
; (global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-apropos-fuzzy-match t)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

;; DOESNOT WORK Use variable width font faces in current buffer
(defun my-buffer-face-mode-variable ()
  "Set font to a variable width (proportional) fonts in current buffer"
  (interactive)
  (setq buffer-face-mode-face '(:family "Consolas" :height 100 :width semi-condensed))
  (buffer-face-mode))
(defun my/helm-fonts ()
  (face-remap-add-relative 'default :family "Source Code Pro"))

;(add-hook 'helm-major-mode-hook #'my/helm-fonts)
(add-hook 'helm-major-mode-hook 'my-buffer-face-mode-variable)
;(add-hook 'helm-minibuffer-set-up-hook 'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)
;; HELM config end
;; ------------------------------------------------------------------------------------------------------

;; Flyspell mode setup
;;(use-package flyspell
;;  :init
;;  (setq ispell-program-name "C:/ProgramData/chocolatey/bin/hunspell")
;;  ; (setq ispell-local-dictionary "en_US") 
;;  (setq ispell-local-dictionary-alist
;;      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))
;;      )
;;  :hook (prog-mode . flyspell-prog-mode)
;;   (text-mode . flyspell-mode)
;;  )
;;   (setq ispell-really-hunspell t)
;;   :hook (prog-mode . flyspell-prog-mode)
;;   (text-mode . flyspell-mode))
;; Flyspell setup end
;; ------------------------------------------------------------------------------------------------------
;;Company mode setup
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))
;;(add-hook 'after-init-hook 'global-company-mode) - Recommended officially
;; use company mode everywhere
(global-company-mode t)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(setq company-idle-delay 0.0)
;; ------------------------------------------------------------------------------------------------------

;; Org mode setup
;; TODO: below hook is null
(add-hook 'org-mode-hook (lambda ()(add-to-list 'org-latex-logfiles-extensions "tex")))
;; Org GOTO 
;; reddit: https://www.reddit.com/r/emacs/comments/69mc6l/how_to_jump_directly_to_an_orgheadline/
;; stackoverflow: https://emacs.stackexchange.com/questions/32617/how-to-jump-directly-to-an-org-headline
(setq org-goto-interface 'outline-path-completion)
(setq org-imenu-depth 6)
(define-key (current-global-map) [remap org-goto] 'helm-imenu)
(setq imenu-auto-rescan t)

; enable evil-org                                                                  
(require 'evil-org)                                                                
(add-hook 'org-mode-hook 'evil-org-mode) 
;; ------------------------------------------------------------------------------------------------------
;; Org mode setup

;; Theming
;; ------------------------------------------------------------------------------------------------------
(set-face-font 'default "Source Code Pro Medium-12")

;; Disable all active themes before loading any new ones
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))
(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(defun daytime? () (sunrise-sunset) (let ((range (mapcar 'car (butlast (solar-sunrise-sunset (calendar-current-date)))))) (let ((sunrise (car range)) (sunset (cadr range)) (now (string-to-number (format-time-string "%H")))) (< sunrise now sunset))))

;;(if (daytime?) 
;;  (load-theme 'gruvbox-light-soft) 
;;  (load-theme 'dracula)
;;  )

(load-theme 'dracula)

(setq display-line-numbers 'relative)

(show-paren-mode 1) ; Highlights matching parentheses

(setq visible-bell 'true)
;; ------------------------------------------------------------------------------------------------------
;; Theming end Theming end
