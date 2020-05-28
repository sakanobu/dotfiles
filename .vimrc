""" メモ
" Karabiner-Elementsのようにvimライクなbashなどを↓
" https://mrsekut.site/?p=3266

" pasteモードの時にjjでインサートモードにいけるようにしたいな
" というか､何かが邪魔してるのか?

" インサートモードに戻ったら､かな入力から半角英数字入力になってほしい

" JavaScriptとかのFileTypeの追記や.vimフォルダの編集

" .vim/after/ftpluginの中にある拡張子毎の個別設定を忘れないで…


""" 導入

" ubuntuのデフォルトのvimはクリップボード連携ができない最小機能のvim-tiny
" というわけで､vim-gnomeを持ってこよう!
" sudo apt-get install vim-gnome
" Macの場合はhomebrewでごちゃごちゃやる

" .vimrcの内容を変更した時に再度vimが起動するのを省略
" :source ~/.vimrc

" エンコードなど
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" ↓の設定でiso-2022-jpでファイルが保存されるという珍事があった
" しょうがないのでMacのテキストエディタでiso-2022-jpで開き､
" 保存の際にutf-8にして保存するということで対処
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8



""" vim-plug導入

" まずは↓をターミナルで実行してvim-plugを持ってくる
" ↓のは一行だよ｡行末の¥は\じゃないとダメかも
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs ¥
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" vim-plugをダウンロードできたら↓を忘れずに続行
" :PlugInstall
" :PlugStatus  で確認
"
" vim-plugがインストールされていなかったら自動インストール
" だが､この自動化はなんかうまくいかない…
" centOSで設定した内容をubuntuにコピペしたらこの下でエラー吐くな…
" まぁ、手動で↑のvim-plugのインストールを打ち込めばいいか
" if has('vim_starting')
"   set rtp+=~/.vim/plugged/vim-plug
"   if !isdirectory(expand('~/.vim/plugged/vim-plug'))
"     echo 'install vim-plug...'
"     call system('mkdir -p ~/.vim/plugged/vim-plug')
"     call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
"   end
" endif



""" vim-plugの本文

call plug#begin('~/.vim/plugged')

"  j/kによる移動を速くする
Plug 'rhysd/accelerated-jk'

" 常にカーソル上下に少なくとも1行表示するなど､vimの挙動を変えてる
" 詳しくはREADME.md
Plug 'tpope/vim-sensible'

" ステータスライン表示をおしゃれに
Plug 'itchyny/lightline.vim'

" 行末のスペースを色付けする
" :FixWhitespace で自動削除
Plug 'bronson/vim-trailing-whitespace'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" ()の表示をカラフルに
" デフォルトの設定では見にくいので変更しようとしたけどそれが分からず放置
" Plug 'luochen1990/rainbow'

" html閉じタグを自動挿入する
Plug 'alvan/vim-closetag'

" htmlを楽々コーディング､専用の文法を書いたあとにC-y → , とすれば展開
" https://qiita.com/yyuuiikk/items/6c7e793b9c734a84b62a
" http://motw.mods.jp/Vim/emmet-vim.html
Plug 'mattn/emmet-vim'

" () や {} の自動入力
" ※注意
" Plug 'cohama/lexima.vim'に乗り換えようとしたが､
" 1.カーソルの1つ右に文字がある場合は自動補完しない
" 2.{}の補完でインデントした新たな行を間にはさむ
" という2つの条件を満たすにはこの↓の2つのプラグインを同時に使うことだった!
Plug 'Townk/vim-autoclose'
Plug 'kana/vim-smartinput'

" 文字列を囲っている引用符や括弧を編集
" http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
" 1.()や[]や{}などの閉じカッコもあるものは閉じカッコを押すと空白を無くして囲える
" 2.ysから始めるとヴィジュアルモードを経由せずにテキストオブジェクトで指定できる
Plug 'tpope/vim-surround'

" vimの矩形選択で一括挿入みたいなやつをもっと強力に
Plug 'terryma/vim-multiple-cursors'

"  Ctrl + / (/は2回押す)でコメントのON/OFF、gccでも可
"  2019_04_06現在､gccなら可能だが､/では反応なし
Plug 'tomtom/tcomment_vim'

" Tabキーで補完
Plug 'ervandew/supertab'

" .でのリピートを強化
" Plug 'tpope/vim-repeat'

" ソースコードを実行し、その結果をVim上で表示することができる
" デフォルトでは実行結果が編集領域の上または左に表示されるため
" 以下で変更した方がよいかもしれない
" " エディタの分割方向を設定する
" set splitbelow
" set splitright
Plug 'thinca/vim-quickrun'

" カラースキーム solarized
Plug 'altercation/vim-colors-solarized'

" vim-lspまとめ
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" neocomplete.vimに変わる自動補完機能､deoplete.nvim
" https://githubja.com/shougo/deoplete-nvim
" エラーには､pip install pyvim で対処した
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" deopleteのpython3用スニペット
Plug 'deoplete-plugins/deoplete-jedi'

" vimを開いたままgitのコマンドを実行
Plug 'tpope/vim-fugitive'

