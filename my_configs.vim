"*********************基础配置***************************
" 设置文件格式
set fileformats=unix,dos

"显示行号
set number

"显示当前行号
set ruler

"设置相对行号
set relativenumber

"设置文字自动换行，不超过当前窗口
set wrap

"和系统共用一个剪贴板
set clipboard+=unnamed
"粘贴时不置换剪贴板,可以一次复制多次粘贴
xnoremap p pgvy


"*********************插入模式配置***************************

" 插入模式下键盘映射，可以快速移动
" ctrl+hjkl上下左右移动，b/f翻页

" 插入模式ctrl+o可以快速退出插入模式
inoremap <C-o> <Esc>

"插入模式ctrl+l可以向右移动
inoremap <C-l> <Right>

"插入模式ctrl+h可以向左移动
inoremap <C-h> <Left>

"插入模式ctrl+k可以向上移动
inoremap <C-k> <Up>

"插入模式ctrl+j可以向下移动
inoremap <C-j> <Down>

"插入模式ctrl+b可以向上翻页
inoremap <C-b> <PageUp>

"插入模式ctrl+f可以向下翻页
inoremap <C-f> <PageDown>

" 插入模式下ctr+a/e快速移动到行首和行尾
"插入模式ctrl+a快速移动到行首
inoremap <C-A> <Esc>^

"插入模式ctrl+e快速移动到行尾
inoremap <C-E> <Esc>$

"*********************普通模式配置***************************
"普通模式将ctrl+l除了原有功能之外,还增加取消高亮搜索功能
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"*********************光标配置***************************
"设置不同模式下的光标
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"光标对应模式
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"设置光标高亮行
set cursorline


"*********************vim-gitgutter配置***************************
" 追踪变更的时间
set updatetime=100

" git的增删改在状态栏显示
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" 设置标志列的颜色
highlight! link SignColumn LineNr

" 设置增，删，改的图标颜色
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

nmap ghp <Plug>(GitGutterPreviewHunk)
