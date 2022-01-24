""" キーマッピングorキーバインド系

"" 注意事項

" デフォルトのキーマッピングは:help index.txtを確認
" 現在のキーマッピングの状況の確認は:map :imap :vmap
" また､:verbose nmap とするとマッピングを定義したファイルも表示される

" 特殊なキーをマッピングは↓
" https://vim.jp.net/stepuptonovice_input_mappings_keynotations.html

" Leaderキーは設定してない
" その代わり擬似的なプリフィックスキーとしてSpaceを使用
" もし<Space>じゃなくて<Leader>にしたかったら↓
" let mapleader = "\<Space>"

" ハイライト消すなどの一部のキーマッピングはこの段落以外の場所に入れている


"" ノーマルモード用

" .vimrcの再読み込み
" 最後のESCは何故かハイライトされるのを消すため
" うーん､不具合…
" ①これ使ったあとにインサートモードで入力すると
" 改行がおかしくなるな…
" → これやったあとに､再度iモードnモードと遷移すると直るのでijjを付け足し
" ②変更前の設定が残っちゃう…コンソールに戻ってから入れば無くなるが…
" nmap <Space>:s :w<CR>:source<Space>~/.vimrc<CR><ESC><ESC>ijj
" ③ここに書くべきではないかもしれないが､tmuxで単純に:source $MYVIMRCとやっても
" 描画が崩れてしまう｡↑の対策同様一旦iモード入ってからnモードに戻るor
" コンソールのウィンドウの大きさをマウスで変更する､と直る
" .vimrcの再読み込み(ネットにあったver)
" ④え､っていうかこのコマンドでしっかり更新されてない!?
" いや､キーマッピングの追加後に削除して:sourceしても
" キーマッピングはこのバッファに残ってるだけか
" ⑤nmapをnnoremapに変える作業中についでに②から↓に変更したら①の懸念無くなってる…
nnoremap <Space>so :<C-u>source<Space>$MYVIMRC<CR><ESC><ESC>

" どこのファイルからでもすぐ.vimrcを編集
nnoremap <Space>ed :<C-u>edit $MYVIMRC<CR>

" :qを<Space>qで
nnoremap <Space>q :q<CR>

" :set numberと:set nonumberのキーバインド
nnoremap <Space>sny :set number<CR>
nnoremap <Space>snn :set nonumber<CR>

" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" ↑のハイライトを消すマッピング利用の為にescキーや<C-[>を押すのが辛いので代用
" ※他のマッピングで nmap ~ ~<Space><Space>~ とかになると当然バグるので注意
nmap <Space><Space> <ESC><ESC>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 1行下に空行
nnoremap <Space>o o<ESC>k

" 1行下に空行(しかし挙動遅い)
" nnoremap <Space>o o<ESC><ESC>

" 1行上に空行
nnoremap <Space><S-o> <S-o><ESC>j

" ztやzzやz-などの再描画をspaceをプリフィックスにして
" Shift+Hみたいな挙動と似せて(語彙力
" zhはz<Left>だしzlはz<Right>で代替可能､zmは上書きされます
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

" <Space> → jkhlのどれかで多めに移動
nmap <Space>h 7h
nmap <Space>j 10j
nmap <Space>k 10k
nmap <Space>l 7l

" xやXやsで消した内容を無名レジスタに登録しない
" ※一文字消しただけで無名レジスタが上書きされることを妨害する代わりに
" 5xでちょうどよく切り取りペーストするのは諦める
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s

" ウィンドウのプレフィックスが押しにくいので代替
nnoremap <Space>w <C-w>

" ウィンドウの移動の簡略化
" これやると､<Space>jとかできなくなるのでやめた
" nnoremap <Space>h <C-w>h
" nnoremap <Space>j <C-w>j
" nnoremap <Space>k <C-w>k
" nnoremap <Space>l <C-w>l

" ウィンドウの水平分割と垂直分割の簡略化
nnoremap <Space>- :split<CR>
nnoremap <Space><Bar> :vsplit<CR>


"" インサートモード用

" jjでESC、つまりインサートモードからノーマルモードへ
" ちなみに日本語入力の大きなｊｊはjjに変換すればいい
" また、jjと続けて入力したい場合は1文字ずつ間を置く
inoremap <silent> jj <ESC>

" 日本語入力のｊｊの後にEnterキーで↑
inoremap <silent> ｊｊ <ESC>

" 日本語入力で"っｊ"と入力してEnterキーで確定させればインサートモードを抜ける
" コピペなのでよく分からない
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>
function! Fcitx2en()
  let s:input_status = system("fcitx-remote")
    if s:input_status == 2
      let l:a = system("fcitx-remote -c")
    endif
endfunction
set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2en()

" インサートモードから抜ける際に日本語入力を解除する
" https://teratail.com/questions/90348
" inoremap <ESC> <ESC>:set iminsert=0<CR>
" autocmd InsertLeave * set iminsert=0 imsearch=0

" インサートモード時の移動を変更
" <C-h>はbackspaceキーと連動しているので、
" インサートモードでのbackspaceを用いた前の1文字削除が出来なくなることに注意
" 2個上のキーマッピングで左1文字を消すキーを設定
" inoremap <C-h> <left>
" inoremap <C-j> <down>
" inoremap <C-k> <up>
" inoremap <C-l> <right>
"
" インサートモード時の移動をemacsキーバインド方式に
" inoremap <C-p> <Up>
" inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i
inoremap <C-e> <End>

" インサートモード時にカーソル位置の1文字削除をemacsキーバインド方式に
" カーソルの1つ左削除はvimのデフォルトで既に<C-h>でok
inoremap <C-d> <delete>

" インサートモード時のインデントの字下げ削除
" ※字下げはvimのインサートモード標準の<C-t>
" ※本当は<C-,>が<と同じ位置だったのでそれでマッピングしたかったけど反応しない…
inoremap <C-l> <C-d>


"" ヴィジュアルモード用

" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" vを二回で行末まで選択
vnoremap v $h

" ビジュアルモード中の"*yをzの一押しに､その後ブラウザに即ペースト可能
vnoremap z "*y