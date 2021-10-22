# liu_vimrc

* [1.使用概述](#1.使用概述)
* [2.基本快捷键](#2.基本快捷键)
* [3.插件快捷键](#3.插件快捷键)
  * [3.1ack全局查找](#3.1ack全局查找)
  * [3.2nerdtree目录树](#3.2nerdtree目录树)
  * [3.2commentary注释](#3.2commentary注释)
  * [3.3ctrlp查找目录文件](#3.3ctrlp查找目录文件)
  * [3.4lightline状态栏配置](#3.4lightline状态栏配置)
  * [3.5bufexplorer历史文件](#3.5bufexplorer历史文件)
  * [3.6MRU最近打开的文件](#3.6mru最近打开的文件)
  * [3.7vim markdown用来支持生成markdown文件](#3.7vim-markdown用来支持生成markdown文件)

## 1.使用概述

- 项目来自于：https://github.com/amix/vimrc ,自己加了写注释和改动。
- 我的项目目录：https://github.com/bigfoolliu/liu_vimrc
- 注意：my_configs.vim是个人的配置，my_plugins是我需要个性化安装的插件

比如不同的主题等安装其他的插件，插件管理使用pathogen，如果是安装vim-rails:

```sh
cd ~/.vim_runtime
git clone git://github.com/tpope/vim-rails.git my_plugins/vim-rails
```

## 2.基本快捷键

```sh
# 使用,代替shift
# 使用空格键代替/

, + enter  # 取消选中高亮

,w  # 快速保存
,W  # 使用sudo保存文件
```

## 3.插件快捷键

### 3.1ack全局查找

```sh
,g  # 使用ack全局内容查找，不打开第一个文件
```

### 3.2nerdtree目录树

```sh
,nn  # 打开或关闭nertree
,nb  # 查找nerdtree的书签
,nf  # 查找nerdtree中内容
```

### 3.2commentary注释

```sh
# 普通模式下
gcc  # 注释/取消注释 当前行,配合.使用，注意要在英文输入法下
5gcc  # 一次注释多行
gcu  # 可以取消多行注释
```

### 3.3ctrlp查找目录文件

```sh
,j  # 查找当前目录下的文件
ctrl + f  # 同上
```

### 3.4lightline状态栏配置

```sh
# 配置状态栏
```

### 3.5bufexplorer历史文件

```sh
# 可以打开历史文件列表以达到快速切换文件的目的

,be  # 打开历史文件列表
q  # 退出
```

### 3.6MRU最近打开的文件

```sh
,f  # 查找最近最常打开的文件
```

### 3.7vim markdown用来支持生成markdown文件

```sh
]]  # 跳转到下一个header
[[  # 跳转到上一个header
]c  # 跳转到当前的header
]u  # 跳转到父级的header

:InsertToc  # 在当前位置插入toc
```

