# liu_vimrc

[toc]

## 1.使用概述

- 项目来自于：https://github.com/amix/vimrc ,自己加了写注释和改动。
- 我的项目目录：https://github.com/bigfoolliu/liu_vimrc
- 注意：my_configs.vim是个人的配置，my_plugins是我需要个性化安装的插件

比如不同的主题等安装其他的插件，插件管理使用pathogen，如果是安装vim-rails:

```sh
cd ~/.vim_runtime
git clone git://github.com/tpope/vim-rails.git my_plugins/vim-rails

# 其他需要安装的插件，可以结合配置
# onedark.vim, vim-css-color, 如果使用的话，将 git 目录复制过去，然后删除 .git
git clone --depth=1 git@github.com:joshdick/onedark.vim.git my_plugins/onedark.vim
git clone --depth=1 git@github.com:ap/vim-css-color.git my_plugins/vim-css-color
```

## 2.基本快捷键

leader表示,

### 2.1normal模式

```sh
# 使用,代替shift
# 使用空格键代替/
ctrl + l  # 取消任意的高亮

,w  # 快速保存
,W  # 使用sudo保存文件
```

使用 ,enter 可以取消高亮选择

```txt
map <silent> <leader><cr> :noh<cr>
```



### 2.2窗口管理

```sh
map <leader>tn :tabnew<cr>  # 新增一个窗口
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

# 打开一个新的窗口,主要针对是当前目录下的文件
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
```

### 2.3可视模式

可以将选中的内容实用不用括号或者引号标注:

```txt
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>
```

### 2.4插入模式

- [vim缩写](https://copyfuture.com/blogs-details/20200827171424316v9mveqvpxz76a3j)

插入模式下输入 xdate, 然后esc即可输入当前时间:

```txt
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
```

输入xdate，之后：

- Ctrl + ] ：插入缩写后停留在插入模式，推荐；
- ESC ：插入缩写后回到普通模式；
- Space ：插入缩写后增加空格；
- Enter ：插入缩写后进行换行。

### 2.5命令模式

如果编辑需要sudo的文件:

```txt
:W
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

,f  # 搜索打开最近打开过的文件
,b  # 搜索打开一个buffer
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

### 3.8goyo.vim和vim-zenroom2

```sh
,z  # 进入或者退出专注模式,主要针对markdown文件
```

### 3.9SURROUND.VIM

https://vimawesome.com/plugin/surround-vim, 引号,括号的包围

<img src="https://gitee.com/bigfoolliu/liu_imgs/raw/master/picgo/%E6%88%AA%E5%B1%8F2022-05-11%E4%B8%8A%E5%8D%8811.24.15.jpg" alt="截屏2022-05-11上午11.24.15" style="zoom:50%;" />

