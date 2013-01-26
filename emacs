(setq default-directory "~/snow/lab")
(add-to-list 'load-path "~/.emacs.d")

(setq-default cursor-type 'bar)
(setq inhibit-startup-message t)
(setq gun-inhibit-startup-message t)
(setq default-frame-alist '((height . 30) (width . 100) (menu-bar-lines . 20) (tool-bar-lines . 0)))
(setq make-backup-files nil)
(setq mouse-yank-at-point t);
(setq x-select-enable-clipboard t);
(setq kill-ring-max 200)
(setq backup-directory-alist (quote (("." . "~/.backups"))))
(setq show-paren-mode 'parentheses)
(set-default-font "Monaco-12")
(setq scroll-margin 7)
(setq scroll-step 1)
(setq scroll-conservatively 0)
(setq auto-window-vscroll nil)

(global-font-lock-mode t)
(global-hl-line-mode 1)
(transient-mark-mode t)
(show-paren-mode t)

(add-to-list 'load-path "/Users/snow/.emacs.d/haskell-mode")
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)  
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)  
(add-hook 'haskell-mode-hook 'font-lock-mode)  
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)  

; color theme
(add-to-list 'load-path "/Users/snow/.emacs.d/color")
(load "color-theme-github")

; show line
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d")

(column-number-mode t);
(show-paren-mode t);
(tool-bar-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default cursor-type 'bar)

;;Erlang mode
(setq default-major-mode 'erlang-mode)
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.8/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang/")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
;Distel
(let ((distel-dir "/usr/local/Cellar/erlang/R15B02/lib/elisp"))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))
(require 'distel)
(distel-setup)
; Some Erlang customizations
(add-hook 'erlang-mode-hook
          (lambda ()
            ;;when staring an Erlang shell in Emacs, default in the node ame
            (setq inferior-erlang-machine-options '("-sname" "eamcs"))
            ;;add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))
;;A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
          '(("/C-/M-i"    erl-complete)
            ("/M-?"       erl-complete)
            ("/M-."       erl-find-source-under-point)
            ("/M-,"       erl-find-source-unwind)
            ("/M-*",      erl-find-source-unwind)
            )
          "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;;add some Distel binding to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
(setq frame-title-format "emacs@%b") 


;; Emacs title bar to reflect file name
(defun frame-title-string ()
"Return the file name of current buffer, using ~ if under home directory"
(let
((fname (or
(buffer-file-name (current-buffer))
(buffer-name))))
;;let body
(when (string-match (getenv "HOME") fname)
(setq fname (replace-match "~" t t fname))        )
fname))
;;; Title = 'system-name File: foo.bar'
(setq frame-title-format '("" system-name "  File: "(:eval (frame-title-string))))


 ;; C/C++/Java mode
 (defun my-c-mode-hook()
 (define-key c-mode-map [return] 'newline-and-indent)
 (interactive)
 ;; (c-set-style "K&R")
 ;; (c-toggle-auto-state)
 (c-toggle-hungry-state)
 (setq c-basic-offset 4)
 (imenu-add-menubar-index)
 (which-function-mode)
 )
 (defun my-c++-mode-hook()
 (define-key c++-mode-map [return] 'newline-and-indent)
 (interactive)
 (setq tab-width 4 indent-tabs-mode nil)
 (c-set-style "stroustrup")
 (c-toggle-auto-state)
 (c-toggle-hungry-state)
 (setq c-basic-offset 4)
 (imenu-add-menubar-index)
 (which-function-mode)
 )
 (add-hook 'c-mode-hook 'my-c-mode-hook)
 (add-hook 'c++-mode-hook 'my-c++-mode-hook)

(require 'cc-mode)
(c-set-offset 'inline_open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;; reload-dotemacs-file
(defun reload()
    "reload your .emacs file without restarting Emacs"
    (interactive)
    (load-file "~/.emacs"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; tabbar
(require 'tabbar)
(tabbar-mode 1)
(set-face-attribute 'tabbar-default nil  
    :family "Consolas"  
    :background "gray80"  
    :foreground "gray30"  
    :height 1.2
 )  
(set-face-attribute 'tabbar-button nil  
    :inherit 'tabbar-default  
    :box '(:line-width 1 :color "yellow70")  
)  
(set-face-attribute 'tabbar-selected nil  
    :inherit 'tabbar-default  
    :foreground "DarkGreen"  
    :background "LightGoldenrod"  
    :box '(:line-width 2 :color "DarkGoldenrod")  
    :overline "black"  
    :underline "black"  
    :weight 'bold  
)  
(set-face-attribute 'tabbar-unselected nil  
    :inherit 'tabbar-default  
    :box '(:line-width 2 :color "#00B2BF")  
) 

;; autocomplete
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-delay 0.2)
(add-to-list 'ac-modes 'erlang-mode)

;; nav - brower tree
(add-to-list 'load-path "~/.emacs.d/emacs-nav")
(require 'nav)
(nav-disable-overeager-window-splitting)
