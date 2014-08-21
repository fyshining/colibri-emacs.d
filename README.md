colibri-emacs.d
===============

>Author: ShiNing    
>Created Time: 2014/8/18     
>
>History:    
>
>| 版本 | 作者  | 时间 | 修订说明 | 备注 |
>| ---- | ----- | ---- | ---- | ---- |
>| 0.0.1  | ShiNing | 2014/8/18 | 创建文件 | |
>
>License:
>
>This program is free software; you can redistribute it and/or
>modify it under the terms of the GNU General Public License
>as published by the Free Software Foundation; either version 3
>of the License, or (at your option) any later version.     
>
>This program is distributed in the hope that it will be useful,
>but WITHOUT ANY WARRANTY; without even the implied warranty of
>MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>GNU General Public License for more details.
>
>You should have received a copy of the GNU General Public License
>along with GNU Emacs; see the file COPYING.  If not, write to the
>Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
>Boston, MA 02110-1301, USA.
>
>end!


##目录



###序

Colibri-emacs.d 是基于 GPLv2 协议的开源软件，并且是由 Colibri Team 开发并
维护。Colibri团队一直坚持KISS (Keep it simple and stupid)原则，换句话来说
就是秉承着简单就是美的开发理念从事软件开发。而这个简单不仅仅体现在用户体验
上，对于开发者同样坚持简单至上。

Colibri-emacs.d 是 GNU Emacs 的配置文件，其旨在扩充 Emacs 的功能，使得
Emacs 成为一款简单易用的编辑器。不仅能够编写代码、文章，同样能够浏览网页、
收发邮件和听音乐等事情。当然，Colibri-emacs.d 将实现自动补全、快速检索、
代码跳转、语法高亮和语义检查等功能，使得开发者能够高效快速的编写代码。

同时为了保障其高可扩展性、简单等特性，Colibri-emacs.d 采用了微内核架构，其
内核只实现了Package管理、文件编码识别和mode处理等核心功能，而将其他如语法高
亮、快速检索、收发邮件等功能全部以模块的形式加载到 Emacs 中。由于采用微内核
架构，其内核非常小，这样就保证了内核的质量，从而提高了 Colibri-emacs.d 的稳
定性。

###文件布局

为了保障代码的简洁和易扩展性，Colibri-emacs.d 对于文件布局有很高的要求，每个
目录都有特殊的含义，不能将文件随意放置。

####文件树

```lisp
colibri-emacs.d   
├── COPYING   
├── core   
│   ├── core-elpa.el   
│   ├── core-site-lisp.el   
│   └── core-ui.el   
├── docs   
│   └── TODO  
├── elpa  
│   ├── archives   
│   │   ├── gnu   
│   │   │   └── archive-contents   
│   │   ├── melpa   
│   │   │   └── archive-contents  
│   │   ├── melpa-stable  
│   │   │   └── archive-contents  
│   │   └── org  
│   │       └── archive-contents  
│   └── fullframe-20140619.305  
│       ├── fullframe.elll  
│       ├── fullframe.elc  
│       ├── fullframe-autoloads.el  
│       ├── fullframe-autoloads.el~  
│       ├── fullframe-pkg.el  
│       └── fullframe-pkg.elc  
├── eshell   
├── init.el    
├── locals  
│   └── local-demo.el  
├── modules   
│   └── module-loaded.el   
├── README.md   
├── README.txt  
├── site-lisp   
│   └── unicad   
│       └── unicad.el  
└── utils    
    └── util-timl   
```

>注： 
>colibri-emacs.d是项目的根目录，为方便描述，在不明确说明的话使用 . 表示根目
>录。

####规则

Colibri-emacs.d 相关的文件包括代码、文档、第三方库等全部存放在 ./ 目录下，
由于文件非常多，因此会有几条规则来分类文件，使得文件能够有序的存放在 ./ 目
录下。下面将一一介绍规则：     
1. 文件按其是代码、文档、第三方库等分类，分别存入对应的文件下；    
2. 文件名要指明其文件用途；   

####含义

文件含义如下表所示：  

| 文件名    | 含义                                                                    | 
| --------- | ----------------------------------------------------------------------- |  
| COPYING   | 项目遵循的 GPLv2协议                                                    |
| init.el   | 项目的启动文件，其将会检查系统版本、加载内核、加载模块，最终启动Emacs。 |
| README.md | 项目说明书                                                              |

文件夹含义如下表所示：   

| 文件夹名  | 含义                            |
| --------- | ------------------------------- |
| core      | 微内核代码文件夹                |
| docs      | 项目文档文件夹                  |
| elpa      | melpa库存放文件夹               |
| locals    | 用户自定义配置代码              |
| modules   | 用户模块代码文件夹              |
| site-lisp | 不在melpa中的第三方库存放文件夹 |
| utils     | 项目工具代码所在文件夹          |
