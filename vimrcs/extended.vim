"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 扩展配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 用户界面相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 根据文件系统设置字体
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" 禁用滚动条（真正的黑客不用滚动条）
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" 颜色方案, 配色方案可选：peaksea（默认值），dracula，vim-colors-solarized，vim-irblack，vim-pyte，mayansmoke
" 其他的配色方案可以将 git 目录复制到 my_plugins
set background=dark
" colorscheme peaksea
" colorscheme dracula
" colorscheme palenight
colorscheme onedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 快速编辑和重载vimrc的配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 打开持续撤销，意味着你即使关闭了 bufffer/VIM，仍然可以
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 命令模式相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 命令行智能映射
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" 命令模式下,保持和bash的模式一致,使用 ctrl + a 跳转到命令首部, ctrl + e 到命令尾部
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 括号相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 将选中的文本包括在指定的括号中
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc> " 不使用斜号自动补全

" 插入模式下,括号自动补全: (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i  " 不使用单引号自动补全
" inoremap $e ""<esc>i  " 不使用双引号自动补全


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用缩写
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插入模式输入xdate然后esc退出,则按照格式输入时间日期, 20数字额外加的
iab xdate <C-r>=strftime("20%y/%m/%d")<cr>
iab xdatetime <C-r>=strftime("20%y/%m/%d %H:%M:%S")<cr>
iab xtime <C-r>=strftime("%H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack的搜索和展示，需要安装 ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 如果有 ag ，使用 ag 命令来替代 ack 搜索，比ack 快的多
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" 选中文本，使用 gv 来搜索选中的文本
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" ,g 打开ack并将光标放到当前的位置，使用!可以不自动打开第一个搜索到文件
map <leader>g :Ack!

" 按 ,r 搜索并替换选定的文本
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 帮助函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

