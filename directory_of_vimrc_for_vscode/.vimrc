" ==============================================================================
" キーマッピング or キーバインド
" ==============================================================================

" ESC 連打でハイライト解除
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" Space 2 回でも検索ハイライトを解除
nnoremap <silent> <Space><Space> :nohlsearch<CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 1 行下に空行
nnoremap <Space>o o<ESC>k

" 1 行上に空行
nnoremap <Space><S-o> <S-o><ESC>j

" zt や zz や z- などの再描画を space をプリフィックスにして
" Shift+H みたいな挙動と似せて(語彙力
" zh は z<Left> だし zl は z<Right> で代替可能､zm は上書きされます
nnoremap zh zt
nnoremap zm zz
nnoremap zl z-

" 行の最初の文字へ移動
nnoremap <Space>a ^

" 行末へ移動
nnoremap <Space>e $

" 折り返し時に表示行単位での移動
nnoremap <silent> j gj
nnoremap <silent> k gk

" <Space> → jkhl のどれかで多めに移動
nnoremap <Space>h 7h
nnoremap <Space>j 10j
nnoremap <Space>k 10k
nnoremap <Space>l 7l

" 1 文字削除で yank 内容を上書きしない
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s

"" インサートモード用

" jj で Normal モードへ戻る
inoremap <silent> jj <ESC>

" 日本語入力中でも Normal モードへ戻れるようにする
inoremap <silent> ｊｊ <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>

" インサートモード時の移動を emacs キーバインド方式に
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i

" インサートモード時にカーソル位置の1文字削除をemacsキーバインド方式に
" カーソルの1つ左削除はvimのデフォルトで既に<C-h>でok
inoremap <C-d> <delete>

" インサートモード時のインデントの字下げ削除
" ※字下げはvimのインサートモード標準の<C-t>
" ※本当は<C-,>が<と同じ位置だったのでそれでマッピングしたかったけど反応しない…
inoremap <C-l> <C-d>

"" ビジュアルモード用

" visual モードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" v を二回で行末まで選択
vnoremap v $h

" ビジュアルモード中の "*y を z の一押しに､その後ブラウザに即ペースト可能
vnoremap z "*y
