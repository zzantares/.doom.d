;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; TODO This check probably belongs to another file that runs at an earlier stage
(setq zz-is-workstation (string= (system-name) "omnis"))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Julio César"
      user-mail-address "zzantares@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "CaskaydiaCove Nerd Font Mono" :size 18 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "CaskaydiaCove Nerd Font" :size 19))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-vivendi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(remove-hook! 'text-mode-hook #'display-line-numbers-mode)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/notes/org/")


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

(setq ispell-dictionary "en")
(setq-default line-spacing 3
              indent-tabs-mode nil
              tab-width 4)

(after! evil
  (map! :nv "h" #'evil-previous-line)
  (map! :nv "k" #'evil-next-line)
  (map! :nv "j" #'evil-backward-char)
  (map! :nv "l" #'evil-forward-char)
  (map! :nv "gb" #'evil-buffer)
  (map! :leader :prefix "w" :desc "Delete other windows" :nv "O" #'delete-other-windows)
  (map! :leader :prefix "w" :desc "Maximize this window" :nv "o" #'doom/window-maximize-buffer)
  (map! :leader :prefix "w" :desc "Enlarge the current window" :nv "e" #'doom/window-enlargen)
  (map! :leader :prefix "w" :desc "Maximize window horizontally" :nv "S" #'doom/window-maximize-horizontally)
  (map! :leader :prefix "w" :desc "Maximize window vertically" :nv "V" #'doom/window-maximize-vertically)
  (map! :prefix "C-w" :nv "O" #'delete-other-windows)
  (map! :prefix "C-w" :nv "o" #'doom/window-maximize-buffer)
  (map! :prefix "C-w" :nv "e" #'doom/window-enlargen)
  (map! :prefix "C-w" :nv "s" #'+evil/window-split-and-follow)
  (map! :prefix "C-w" :nv "v" #'+evil/window-vsplit-and-follow)
  (map! :prefix "C-w" :nv "S" #'doom/window-maximize-horizontally)
  (map! :prefix "C-w" :nv "V" #'doom/window-maximize-vertically)
  (map! :prefix "C-w" :nv "h" #'evil-window-up)
  (map! :prefix "C-w" :nv "k" #'evil-window-down)
  (map! :prefix "C-w" :nv "j" #'evil-window-left)
  (map! :prefix "C-w" :nv "l" #'evil-window-right)
  (map! :prefix "C-w" :nv "H" #'+evil/window-move-up)
  (map! :prefix "C-w" :nv "K" #'+evil/window-move-down)
  (map! :prefix "C-w" :nv "J" #'+evil/window-move-left)
  (map! :prefix "C-w" :nv "L" #'+evil/window-move-right)
  (map! :prefix "C-w" :nv "C-h" #'evil-window-up)
  (map! :prefix "C-w" :nv "C-k" #'evil-window-down)
  (map! :prefix "C-w" :nv "C-j" #'evil-window-left)
  (map! :prefix "C-w" :nv "C-l" #'evil-window-right)
  (map! :prefix "C-w" :nv "C-S-h" #'evil-window-move-very-top)
  (map! :prefix "C-w" :nv "C-S-k" #'evil-window-move-very-bottom)
  (map! :prefix "C-w" :nv "C-S-j" #'evil-window-move-far-left)
  (map! :prefix "C-w" :nv "C-S-l" #'evil-window-move-far-right))

(after! dired
  (map! :map dired-mode-map :n "k" #'dired-next-line)
  (map! :map dired-mode-map :n "h" #'dired-previous-line)
  (map! :map dired-mode-map :n "o" #'dired-find-file)
  (map! :map dired-mode-map :n "u" #'dired-up-directory)
  (map! :leader :prefix "m" :map dired-mode-map :desc "Create directory" :n "a" #'dired-create-directory)
  (map! :leader :prefix "m" :map dired-mode-map :n :desc "Rename file at point" "m" #'dired-do-rename)
  (map! :leader :prefix "m" :map dired-mode-map :n :desc "Copy file at point" "c" #'dired-do-copy)
  (map! :leader :prefix "m" :map dired-mode-map :n :desc "Delete file at point" "d" #'dired-do-delete)
  (map! :leader :prefix "t" :desc "Dired at this location" :nv "t" #'dired-jump)
  (map! :leader :prefix "t" :desc "Dired at project root" :nv "r" #'projectile-dired))

(after! magit
  (map! :map magit-mode-map :nv "k" #'evil-next-visual-line)
  (map! :map magit-mode-map :nv "h" #'evil-previous-visual-line))

(after! git-gutter
  (map! :nv "]g" #'+vc-gutter/next-hunk)
  (map! :nv "[g" #'+vc-gutter/previous-hunk))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(after! doom-modeline
  (setq doom-modeline-persp-name t))

(after! org
  (setq org-hide-emphasis-markers t))

(after! lsp
  (map! :leader :prefix "i" :desc "Jump to definition" :n "D" #'lsp-find-definition))

(after! lsp-haskell
  (setq lsp-haskell-formatting-provider "fourmolu"))

(use-package! ormolu
  :hook (haskell-mode . ormolu-format-on-save-mode)
  :custom
  (ormolu-process-path "fourmolu"))

(map! :g "C-s" #'save-buffer)
(map! :leader :prefix "i" :desc "Jump to definition" :n "d" #'+lookup/definition)
(map! :leader :n "M-," #'doom/goto-private-config-file)

(when zz-is-workstation
  (setq lsp-enable-file-watchers nil)
  ;; Note if following hook doesn't work then can do: (advice-add 'risky-local-variable-p :override #'ignore)
  (add-hook! haskell-mode
    (add-to-list 'safe-local-variable-values
                 '(haskell-hoogle-command . "stack hoogle --"))
    (add-to-list 'safe-local-variable-values
                 '(haskell-hoogle-server-command . (lambda (port) (list "stack" "hoogle" "--" "server" "--local" "-p" (number-to-string port)))))))

(add-hook! 'window-setup-hook :append 'toggle-frame-fullscreen)
