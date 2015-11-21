;; m-x eval-last-sexp
;; m-x eval-expression

(defun ethan-test ()
  (message "Hello, Ethan!"))

(defun cljs-node-repl ()
  (interactive)
  ;; (run-clojure "lein trampoline run -m clojure.main repl.clj"))
  (run-clojure "lein trampoline cljsbuild repl-listen"))
