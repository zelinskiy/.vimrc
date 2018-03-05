(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-set-key (kbd "\C-d") 'neotree-toggle)
(global-set-key (kbd "<f12>") 'neotree-toggle)
      
(eval-after-load "quail/latin-ltx"
  '(mapc (lambda (pair)
           (quail-defrule (car pair) (cadr pair) "TeX"))
	 '( ("\\bb" "𝔹") ("\\bl" "𝕃") ("\\bs" "𝕊")
	    ("\\dotminus" "∸")
	    ("\\bt" "𝕋") ("\\bv" "𝕍") ("\\cv" " O ")
	    ("\\comp" "∘") ("\\m" "⟼") ("\\om" "ω"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right. 
 '(cua-mode t nil (cua-base))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (neotree arduino-mode flycheck f dash-functional dash company ag haskell-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 158 :width normal)))))

(require 'package)

(package-initialize)

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))
(put 'downcase-region 'disabled nil)


(setq TeX-command-force "XeLaTeX")  

;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")

(customize-set-variable 'proof-three-window-mode-policy 'hybrid) 

(setq ring-bell-function 'ignore)
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "C-x M-f") 'backward-char)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "~/.cabal/bin/agda-mode locate")))


(setq c-default-style "k&r")
(desktop-save-mode 1)

