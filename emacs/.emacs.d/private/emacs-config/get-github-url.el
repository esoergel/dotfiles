(message "loaded git link thingy")

(defun filter (predicate list)
  (if (= 0 (length list))
      nil
    (let ((first (car list))
          (rest (filter predicate (cdr list))))
      (if (funcall predicate first)
          (cons first rest)
        rest))))

(defun first-matching (predicate list)
  (if (= 0 (length list))
      nil
    (let ((first (car list)))
      (if (funcall predicate first)
          first
        (first-matching predicate (cdr list))))))

(defun origin-resource (shell-output)
  (nth 1
       (first-matching
        (lambda (row) (string-equal "origin" (car row)))
        (mapcar (lambda (row) (split-string row nil t))
                (split-string shell-output "\n" t)))))

(defun first-match (regexp string)
  (if (string-match regexp string)
      (match-string 1 string)
    nil))

(defun resource-to-url (resource)
  (concat
   "https://github.com/"
   (first-match "\\([-_A-Za-z0-9]+/[-_A-Za-z0-9]+\\).git\$" resource)))

(defun origin-base-url ()
  (resource-to-url (origin-resource (shell-command-to-string "git remote -v"))))

(defun repo-root ()
  (car (split-string (shell-command-to-string "git rev-parse --show-toplevel") nil t)))

(defun file-path-from-root ()
  (substring (buffer-file-name) (length (repo-root))))

(defun get-github-url ()
  "Open up this file/line on github"
  (interactive)
  (let ((file-url (concat (origin-base-url) "/blob/master" (file-path-from-root))))
    (if (use-region-p)
        (let ((start (line-number-at-pos (region-beginning)))
              (end (line-number-at-pos (- (region-end) 1))))
          (message (format "%s#L%d-L%d" file-url start end))
          (browse-url (format "%s#L%d-L%d" file-url start end)))
      (browse-url file-url))))
