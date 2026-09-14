" エンコードなど
set encoding=utf-8

" ==============================================================================
" プラグイン管理 (vim-plug)
" ==============================================================================

call plug#begin('~/.vim/plugged')

"  j k による移動を速くする
Plug 'rhysd/accelerated-jk'

" ステータスライン表示をおしゃれに
Plug 'itchyny/lightline.vim'

" 行末のスペースを色付けする
" :FixWhitespace で自動削除
Plug 'bronson/vim-trailing-whitespace'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" 文字列を囲っている引用符や括弧を編集
" http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
" 1 () や [] や {} などの閉じカッコもあるものは閉じカッコを押すと空白を無くして囲える
" 2 ys から始めるとビジュアルモードを経由せずにテキストオブジェクトで指定できる
Plug 'tpope/vim-surround'

" カラースキーム solarized
Plug 'altercation/vim-colors-solarized'

" Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Ruby 用の end 閉じ
Plug 'tpope/vim-endwise'

" Vim を開いたまま Git のコマンドを実行
Plug 'tpope/vim-fugitive'

" Git の差分をファイルの左に表示
Plug 'airblade/vim-gitgutter'

" ctags で生成されたタグを簡単に閲覧できる
Plug 'preservim/tagbar'

call plug#end()

" ==============================================================================
" プラグインの追加設定
" ==============================================================================

"" rhysd/accelerated-jk

" j k による移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"" itchyny/lightline.vim

" ステータスバーの表示内容変更

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

""nathanaelkane/vim-indent-guides

" vim-indent-guides の有効化
let g:indent_guides_enable_on_vim_startup = 1

" 色の変更
let g:indent_guides_auto_colors = 0
augroup vimrc_indent_guides
  autocmd!
  autocmd VimEnter,ColorScheme * highlight IndentGuidesOdd  guibg=#262626 ctermbg=gray
  autocmd VimEnter,ColorScheme * highlight IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
augroup END

"" neoclide/coc.nvim

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" Vim の <S-k> によるカーソル上にある単語の Vim のマニュアル表示を維持しつつ(filetypeで)､
" TypeScript などではカーソル上の単語のホバーを出すなどしてくれる!
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
augroup vimrc_coc
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

"" airblade/vim-gitgutter

" 左端の記号だけでなく行の強調表示も
let g:gitgutter_highlight_lines = 1

"" preservim/tagbar

" デフォルトは F8 だったけど以下のコマンドで実行
nnoremap <Space>tag :TagbarToggle<CR>

" ==============================================================================
" システム系
" ==============================================================================

" バックアップファイルを作らない
set nobackup

" 上書き保存前の一時ファイルを作成しない
set nowritebackup

" スワップファイルを作らない
set noswapfile

" 外部で変更されたファイルを自動再読込
set autoread

" 変更済みバッファを保存しないまま別バッファへ移れるようにする
set hidden

" エラーなどの bell を音ではなく画面上の視覚的な通知にする
set visualbell

" キーコードの入力待ち時間
set ttimeoutlen=150

" CursorHold 等の反応を 4 秒から 0.2 秒へ速くする
" vim-gitgutter や coc.nvim にも影響
set updatetime=200

" ==============================================================================
" 見た目系
" ==============================================================================

" 構文ごとに文字色を変化
syntax enable

" 行番号を表示する
set number

" カーソル上下に 2 行の余白を確保
set scrolloff=2

" カーソルが何行目の何列目に置かれているかを表示
set ruler

" カーソル行の背景色を変える
set cursorline

" カーソル位置のカラムの背景色を変える
set cursorcolumn

" タブ、改行などを set listchars で設定した文字で可視化
set list

" タブと行の続きを可視化
set listchars=tab:>-,extends:>,precedes:<,nbsp:%

" 全角スペースの可視化
function! s:highlight_zenkaku_space()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray

  if empty(filter(getmatches(), 'v:val.group ==# "ZenkakuSpace"'))
    call matchadd('ZenkakuSpace', '　')
  endif
endfunction

augroup vimrc_zenkaku_space
  autocmd!
  autocmd ColorScheme * call <SID>highlight_zenkaku_space()
  autocmd VimEnter,WinEnter,BufRead * call <SID>highlight_zenkaku_space()
