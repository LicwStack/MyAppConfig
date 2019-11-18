""""""""""""""""""""""""""""""""""""
" plug
call plug#begin()

" 文件浏览
Plug 'scrooloose/nerdtree'

" vim状态栏
Plug 'vim-airline/vim-airline'

" 代码检查
Plug 'w0rp/ale'

" 自动补全
Plug 'valloric/youcompleteme'

" 代码片段
Plug 'sirver/ultisnips'

" 快速注释
Plug 'scrooloose/nerdcommenter'

call plug#end()
"""""""""""""""""""""""""""""""""""

" 取消VI兼容
set nocompatible

" utf-8编码
set encoding=utf-8

" 显示行号
set nu

" 高亮光标所在行
set cursorline

" 粘贴时保持格式
"set paste

" 状态栏显示当前执行的命令
set showcmd

" 设置Tab键宽度为4个空格
set tabstop=4

" 设置缩进用空格表示
set expandtab

" 退格键退回缩进空格的长度
set softtabstop=4

" 启用退格键
set backspace=indent,eol,start

" 允许方向键,h,j换行
"set whichwrap+=<,>,h,l
set whichwrap+=h,l

" 取消备份
set nobackup

" 不生成swp文件
set noswapfile

" 显示行尾的空格
highlight WhitespaceEOL ctermbg=DarkGrey
match WhitespaceEOL /\s\+$/

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 退出vim后,仍然可以undo上次编辑
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim/undo
endif

" 定义快捷键的前缀，即<Leader>
"let mapleader=";"

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax

" 启动 vim 时关闭折叠代码
set nofoldenable

" 插入模式jj映射<Esc>
inoremap jj <Esc>

"""""""""""""""""""""""""""""""""""
" Quickly Run
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc
"""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""
""" NerdTree
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '_pycache_$']
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""
""" vim-airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_extensions = []
"""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""
""" ale
" map <F7> :ALEToggle<CR>

" let g:ale_linters = {
" \   'python': ['pylint', 'flake8']
" \}

let g:ale_linters = {
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf', 'isort']
\}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

map <F2> :ALEFix<CR>
""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""
"""" nerdcommenter
let g:NERDSpaceDelims = 1
""""""""""""""""""""""""""""""""""
