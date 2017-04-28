(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(eval-after-load "quail/latin-ltx"
  '(mapc (lambda (pair)
           (quail-defrule (car pair) (cadr pair) "TeX"))
	 '( ("\\bb" "𝔹") ("\\bl" "𝕃") ("\\bs" "𝕊")
	    ("\\notsign" "¬")
	    ("\\bt" "𝕋") ("\\bv" "𝕍") ("\\cv" " O ")
	    ("\\comp" "∘") ("\\m" "⟼") ("\\om" "ω"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 143 :width normal)))))

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))))
(package-initialize)
