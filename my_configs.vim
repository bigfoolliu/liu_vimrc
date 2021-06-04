"*********************基础配置***************************
set fileformats=unix,dos  "设置文件格式
set number  "显示行号
set ruler  "显示当前行号
set relativenumber  "设置相对行号
set wrap  "设置文字自动换行，不超过当前窗口

set clipboard+=unnamed   "和系统共用一个剪贴板
xnoremap p pgvy  "粘贴时不置换剪贴板,可以一次复制多次粘贴


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

set cursorline  "设置光标高亮行


"*********************vim-gitgutter配置***************************
set updatetime=100  " 追踪变更的时间

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

