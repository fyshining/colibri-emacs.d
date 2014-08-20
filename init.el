;;; Personal: 
;;  
;; File Name: init.el
;; Created Time: 2014/8/18
;; Edited By: ShiNing
;;
;; Copyright (c) 2014 ShiNing, Colibri Team, All Rights Reserved.
;;
;; |-------+---------+-----------+----------+------|
;; |  版本 | 作者    | 时间      | 修订说明 | 备注 |
;; |-------+---------+-----------+----------+------|
;; | 0.0.1 | ShiNing | 2014/8/18 | 创建文件 |      |
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


;; 显示启动信息
(message "正在启动 Colibri .emacs.d, 请稍后片刻!")

;; 检测 Emacs 版本是否符合系统的要求
;; 版本要求23或更高
(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "colibri-emacs.d 要求至少是 GNU Emacs 23, 但是正在运行的 GNU Emacs 的版本是 %s" emacs-version)))

;; 获得当前用户
(defvar current-user
  (getenv
   (if (equal system-type 'window-nt)
       "USERNAME"
     "USER")))

;; 总是加载最新的 byte code
(setq load-prefer-newer t)


(defvar colibri-dir (file-name-directory user-emacs-directory)
  "Colibri .emacs.d 主目录。")
(defvar colibri-core-dir (expand-file-name "core" colibri-dir)
  "该目录存放着 Colibri .emacs.d 内核文件。")
(defvar colibri-modules-dir (expand-file-name "modules" colibri-dir)
  "该目录存放所有 Colibri .emacs.d 内置的模块。")
(defvar colibri-utils-dir (expand-file-name "utils" colibri-dir)
  "该目录存放着 colibri .emacs.d 所用到的所有工具函数。")
(defvar colibri-personal-dir (expand-file-name "locals" colibri-dir)
  "该目录存放着用户自定义的配置信息。")
(defvar colibri-savefile-dir (expand-file-name ".savefile" colibri-dir)
  "该目录存放所有自动生成的文件，包括保存或历史文件。")

(defvar colibri-modules-file (expand-file-name "module-loaded.el" colibri-modules-dir)
  "该文件存放着 Colibri .emacs.d 将要加载的所有模块。")

;; 检测目录是否存在，若不存在该目录，则创建该目录
(unless (file-exists-p colibri-savefile-dir)
  (make-directory colibri-savefile-dir))

;; 添加工作目录到 Emacs 的 load-path 中
(add-to-list 'load-path colibri-core-dir)
(add-to-list 'load-path colibri-modules-dir)

;; 预加载 utils 从 colibri-utils-dir
(when (file-exists-p colibri-utils-dir)
  (message "正在加载 %s 目录下的工具函数 ..." colibri-utils-dir)
  (mapc 'load (directory-files colibri-utils-dir 't "^[^#].*el$")))

(message "正在加载 Colibri .emacs.d 内核 ...")

;; core stuff
(require 'core-ui)

(message "正在加载 Colibri .emacs.d 模块 ...")

;; 加载模块
(when (file-exists-p colibri-modules-file)
  (load colibri-modules-file))

;; 加载用户自定义的配置文件，存放在locals目录下
(when (file-exists-p colibri-personal-dir)
  (message "正在加载 %s 目录下的用户配置信息 ..." colibri-personal-dir)
  (mapc 'load (directory-files colibri-personal-dir 't "^[^#].*el$")))

;; 添加 hook 函数，计算并显示开机时间
(add-hook 'after-init-hook
          (lambda ()
            (message "开机时间：%2.f ms, 欢迎 %s ."
                     (time-subtract-millis after-init-time before-init-time)
                     current-user)))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
