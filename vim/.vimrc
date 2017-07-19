" 显示行号
set nu
" 插入模式下输入dt+空格即可输入当前时间
iab dt <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
