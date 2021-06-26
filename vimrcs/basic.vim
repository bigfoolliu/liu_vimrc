"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> 通用设置
"    -> 用户界面
"    -> 颜色和字体
"    -> 文件和备份
"    -> 文本和缩进
"    -> 可视化相关
"    -> 跳转移动相关
"    -> 状态栏
"    -> 编辑映射
"    -> vimgrep searching and cope displaying
"    -> 拼写检查
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim记忆行数
set history=500

" 允许文件类型检查和缩进
filetype plugin on
filetype indent on

" 当文件在外部被更改时自动读
set autoread
au FocusGained,BufEnter * checktime

" 使用 , 来代替shift键，从而扩展性更高，下面的所有 <leader> 都表示 ,
let mapleader = ","

" ,w 快速保存
nmap <leader>w :w!<cr>

" 使用 :W 来sudo保存文件，针对需要管理员权限的文件
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM 用户界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" 忽略编译过的文件
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" 显示当前行号
set ruler
" 命令行的高度
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 搜索的时候忽略大小写
set ignorecase
" 搜索的时候大小写智能
set smartcase
" 高亮搜索到的结果
set hlsearch

" 让搜索的效果像浏览器一样
set incsearch 

" 不要在宏的中间重绘屏幕。使它们更快完成(提升性能)
set lazyredraw 

" 正则表达式打开magic
set magic

" 光标移动到括号的一边的时候，显示匹配的括号
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" 错误的时候不要提示音
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色和字体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 允许语法高亮
syntax enable

" gnome终端中允许256色
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

"设置背景色为黑色
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" 设置文件编码为utf8
set encoding=utf8
" 设置标准文件类型
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件和备份，撤销
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
" 关闭文件备份，因为文件一般使用git等来管理
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文本，tab和缩进相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用空格代替tab
set expandtab

" 智能tab
set smarttab

" 1 tab == 4 空格
set shiftwidth=4
set tabstop=4

" 五百个字符就有换行符
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => 可视模式相关
""""""""""""""""""""""""""""""
" 可视模式下，使用 * 或者 # 来搜索当前选中的词
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 移动，tab，窗口相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用空格键 来代替 / 快速搜索，使用 ctrl + 空格来 获取帮助
map <space> /
map <C-space> ?

" 按下 ,+enter 键来禁用选中文字的高亮
map <silent> <leader><cr> :noh<cr>

" 在窗口之间只能移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" , + b + d 关闭当前的缓冲区文件
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" 关闭所有的缓冲区文件
map <leader>ba :bufdo bd<cr>

" 上/下一个缓冲区文件
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" vim多个tab的管理
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" 使用 ‘tl’ 在当前和上一个tab之间切换
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" 使用当前文件的路径来打开一个 tab， 当编辑的文件在同一个目录下会非常有用
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" 当打开文件的时候回到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => 状态栏
""""""""""""""""""""""""""""""
" 状态栏长显
set laststatus=2

" 格式化状态栏样式
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 键盘映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 0 来回到行的第一个非空字符
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" 使用 ALT + [jk]或者Command + [jk] 来移动一行文本
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" 当保存文件的时候删除文件尾部的空格，对于某些文件类型来说非常有用
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 拼写检查 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 , + s + s 来切换是否使用拼写检查
map <leader>ss :setlocal spell!<cr>

" 使用 , 的快捷键
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移除windows系统的 ^M 当编码错误的时候
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" 快速打开一个buffer
map <leader>q :e ~/buffer<cr>

" 迅速打开一个 markdown 类型的buffer
map <leader>x :e ~/buffer.md<cr>

" 切换粘贴模式的开关
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 帮助函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 如果粘贴模式打开则返回 true
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" 当删除一个 buffer 的时候不要关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