augroup END

call s:highlight_zenkaku_space()

" 括弧入力時の対応する括弧を表示
set showmatch

" 入力中のコマンドを表示する
set showcmd

" 編集中ファイル名の表示
set title

" コマンドラインに使われる画面上の行数
set cmdheight=2

" エディタウィンドウの末尾から 2 行目にステータスラインを常時表示させる
set laststatus=2

" Coc diagnostics や GitGutter の sign が出たり消えたりしたとき、本文が左右にガタガタ動くのを防ぐ
" neoclide/coc.nvim にも影響あり
set signcolumn=yes

" ==============================================================================
" カラースキーム系
" ==============================================================================

" solarized
colorscheme solarized

" 行番号の色(solarized に上書きされない)
highlight LineNr ctermfg=darkyellow

" ==============================================================================
" 入力系
" ==============================================================================

" 行末の 1 文字先までカーソルを移動できるように
set virtualedit=onemore

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" Insert モードを抜けたら paste モードを解除
augroup vimrc_paste
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

" 改行時に前の行のインデントを継続する
set autoindent

" デフォルトのインデント幅
set shiftwidth=2

" Tab 入力を半角スペースにする
set expandtab

" デフォルトの Tab 表示幅
set tabstop=2

" ==============================================================================
" 補完系
" ==============================================================================

" コマンドラインモードで <Tab> キーによるファイル名補完を有効にする
set wildmenu

" コマンドラインの補完
set wildmode=list:longest

" ==============================================================================
" 検索系
" ==============================================================================

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索結果をハイライト表示
set hlsearch

" ==============================================================================
" キーマッピング or キーバインド
" ==============================================================================

"" 注意

" Space を擬似 Leader として使用

"" ノーマルモード用

" .vimrc の再読み込み
nnoremap <silent> <Space>so :<C-u>source $MYVIMRC<CR>

" どこのファイルからでもすぐ .vimrc を編集
nnoremap <silent> <Space>ed :edit $MYVIMRC<CR>

" :q を <Space>q でも行える
nnoremap <silent> <Space>q :quit<CR>

" :set number と :set nonumber の切り替えを <Space>sn で行える
nnoremap <silent> <Space>sn :set number!<CR>

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

" <Space> → jkhl のどれかで多めに移動
nnoremap <Space>h 7h
nnoremap <Space>j 10j
nnoremap <Space>k 10k
nnoremap <Space>l 7l

" 1 文字削除で yank 内容を上書きしない
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s

" ウィンドウのプレフィックスが押しにくいので代替
nnoremap <Space>w <C-w>

" ウィンドウの水平分割と垂直分割の簡略化
nnoremap <silent> <Space>- :split<CR>
nnoremap <silent> <Space><Bar> :vsplit<CR>

"" インサートモード用

" jj で Normal モードへ戻る
inoremap <silent> jj <ESC>

" 日本語入力中でも Normal モードへ戻れるようにする
inoremap <silent> ｊｊ <Esc>
inoremap <silent> っｊ <Esc>
inoremap <silent> っj <Esc>

" Insert モードを抜けたら Fcitx を英数入力へ戻す
function! s:fcitx_to_english()
  if executable('fcitx-remote') && str2nr(system('fcitx-remote')) == 2
    call system('fcitx-remote -c')
  endif
endfunction

augroup vimrc_fcitx
  autocmd!
  autocmd InsertLeave * call <SID>fcitx_to_english()
augroup END

" インサートモード時の移動を emacs キーバインド方式に
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i

" インサートモード時にカーソル位置の 1 文字削除を emacs キーバインド方式に
" カーソルの 1 つ左削除は Vim のデフォルトで既に <C-h> で ok
inoremap <C-d> <delete>

" インサートモード時のインデントの字下げ削除
" ※字下げは Vim のインサートモード標準の <C-t>
" ※本当は <C-,> が < と同じ位置だったのでそれでマッピングしたかったけど反応しない…
inoremap <C-l> <C-d>

"" ビジュアルモード用

" visual モードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" v を二回で行末まで選択
vnoremap v $h

" ビジュアルモード中の "*y を z の一押しに､その後ブラウザに即ペースト可能
vnoremap z "*y
