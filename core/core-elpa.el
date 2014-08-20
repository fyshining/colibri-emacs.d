;;; Personal: 
;;  
;; File Name: core-elpa.el
;; Created Time: 2014/8/20
;; Edited By: ShiNing
;;
;; Copyright (c) 2014 ShiNing, Colibri Team, All Rights Reserved.
;;
;; |-------+---------+-----------+----------+------|
;; |  版本 | 作者    | 时间      | 修订说明 | 备注 |
;; |-------+---------+-----------+----------+------|
;; | 0.0.1 | ShiNing | 2014/8/20 | 创建文件 |      |
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
;;
;;; end!

(let ((package-el-site-lisp-dir
       (expand-file-name "site-lisp/package" user-emacs-directory)))
  (when (and (file-directory-p package-el-site-lisp-dir)
             (> emacs-major-version 23))
    (message "从local-path中移除本地的package.el以避免重复绑定。")
    (setq load-path (remove package-el-site-lisp-dir load-path))))

;; 加载package.el
(require 'package)

;; standard package respositories

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

;;; Fire up package.el
(package-initialize)


(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'fullframe)
(fullframe list-packages quit-window)

(provide 'core-elpa)
;;; end core-elpa!
