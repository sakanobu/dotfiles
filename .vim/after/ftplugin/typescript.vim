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
set shiftwidth=2

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" Tab文字の代わりに半角スペースに
" filetypeによって変更するのかは悩み中
set expandtab

" タブ文字の表示幅
" デフォルトは2､だがfiletypeによって変更しており､
" .vim/after/ftpluginにそれぞれ個別に設定
set tabstop=2

" 指定した数のスペースを1回で削除できるようにする
" 0を設定するとtabstopの値を参照する
" .vim/after/ftpluginに個別に設定してもいいかも
set softtabstop=0



""" キーマッピングorキーバインド系

" JavaScript自動フォーマッタをF7で
command! JSAutoFormat :call ft#jsscript#jsformat#JSAutoFormat()

nmap <F7> :JSAutoFormat<CR>
