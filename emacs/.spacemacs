;; -*- mode: emact-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; TODO
;; Check out https://www.emacswiki.org/emacs/WinnerMode to undo and redo changes to windows

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     sql
     csv
     vimscript
     javascript
     html
     ansible
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     ;; Needs (global-evil-mc-mode) in user config
     ;; evil-mc
     git
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     ranger
     clojure
     haskell
     markdown
     python
     lua
     django
     version-control
     auto-completion
     gtags
     github-integration
     github
     yaml
     syntax-checking
     themes-megapack
     cscope
     eyebrowse
     elfeed

     emacs-config
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(sass-mode
     evil-tabs
     nyan-mode
     ;; elfeed
     ;; elfeed-org
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     smartparens
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default

   package-check-signature nil
   global-evil-search-highlight-persist nil
   x-select-enable-clipboard 1
   visual-line-mode 1
   ;; visual-line-fringe-indicators '("⤷" "⤶")
   visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)
   ;; visual-line-fringe-indicators '(nil right-curly-arrow)

   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update 1
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner "~/.emacs.d/private/emacs-config/img/gnu-levitate.png"
   ;; dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         tsdh-light
                         spacemacs-dark
                         spacemacs-light
                         sanityinc-tomorrow-eighties
                         whiteboard
                         solarized-light
                         twilight-bright
                         organic-green
                         zonokai-red
                         ;; gruvbox
                         ;; brin
                         ;; apropospriate-dark
                         ;; zonokai-blue
                         spacemacs-light
                         anti-zenburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   dotspacemacs-default-font '("Liberation Mono"
                               :size 19
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key ":"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   syntax-checking-enable-by-default 1
   auto-completion-enable-snippets-in-popup 1
   vc-follow-symlinks t
   global-evil-tabs-mode t

   elfeed-feeds '("https://www.xkcd.com/rss.xml"
                  ;; "https://boingboing.net/feed"
                  "https://fivethirtyeight.com/contributors/nate-silver/feed/"
                  "https://fivethirtyeight.com/contributors/maggie-koerth-baker/feed"
                  "https://hackaday.com/feed/"
                  )

   ;; elfeed-search-filter "-boringboingboing" ;; Not yet implemented

   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq-default visual-line-fringe-indicators nil)

  ;; Override these functions so n is always forward and N is always backwards
  (evil-define-motion evil-search-next (count)
    "Repeat the last search."
    :jump t
    :type exclusive
    (let ((orig (point))
          (search-string (if evil-regexp-search
                             (car-safe regexp-search-ring)
                           (car-safe search-ring))))
      (goto-char
       ;; Wrap in `save-excursion' so that multiple searches have no visual effect.
       (save-excursion
         (evil-search search-string t evil-regexp-search)
         (when (and (> (point) orig)
                    (save-excursion (evil-adjust-cursor) (= (point) orig)))
           ;; Point won't move after first attempt and `evil-adjust-cursor' takes
           ;; effect, so start again.
           (evil-search search-string t evil-regexp-search))
         (point)))
      (when (and count (> count 1))
        (dotimes (var (1- count))
          (evil-search search-string t evil-regexp-search)))))

  (evil-define-motion evil-search-previous (count)
    "Repeat the last search in the opposite direction."
    :jump t
    :type exclusive
    (dotimes (var (or count 1))
      (evil-search (if evil-regexp-search
                      (car-safe regexp-search-ring)
                    (car-safe search-ring))
                  nil evil-regexp-search)))

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "-") 'ranger)
  (define-key evil-normal-state-map (kbd "g*") 'spacemacs/helm-project-do-ag-region-or-symbol)

  (define-key evil-normal-state-map (kbd "[[") 'python-nav-backward-up-list)
  (define-key evil-normal-state-map (kbd "[n") 'git-gutter+-previous-hunk)
  (define-key evil-normal-state-map (kbd "]n") 'git-gutter+-next-hunk)

  (evil-leader/set-key
   ;; "a" 'helm-do-ag
   "a" 'helm-projectile-ag
   "A" 'helm-ag-project-root
   "b" 'helm-mini
   "o" 'helm-projectile
   "P" 'clipboard-yank
   "y" 'clipboard-kill-ring-save
   "ee" 'eval-last-sexp
   "sh" 'paredit-backward-slurp-sexp
   "sj" 'paredit-backward-barf-sexp
   "sk" 'paredit-forward-barf-sexp
   "sl" 'paredit-forward-slurp-sexp
   "gs" 'magit-status
   "gb" 'magit-blame
   "gd" 'magit-ediff-show-unstaged
   )

  (global-hl-line-mode -1)  ;; Don't highlight current line (row)

  (nyan-mode 1)

  (setq projectile-enable-caching t)

  ;; Make underscores actual word characters
  ;; For python
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For Javascript
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (require 'flycheck)
  (flycheck-define-checker python-pylint-py3k
    "pylint with py3k option"
    :command ("pylint" "--py3k"
              "--output-format" "text"
              "--msg-template"
              (eval (if flycheck-pylint-use-symbolic-id
                        "{path}:{line}:{column}:{C}:{symbol}:{msg}"
                      "{path}:{line}:{column}:{C}:{msg_id}:{msg}"))
              (config-file "--rcfile" flycheck-pylintrc)
              ;; Need `source-inplace' for relative imports (e.g. `from .foo
              ;; import bar'), see https://github.com/flycheck/flycheck/issues/280
              source-inplace)
    :error-filter
    ()
    :error-patterns
    ((error line-start (file-name) ":" line ":" column ":"
            (or "E" "F") ":"
            (id (one-or-more (not (any ":")))) ":"
            (message) line-end)
     (warning line-start (file-name) ":" line ":" column ":"
              (or "W" "R") ":"
              (id (one-or-more (not (any ":")))) ":"
              (message) line-end)
     (info line-start (file-name) ":" line ":" column ":"
           "C:" (id (one-or-more (not (any ":")))) ":"
           (message) line-end))
    :modes python-mode)
  (add-to-list 'flycheck-checkers 'python-pylint-py3k t)
  (flycheck-add-next-checker 'python-pylint 'python-pylint-py3k)

  ;; (add-hook 'python-mode-hook (lambda ()
  ;;                               (flycheck-mode 1)
  ;;                               (semantic-mode 1)
  ;;                               (setq flycheck-checker 'python-pylint
  ;;                                     flycheck-checker-error-threshold 900
  ;;                                     ;; flycheck-python-pylint-executable "pylint"
  ;;                                     flycheck-pylintrc "~/.pylintrc")))

  ;; (global-evil-mc-mode)
  ;; ("grm" . evil-mc-make-all-cursors)
  ;; ("gru" . evil-mc-undo-all-cursors)
  ;; ("C-n" . evil-mc-make-and-goto-next-match)
  ;; ("grN" . evil-mc-skip-and-goto-next-cursor)

  ;; ("grs" . evil-mc-pause-cursors)
  ;; ("grr" . evil-mc-resume-cursors)
  ;; ("grh" . evil-mc-make-cursor-here)
  ;; ("grn" . evil-mc-skip-and-goto-next-match)
  ;; ("C-t" . evil-mc-skip-and-goto-next-match)

  ;; ("M-p" . evil-mc-make-and-goto-prev-cursor)
  ;; ("grP" . evil-mc-skip-and-goto-prev-cursor)
  ;; ("C-p" . evil-mc-make-and-goto-prev-match)
  ;; ("grp" . evil-mc-skip-and-goto-prev-match)

  ;; elfeed
  ;; db located at ~/.elfeed
  ;; (elfeed-org)
  ;; (elfeed :variables rmh-elfeed-org-files (list "~/.emacs.d/private/elfeed.org"))
  ;; For now, just use the vanilla way of doing things

  ;; (elfeed :variables
  ;;         elfeed-feeds '("https://boingboing.net/feed"
  ;;                        "https://www.xkcd.com/rss.xml"
  ;;                        "https://fivethirtyeight.com/contributors/nate-silver/feed/"
  ;;                        ))

  ;; '(elfeed-feeds
  ;;   (quote
  ;;    ("https://www.xkcd.com/rss.xml"
  ;;     "https://boingboing.net/feed"
  ;;     "https://fivethirtyeight.com/contributors/nate-silver/feed/")))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(linum-format " %5i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (highlight2clipboard copy-as-format eval-sexp-fu xcscope elfeed-web elfeed-org elfeed-goodies elfeed elscreen gitignore-mode ace-jump-mode noflet white-sand-theme rebecca-theme org-mime exotica-theme epl bind-key flyspell-correct ghub pythonic sql-indent org-category-capture inflections multiple-cursors queue packed dash-functional tern iedit goto-chg simple-httpd marshal ht hydra nyan-mode powerline highlight undo-tree skewer-mode haml-mode ghc dash seq git-commit gh markdown-mode async alert s diminish paredit cider clojure-mode anaconda-mode smartparens evil flycheck haskell-mode company helm helm-core yasnippet avy log4e projectile magit magit-popup with-editor f js2-mode winum unfill madhat2r-theme fuzzy company-ansible zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs ranger rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin pony-mode planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jinja2-mode jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags gandalf-theme flyspell-correct-helm flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-tabs evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode company-web company-tern company-statistics company-ghci company-ghc company-cabal company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ansible-doc ansible ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
