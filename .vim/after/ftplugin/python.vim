""" 見た目系

" 自動的な改行をする際の基準を値にできる
" しかし､自動改行は何かと面倒なので
" 0を値として入力すると自動改行を無効化する､を利用
set textwidth=0

" 80文字目にラインを入れる
set colorcolumn=80

" 長いテキストの折返し
set wrap



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
" 2019_09_05に､s:Python内に:!clearを追加し､nmap <F6>の最後に<CR>を追加した
function! s:Python()
        :w
        :!clear
	        :!python3 %
		endfunction

command! Python call s:Python()

nmap <F6> :Python<CR><CR>
