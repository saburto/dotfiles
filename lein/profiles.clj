{:repl
 {:plugins [;; When running an older version of CIDER (pre 0.18), use the
            ;; version that best matches M-x cider-version. For versions since
            ;; 0.18.0 use whatever version is the most recent.
            [cider/cider-nrepl "0.21.1"]

            ;; Only necessary when using clj-refactor
            [refactor-nrepl "2.4.0"]

            ;; Only necessary when using sayid
            [com.billpiel/sayid "0.0.17"]]

  :dependencies [[nrepl "0.4.5"]]

  :repl-options
  {:nrepl-middleware [refactor-nrepl.middleware/wrap-refactor ;; clj-refactor
                      com.billpiel.sayid.nrepl-middleware/wrap-sayid ;; sayid
                      ]}}}
