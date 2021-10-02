;;; packages.el --- saburto-layer layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: Sebastian Aburto <saburto@saburto-XPS-13-9310>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `saburto-layer-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `saburto-layer/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `saburto-layer/pre-init-PACKAGE' and/or
;;   `saburto-layer/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst saburto-layer-packages
  '(java-snippets
    todoist
    websocket
    simple-httpd
    org-noter
    (keychain-environment :toggle saburto-layer-enable-keychain-env)
    (org-roam :location
              (recipe :fetcher github
                      :repo "org-roam/org-roam"
                      :files (:defaults "extensions/*")))
    (org-roam-ui :location
                 (recipe :fetcher github
                         :repo "org-roam/org-roam-ui"
                         :branch "main"
                         :files ("*.el" "out")))))

(defun saburto-layer/init-java-snippets ()
  (use-package java-snippets))

(defun saburto-layer/init-todoist ()
  (use-package todoist))

(defun saburto-layer/init-websocket ()
  (use-package websocket))

(defun saburto-layer/init-simple-httpd ()
  (use-package simple-httpd))

(defun saburto-layer/init-org-noter ()
  (use-package org-noter))

(defun saburto-layer/init-keychain-environment ()
  (use-package keychain-environment
    :defer t
    :init
    (progn
      (keychain-refresh-environment))))

(defun saburto-layer/pre-init-org-roam ()
  (setq org-enable-roam-support t)
  (use-package org-roam
    :after org
    :defer t
    :ensure t
    :init
    (progn
      (spacemacs|define-custom-layout "@Org-Roam"
        :binding "R"
        :body
        (progn
          (call-interactively 'org-roam-node-find)))
      (setq org-roam-v2-ack t)) ;; Acknowledge V2 upgrade
    :custom
    (org-roam-completion-everywhere t)
    :config
    (setq org-roam-capture-ref-templates
      '(("r" "ref" plain "#+begin_quote

 ${body}

#+end_quote%?" :if-new (file+head "${slug}.org" "#+title: ${title}

"))))
    (org-roam-db-autosync-mode)
    (require 'org-roam-protocol)
    (org-roam-setup)))

(defun saburto-layer/init-org-roam-ui ()
  (use-package org-roam-ui
    :after org-roam
    :ensure t
    :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t)))
