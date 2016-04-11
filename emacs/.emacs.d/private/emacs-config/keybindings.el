(evil-leader/set-key
  ;; "a" 'helm-do-ag
  "a" 'helm-projectile-ag
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
  )

(define-key evil-normal-state-map (kbd "-") 'ranger)
