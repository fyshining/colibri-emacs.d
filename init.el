;;; File Name: init.el
;;; Created Time: 2014/8/18
;;; Edited By: ShiNing
;;;
;;; Copyright (c) 2014 ShiNing, Colibri Team, All Rights Reserved.
;;;
;;; |-------+---------+-----------+----------+------|
;;; |  版本 | 作者    | 时间      | 修订说明 | 备注 |
;;; |-------+---------+-----------+----------+------|
;;; | 0.0.1 | ShiNing | 2014/8/18 | 创建文件 |      |
;;; |-------+---------+-----------+----------+------|

;; 获得当前用户
(defvar current-user
  (getenv
   (if (equal system-type 'window-nt)
       "USERNAME"
     "USER")))
(message "%s" current-user)

;; 设置 Colibri Emacs 工作目录
(defvar colibri-dir (file-name-directory load-file-name)
  "Colibri Emacs 主目录。")

;; 设置 Colibri Emacs's core目录，用来存放内核
(defvar colibri-core-dir (expand-file-name "core" colibri-dir)
  "内核文件目录。")

;; 设置 Colibri Emacs's module 目录，用来存放模块文件
(defvar colibri-modules-dir (expand-file-name "modules" )
  "该目录存放所有 Colibri Emacs 配置系统内置的模块。")

;; 设置 Colibri Emacs's 保存目录
(defvar colibri-savefile-dir (expand-file-name ".savefile" colibri-dir)
  "该目录存放所有自动生成的文件，包括保存或历史文件。")
(unless (file-exists-p colibri-savefile-dir)
  (make-directory colibri-savefile-dir))

;; 显示启动信息
(message "启动 Colibri Emacs")


;; 检测 Emacs 版本是否符合系统的要求
;; 版本要求23或更高
(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Emacs 版本太低，配置系统要求至少%s或更高。" minver)))


(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
