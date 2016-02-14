(setq user-full-name "Matthew Bartos")
(setq user-mail-address "mdbartos@umich.edu")

(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)

(require 'evil)
(evil-mode 1)

(require 'helm-config)
(helm-mode 1)

(windmove-default-keybindings 'meta)

(evil-ex-define-cmd "hx" 'helm-M-x)
(evil-ex-define-cmd "hk" 'helm-show-kill-ring)
(evil-ex-define-cmd "hf" 'helm-find)
(evil-ex-define-cmd "hm" 'helm-mini)
(evil-ex-define-cmd "ho" 'helm-occur)
(evil-ex-define-cmd "hl" 'helm-locate)
(evil-ex-define-cmd "hff" 'helm-find-files)
(evil-ex-define-cmd "hman" 'helm-man-woman)

(define-key global-map (kbd "RET") 'newline-and-indent)
(global-evil-tabs-mode t)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;(setq evil-emacs-state-cursor '("red" box))
;(setq evil-normal-state-cursor '("green" box))
;(setq evil-visual-state-cursor '("orange" box))
;(setq evil-insert-state-cursor '("red" bar))
;(setq evil-replace-state-cursor '("red" bar))
;(setq evil-operator-state-cursor '("red" hollow))

(setf sentence-end-double-space nil)

;; Copied

(setq initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1)

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(setq tab-width 4
      indent-tabs-mode nil)

;; Org mode

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes (quote ("2cc9ecf74dd307cdf856a2f47f6149583d6cca9616a0f4ecc058bafa57e4ffa3" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "09feeb867d1ca5c1a33050d857ad6a5d62ad888f4b9136ec42002d6cdf310235" "fa7b1e3a0bfc7097e9da2f202258897cc6db3fef38d0095881e59a4446ac7d6f" "ad97202c92f426a867e83060801938acf035921d5d7e78da3041a999082fb565" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "519d1b3cb7345cc9be10b4b0489436ae2d1b0690470d8d78f8e4e1ff19b83a86" default)))
 '(elscreen-default-buffer-initial-major-mode (quote lisp-interaction-mode))
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-control-face ((t (:background "black" :foreground "white"))))
 '(elscreen-tab-current-screen-face ((t (:background "black" :foreground "ghost white" :weight bold))))
 '(elscreen-tab-other-screen-face ((t (:background "dim gray" :foreground "gainsboro")))))
