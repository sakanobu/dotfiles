""" 見た目系
set textwidth=80

""" 入力系
" インデントの増減を自動で行う際のインデントする幅
" デフォルトは2､だがfiletypeによって変更しており､
" .vim/after/ftpluginにそれぞれ個別に設定
set shiftwidth=4

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" Tab文字の代わりに半角スペースに
" filetypeによって変更するのかは悩み中
set expandtab

" タブ文字の表示幅
" デフォルトは2､だがfiletypeによって変更しており､
" .vim/after/ftpluginにそれぞれ個別に設定
set tabstop=4

" 指定した数のスペースを1回で削除できるようにする
" 0を設定するとtabstopの値を参照する
" .vim/after/ftpluginに個別に設定してもいいかも
set softtabstop=0

""" キーマッピングorキーバインド系
" Autopep8のキーバインド
autocmd FileType python nnoremap <Space>pep :call Autopep8()<CR>

" bpythonをvim内から素早く呼ぶ
nnoremap <Space>bp :!bpython<CR>

" F6でPythonを実行
" function内にちゃんとpython3と書かないとpython2が実行されるので注意
" ↓初めの2段落はvimのスクリプト?
" 更に注意だけど､↓のvimのスクリプトにあるようにF6を実行すると
" 自動で:wを行うので､勝手にバッファが保存されて:qでvimを抜けられてしまう…
function! s:Python()
        :w
	        :!python3 %
		endfunction

command! Python call s:Python()

nmap <F6> :Python<CR>