" gitの差分をファイルの左に表示
Plug 'airblade/vim-gitgutter'

" ディレクトリツリーを一覧で表示したりファイルの追加削除したり
" https://qiita.com/zwirky/items/0209579a635b4f9c95ee
Plug 'scrooloose/nerdtree'

" プロジェクト内のファイルやバッファ、履歴からファイルを検索
" https://qiita.com/oahiroaki/items/d71337fb9d28303a54a8
" Plug 'ctrlpvim/ctrlp.vim'

" 構文チェックをしてくれるプラグイン
" flake8とかちゃんとインストールしておかないとダメだよ
" :syntasticInfoをvim内で打てば現在使われているチェッカーを確認できる
" :SynstaicCheckや:Errorsなど使い方の説明は↓
" https://wonderwall.hatenablog.com/entry/2017/02/05/214004
" pythonに関してはvim-flake8という↓にあるプラグインでいいかなって感じ
Plug 'vim-syntastic/syntastic'

" ctagsを利用した
Plug 'majutsushi/tagbar'

call plug#end()



""" プラグインの追加設定

" 記述の順番は↑のプラグインを書いた順番に準拠､GitHubとかでウィンドウ出してた
" 基本的にキーマッピングは.vimrcの最下層に書いてるが､
" プラグインのマッピングだけはここに書くという例外


"" rhysd/accelerated-jk

" j/kによる移動を速くする
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

" vim-indent-guidesの有効化
let g:indent_guides_enable_on_vim_startup = 1

" 色の変更
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" ↑の設定だとvimの単語検索のハイライトと被ってしまうので↓に変更
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray


"" luochen1990/rainbow

" :RainbowToggle無しでの自動実行
" let g:rainbow_active = 1

" config
" ?


"" terryma/vim-multiple-cursors

" deopleteによって動作が重くなるのを回避
" ※いや…重いまんまなんだが…
func! Multiple_cursors_before()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunc
func! Multiple_cursors_after()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunc


"" tomtom/tcomment_vim
" コメントアウトまでのタイピングを少なく
nmap <Space>c gcc


"" ervandew/supertab

" 謎
" let g:SuperTabContextDefaultCompletionType = "context"

" 謎
" let g:SuperTabDefaultCompletionType = "<c-n>"


"" thinca/vim-quickrun

" 今後対応
" ①::QuickRun -args foo
" ②::QuickRun -args "foo bar baz"

" vim-quickrunの実行簡略化
nnoremap <Space>r :QuickRun<CR><C-w>j

" 結果は水平分割で表示
let g:quickrun_config={'*': {'split': ''}}

" 水平分割の際に結果を下のウィンドウに
set splitbelow

" pythonの実行時にはpython3を使用
let g:quickrun_config.python = {'command' : 'python3'}


"" prabirshrestha/vim-lsp

" 参考にしたサイト
" https://mattn.kaoriya.net/software/vim/20191231213507.htm

" 定義元ジャンプ
nmap <buffer> gd <plug>(lsp-definition)

" オムニ補完､つまりオブジェクトの後の.で補完候補表示
setlocal omnifunc=lsp#complete

" 自動エラー検出及びその表示方法
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_diagnostics_echo_delay = 1000
" let g:lsp_diagnostics_float_cursor = 1
" let g:lsp_diagnostics_echo_delay = 200


"" Shougo/deoplete.nvim

" deopleteを有効に
let g:deoplete#enable_at_startup = 1


"" airblade/vim-gitgutter

" 変更の時間を4秒から0.2秒へ
set updatetime=200

" 左端の記号だけでなく行の強調表示も
let g:gitgutter_highlight_lines = 1


"" ctrlpvim/ctrlp.vim

" 検索モードを開く
" nmap <Leader>f :CtrlP<CR>


"" vim-shyntastic/syntastic

" README.mdの推奨設定
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ロケーションリストの永続表示､README.mdの4.6
let g:syntastic_always_populate_loc_list = 1

" 構文エラーリストを表示
let g:syntastic_auto_loc_list = 1

" ファイルを開いた時に構文エラーチェックを実行しない
let g:syntastic_check_on_open = 0

" 「:wq」で終了する時には構文エラーチェックをしない
let g:syntastic_check_on_wq = 0

" 複数のツールの解析結果をまとめて表示､README.mdの4.4
let g:syntastic_aggregate_errors = 1

" .py時に行われるツール､flake8から行われる
" pylintは厳しすぎるし､flake8にはflake8-docstrings,flake8-import-order,
" hackingなどのFlake8プラグインがあり､ また自動フォーマッタのblackや
" isortとの相性もOK!とする記事もあったので､flake8だけにしました
" https://blog.hirokiky.org/entry/2019/06/03/202745
let g:syntastic_python_checkers = ['flake8', 'mypy']

" JavaScript用
let g:syntastic_javascript_checkers = ['eslint']

" TypeScript用
let g:syntastic_typescript_checkers = ['eslint']

" Javascript以外は構文エラーチェックをしない
" let g:syntastic_mode_map = {
"       \ 'mode': 'passive',
"       \ 'active_filetypes': ['javascript'],
"       \ 'passive_filetypes': []
"       \ }


"" majutsushi/tagbar

" デフォルトはF8だったけど以下のコマンドで実行
nnoremap <Space>tag :TagbarToggle<CR>



""" FileType定義

