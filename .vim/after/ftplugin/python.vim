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

" F6でPythonを実行
" function内にちゃんとpython3と書かないとpython2が実行されるので注意
" :!python3 % の%が何なのか分からん…VimScriptの特殊文字ではないらしいが…
function! s:Python()
  write
  !clear
  !python3 %
endfunction

command! Python :call s:Python()

nmap <F6> :Python<CR><CR>


" python自動フォーマッタをF7で
" マップの<CR>を3つ以上にすると整形の最中にコマンドが割り込み酷いことに
" ただ､Enterを押す回数は多くなってる状態…
" Vim scriptのfeedkeys()でもダメなんだよな…CLIで<CR>だから…
command! PyAutoFormat :call ft#pyscript#pyformat#PyAutoFormat()

nmap <F7> :PyAutoFormat<CR><CR>


" Autopep8のキーバインド
" autocmd FileType python nnoremap <Space><F8> :call Autopep8()<CR>
" noremap <Space><F8> :call Autopep8()<CR>


" bpythonをvim内から素早く呼ぶ
nnoremap <Space>bp :!bpython<CR>
