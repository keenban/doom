;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq org-directory "~/org/"
      org-log-done t)

(add-hook 'org-mode-hook 'variable-pitch-mode)

(use-package! denote
  :init
  (setq denote-directory (expand-file-name "~/media/doc/notes/")
        denote-rename-confirmations nil)
  :config
  (denote-rename-buffer-mode t)
  :bind
  (("C-c d n" . denote)
   ("C-c d N" . denote-type)
   ("C-c d r" . denote-rename-file)
   ("C-c d l" . denote-link)
   ("C-c d b" . denote-backlinks)
   ("C-c d d" . denote-dired)
   ("C-c d g" . denote-grep)
   ("C-c d c" . denote-link-after-creating)))

(use-package! denote-journal
  :init
  (setq denote-journal-directory (expand-file-name "journal" denote-directory)
        denote-journal-keyword "journal"
        denote-journal-title-format 'day-date-month-year)
  :bind
  ("C-c d j" . denote-journal-new-or-existing-entry)
  :hook
  (calendar-mode . denote-journal-calendar-mode))

(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

(use-package! langtool
  :init
  (setq langtool-language-tool-jar "~/.local/share/languagetool/languagetool-commandline.jar")
  (setq langtool-language-tool-server-jar "~/.local/share/languagetool/languagetool-server.jar")
  (setq langtool-server-user-arguments '("-p" "8082"))
  (setq langtool-http-server-host "localhost")
  (setq langtool-http-server-port 8082))

(setq bbdb-default-country "Canada")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
