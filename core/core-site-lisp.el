;;; Personal: 
;;  
;; File Name: core-site-lisp.el
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

(eval-when-compile (require 'cl)) ; load cl package

(defun core-add-subdirs-to-load-path (parent-dir)
  "添加未隐藏的目录到 'load-path'."
  (let* ((default-directory parent-dir))
    (progn
      (setq load-path
            (append
             (loop for dir in (directory-files parent-dir)
                   unless (string-match "^\\." dir)
		   collecting (expand-file-name dir))
             load-path)))))

(core-add-subdirs-to-load-path
 (expand-file-name "site-lisp/" user-emacs-directory))

(defun site-lisp-dir-for (name)
  (expand-file-name (format "site-lisp/%s" name)))

(defun site-lisp-library-el-path (name)
	(expand-file-name (format "%s.el" name) (site-lisp-dir-for name)))

(defun download-site-lisp-module (name url)
	(let ((dir (site-lisp-dir-for name)))
		(message "downloading %s from %s" name url)
		(unless (file-directory-p dir)
			(make-directory dir t))
		(add-to-list 'load-path dir)
		(let ((el-file (site-lisp-library-el-path name)))
			(url-copy-file url el-file t nil)
			el-file)))

(defun ensure-lib-from-url (name url)
	(unless (site-lisp-library-loadable-p name)
		(byte-compile-file (download-site-lisp-module name url))))

(defun site-lisp-library-loadable-p (name)
	"判断是否能够从~/.emacs.d/site-lisp/name/目录中加载name库文件"
	(let ((f (locate-library (symbol-name name))))
		(and f (string-prefix-p (file-name-as-directory (site-lisp-dir-for (name)) f)))))

;; Download these upstream libs
;; Emacs 23 以上版本已经将package.el集成到内部
;; 对于Emacs 23及以下版本需要动态下载package.el到site-lisp目录下
(unless (> emacs-major-version 23)
  (ensure-lib-from-url
   'package
   "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el"))

(provide 'core-site-lisp)
;;; end core-site-lisp!
