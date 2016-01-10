;;; packages.el --- emacs-config Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar emacs-config-packages
  '(
    magit
    evil-magit
    ranger
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar emacs-config-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function emacs-config/init-<package-emacs-config>
;;
;; (defun emacs-config/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(message "Reading emacs-config packages")
(defun emacs-config/init-magit ()
  ;; (use-package evil-magit))
  (message "LOADING magit VIA emacs-config")
  )

(defun emacs-config/init-evil-magit ()
  ;; (use-package evil-magit))
  (require 'evil-magit))


(defun emacs-config/init-ranger ())
