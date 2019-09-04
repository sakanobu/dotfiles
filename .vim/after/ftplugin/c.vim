""" キーマッピングorキーバインド系
" C++
function! s:CPlus()
	:w
		:!g++ % -o %.exe
		:!./%.exe
    :!rm -f ./%.exe
		endfunction

command! CPlus call s:CPlus()

nmap <F6> :CPlus<CR><CR><CR>

