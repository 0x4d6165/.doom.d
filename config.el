;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!



;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Carolyn Knight-Serrano"
      user-mail-address "gigavinyl@riseup.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 11))

(use-package! doom-modeline
  :config
  (setq doom-modeline-icon t)
  (setq doom-major-mode-color-icon t)
  (setq doom-modeline-mu4e t))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-laserwave)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


(set-email-account! "riseup.net"
  '((mu4e-sent-folder       . "/riseupp/Sent Mail")
    (mu4e-drafts-folder     . "/riseupp/Drafts")
    (mu4e-trash-folder      . "/riseupp/Trash")
    (mu4e-refile-folder     . "/riseupp/All Mail")
    (smtpmail-smtp-user     . "gigavinyl@riseup.net")
    (user-mail-address      . "gigavinyl@riseup.net")
    (mu4e-compose-signature . "---\nCarolyn Knight-Serrano"))
  t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Sets up emoji 🚀
(if (version< "27.0" emacs-version)
    (set-fontset-font
     "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)
  (set-fontset-font
   t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))


(after! treemacs
  (setq doom-themes-treemacs-theme "doom-colors"))


;; Configure packages
(use-package! writefreely
  :after org)

(use-package! lsp-ui
  :config (setq lsp-ui-doc-enable t))
(use-package dap-mode
  :config
  (add-hook 'dap-stopped-hook
    (lambda (arg) (call-interactively #'dap-hydra)))
  (require 'dap-go))
