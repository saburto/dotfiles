(configuration-layer/declare-layers '(
     evil-better-jumper
     pdf
     search-engine
     sql
     emoji
     html
     json
     yaml
     helm
     emacs-lisp
     (git :variables
          git-magit-status-fullscreen t
          magit-diff-refine-hunk 'all
          version-control-global-margin nil)
     (markdown :variables markdown-live-preview-engine 'vmd)
     (treemacs :variables
               treemacs-indentation 1
               treemacs-use-filewatch-mode t
               treemacs-use-follow-mode t)

     (org
      :variables
          org-enable-roam-support t
          org-enable-roam-support t
          org-enable-hugo-support t
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-want-todo-bindings t)

     (shell :variables
            shell-default-shell 'vterm
            spacemacs-vterm-history-file-location "~/.zsh_history")

     spell-checking
     syntax-checking
     dap
     debug
     (lsp :variables

          lsp-ui-doc-enable nil
          lsp-ui-sideline-enable nil
          ;; lsp-ui-peek-enable nil
          ;; lsp-ui-imenu-enable nil
          lsp-ui-sideline-code-action nil
          lsp-ui-sideline-show-code-actions nil
          lsp-modeline-code-actions-enable nil

          ;; lsp-before-save-edits nil
          ;; lsp-enable-identation nil
          ;; lsp-enable-on-type-formatting nil

          lsp-response-timeout 15
          )
     (java :variables
           c-basic-offset 4
           tab-width 4
           java-backend 'lsp
           ;; lsp-java-signature-help-enabled nil
           lsp-java-format-settings-url "/home/saburto/eclipse-java-google-style.xml"
           lsp-java-format-settings-profile "GoogleStyle"
           lsp-java-vmargs '("-noverify" "-Xmx4G"  "-XX:+UseG1GC" "-XX:+UseStringDeduplication" "-javaagent:/home/saburto/.m2/repository/org/projectlombok/lombok/1.18.8/lombok-1.18.8.jar" )
           lsp-java-completion-favorite-static-members ["java.util.stream.Collectors.*" "org.junit.Assert.*" "org.junit.Assume.*" "org.junit.jupiter.api.Assertions.*" "org.junit.jupiter.api.Assumptions.*" "org.junit.jupiter.api.DynamicContainer.*" "org.junit.jupiter.api.DynamicTest.*" "org.mockito.Mockito.*" "org.mockito.ArgumentMatchers.*" "org.mockito.Answers.*" "org.assertj.core.api.Assertions.*"]
           ;; lsp-java-save-action-organize-imports nil
           )

     (clojure :variables
              clojure-enable-linters 'clj-kondo)

                                      ))