" FileTypeと.vim/ftpluginの活用
" https://qiita.com/s_of_p/items/b61e4c3a0c7ee279848a
" Filetypeの設定はftdetectにauto~ と書いたほうがいい?

" autocmdはそのまま書くと何度も実行されて重くなる?ので
" augroupとautocmd!の使うらしい､詳細↓
" :source ~/.vimrcを使う場合用ってことかな?
" https://qiita.com/s_of_p/items/b61e4c3a0c7ee279848a
" https://alpaca.tc/blog/vim/break-vim-beginners-augroup.html
" 他のautocmd の後ろに毎回MyGroup書かないとだめなのか?
augroup MyGroup
    autocmd!
    autocmd BufRead,BufNewFile *.py setfiletype python
    autocmd BufRead,BufNewFile *.js setfiletype javascript
    autocmd BufRead,BufNewFile *.ts setfiletype typescript
    autocmd BufRead,BufNewFile *.c setfiletype c
    autocmd BufRead,BufNewFile *.cpp setfiletype c++
augroup END



""" システム系

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" ビープ音を可視化
set visualbell

" クリップボード連携(つまりコピペ)
" 2019_04_07現在,この部分をオンにすると
" yyを用いたヤンク(無名レジスタ?)が使用できなくなっている｡
" このままだとこの部分をオフにしてyyヤンクを取るか､
" それとも､オンにして異なるウィンドウ間のコピペを可能にするか
" という二者択一を迫られてしまう｡
" 詳細な原因は調べてはいないが､MacのVirtualBoxのcentos7では問題なかったことから､
" 恐らくMac本体でのクリップボードの設定で何らかの問題が発生しているものと思われる｡
" 2019_06_09現在､ubuntuの場合はvim-tinyがゴミのせいだからvim-gnomeにすることを知っった
" そこで､以下のコメントアウトを説いてみることにする
" Macの方では↑のコメントで書いた問題が再度生じる可能性があるので､うーん
" 試したところダメでした､ubuntuで"*yは諦めるか
" 一応､VirtualBoxのクリップボード共有云々も双方と設定したんだけどなぁ
" set clipboard=unnamedplus



""" 見た目系

" Windowの縦を指定
set lines=56

" Windowの横幅を指定
set columns=187

" 構文ごとに文字色を変化
syntax enable

" 行番号を表示する
set number

" 行番号の色
highlight LineNr ctermfg=darkyellow

" 画面の上下に余裕をもたせてスクロール
" ※数字の数だけ余分に見える
set scrolloff=2

" 画面の左右に余裕をもたせてスクロール
" ただ､macのコンソール画面幅の環境設定によって自動折返し入ってるから意味ない…
set sidescrolloff=16

" 画面の左右スクロールは1文字ずつ行う
" 同上の注意
set sidescroll=1

" カーソルが何行目の何列目に置かれているかを表示
set ruler

" カーソル行の背景色を変える
set cursorline

" カーソル位置のカラムの背景色を変える
set cursorcolumn

" タブ、改行などをset listcharsで設定した文字で可視化
set list

" タブと行の続きを可視化
" ①tabなどは他人のファイルで空白とtabがゴッチャになってるのを見抜くため
" ②extendsなどは自分用
set listchars=tab:>-,extends:>,precedes:<,nbsp:%

" 全角スペースの可視化(listcharsでは対応不可能だったので)
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" 括弧入力時の対応する括弧を表示
set showmatch

" 入力中のコマンドを表示する
set showcmd

" 編集中ファイル名の表示
set title

" コマンドラインに使われる画面上の行数
set cmdheight=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}



""" カラースキーム系

"" solarized関連
colorscheme solarized



""" 入力系

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" インサートモードから抜けるときにpasteモードをやめる
autocmd InsertLeave * set nopaste

" 改行時に前の行のインデントを継続する
set autoindent

" インデントの増減を自動で行う際のインデントする幅●
" デフォルトは2､だがfiletypeによって変更しており､
" .vim/after/ftpluginにそれぞれ個別に設定
set shiftwidth=2

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" Tab文字の代わりに半角スペースに
" filetypeによって変更するのかは悩み中
set expandtab

" タブ文字の表示幅●
" デフォルトは2､だがfiletypeによって変更しており､
" .vim/after/ftpluginにそれぞれ個別に設定
set tabstop=2

" 指定した数のスペースを1回で削除できるようにする●
" 0を設定するとtabstopの値を参照する
" .vim/after/ftpluginに個別に設定してもいいかも
set softtabstop=0

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab



""" 補完系

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" コマンドラインの補完
set wildmode=list:longest



""" 検索系

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

" TABにて対応ペアにジャンプ
nnoremap <Tab> %

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
inoremap <C-p> <Up>
inoremap <C-n> <Down>
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

" TABにて対応ペアにジャンプ
vnoremap <Tab> %
