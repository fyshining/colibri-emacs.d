;;; Personal: 
;;  
;; File Name: module-ido.el
;; Created Time: 2014/8/21
;; Edited By: ShiNing
;;
;; Copyright (c) 2014 ShiNing, Colibri Team, All Rights Reserved.
;;
;; |-------+---------+-----------+----------+------|
;; |  版本 | 作者    | 时间      | 修订说明 | 备注 |
;; |-------+---------+-----------+----------+------|
;; | 0.0.1 | ShiNing | 2014/8/21 | 创建文件 |      |
;; |-------+---------+-----------+----------+------|
;;
;;; License:
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

(message "module-ido!")

;; 加载 ido.el 启用  ido
(require 'ido)

(ido-mode t) ; 启用 ido-mode
(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffer t)

(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'ido-ubiquitous)
  (ido-ubiquitous-mode t))

(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'smex)
  (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

(require-package 'idomenu)

(setq ido-default-buffer-method 'selected-window)

(add-hook 'ido-setup-hook 
	  (lambda () 
	    (define-key ido-completion-map [up] 'previous-history-element)))

(provide 'module-ido)
