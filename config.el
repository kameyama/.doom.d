;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;---------------------------------------------------------------------------------
;; my setting

;; redefine emacs state to intercept the escape key like insert-state does:
;; (evil-define-state emacs
;;   "Emacs state that can be exited with the escape key."
;;   :tag " <EE> "
;;   :message "-- EMACS WITH ESCAPE --"
;;   :input-method t
;;   ;; :intercept-esc nil)
;;   )

;; (defadvice evil-insert-state (around emacs-state-instead-of-insert-state activate)
;;   (evil-emacs-state))

(defalias 'evil-insert-state 'evil-emacs-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(global-set-key "\C-h" 'delete-backward-char)


;; julia
(setq lsp-julia-default-environment "~/.julia/environments/v1.0")


;; ;;prettier-js
;; (add-hook 'mhtml-mode-hook 'prettier-js-mode)
;; (add-hook 'vue-html-mode-hook 'prettier-js-mode)


;; ;;js-auto-format-mode
;; (add-hook 'mhtml-mode-hook #'js-auto-format-mode)
;; (add-hook 'vue-html-mode-hook #'js-auto-format-mode)

;;prettier
(load! "/Users/masaya/emacs-lisp/my_packages/prettier.el")
;;julia-img-view
;; (use-package julia-img-view
;;   :load-path "/Users/masaya/emacs-lisp/my_packages/julia-img-view/"
;;   :after julia-repl
;;   :config (julia-img-view-setup))


;; (html-autoview-mode t)

;; remove autoparens
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)


;;------------------------------------------------------------------------------------
;; evil-multiedit
;; Highlights all matches of the selection in the buffer.
;; (define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; ;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; ;; incrementally add the next unmatched match.
;; (define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; ;; Match selected region.
;; (define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; ;; Insert marker at point
;; (define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

;; ;; Same as M-d but in reverse.
;; (define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
;; (define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; ;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; ;; `evil-multiedit-match-symbol-and-next` (or prev).

;; ;; Restore the last group of multiedit regions.
;; (define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; ;; RET will toggle the region under the cursor
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; ...and in visual mode, RET will disable all fields outside the selected region
;; (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; For moving between edit regions
;; (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
;; (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; ;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
;; (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)
;;------------------------------------------------------------------------------------

;;online-judge
(setq oj-home-dir "/Users/masaya/Competitive_programming")
;;(setq oj-prepare-args '("--config-file" "/Users/masaya/.config/online-judge-tools/prepare.config.toml"))


;; yatex
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))

(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("Preview\\|TeXShop\\|TeXworks\\|Skim\\|mupdf\\|xpdf\\|Firefox\\|Adobe" . ".pdf")))

(setq tex-command "/Library/TeX/texbin/ptex2pdf -u -l -ot '-synctex=1'");uplatex

;(setq tex-command "/Library/TeX/texbin/ptex2pdf -l -ot '-synctex=1'");platex
;(setq tex-command "/Library/TeX/texbin/platex");platex

;(setq tex-command "xelatex -synctex=1");XeLatexでコンパイル
;;(setq tex-command "/Library/TeX/texbin/latex");latex

;(setq bibtex-command "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "/Library/TeX/texbin/upbibtex")((string-match "platex" tex-command) "/Library/TeX/texbin/pbibtex")((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/Library/TeX/texbin/bibtexu")((string-match "pdflatex\\|latex" tex-command) "/Library/TeX/texbin/bibtex")(t "/Library/TeX/texbin/pbibtex")))


(setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "/Library/TeX/texbin/mendex")
			      ((string-match "platex" tex-command) "/Library/TeX/texbin/mendex")
			      ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/Library/TeX/texbin/texindy")
			      ((string-match "pdflatex\\|latex" tex-command) "/Library/TeX/texbin/makeindex")
			      (t "/Library/TeX/texbin/mendex")))
  ;; (setq dvi2-command "/usr/bin/open -a Preview")
(setq dvi2-command "/usr/bin/open -a Skim")
(setq tex-pdfview-command "/usr/bin/open -a Skim")
(setq dviprint-command-format "/usr/bin/open -a \"Adobe Acrobat Reader DC\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`")


;;sql formatter
(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-s2" "-g"))
;;(define-key sql-mode-map (kbd "C-c C-f") 'sqlformat-command)
