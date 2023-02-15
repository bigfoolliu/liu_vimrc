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

" 普通模式，使用 oo 可以快速在当前行的下面插入一行
nnoremap oo o<Esc>

