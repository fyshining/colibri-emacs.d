;;; Personal: 
;;  
;; File Name: core-ui.el
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

;; 设置更有意义的标题，显示一个文件或buffer的名字。
(setq frame-title-format
	'("" invocation-name " Colibri - " (:eval (if (buffer-file-name)
											(abbreviate-file-name (buffer-file-name))
										"%b"))))

(menu-bar-mode -1)

;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; 关闭开机启动画面
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'core-ui)
;;; end core-ui!