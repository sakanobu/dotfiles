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

" .vimrcの内容を変更した時に再度vim起動するのを焼灼
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

" 謎
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

" カッコ（(や{など）を入力すると、自動で閉じカッコを補完
Plug 'Townk/vim-autoclose'

" () や {} の自動入力
Plug 'kana/vim-smartinput'

" 文字列を囲っている引用符や括弧を編集
" http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
" 1.()や[]や{}などの閉じカッコもあるものは閉じカッコを押すと空白を無くして囲える
" 2.ysから始めるとヴィジュアルモードを経由せずにテキストオブジェクトで指定できる
Plug 'tpope/vim-surround'

" SublimeTextでの複数カーソルもどき
" 詳細は以下のurlで確認
" https://github.com/terryma/vim-multiple-cursors
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

" 選択した文字列をコマンドで上下左右に移動したり、コピーしたりできる
" 詳細は以下のURLで確認
" https://vim-jp.org/vim-users-jp/2011/07/18/Hack-223.html
" Plug 't9md/vim-textmanip'

" カラースキーム solarized
Plug 'altercation/vim-colors-solarized'

" カラースキーム molokai
" Plug 'tomasr/molokai'

" カラースキーム badwolf
" Plug 'sjl/badwolf'

" カラースキーム Twilight
" Plug 'vim-scripts/twilight'

" vim-lspまとめ
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"  自動補完機能を有効にする
" Plug 'Shougo/neocomplete.vim'

" スニペット入力サポート
" neocomplete.vimや次のスニペット集と合わせて導入
" Plug 'Shougo/neosnippet.vim'

" neosnippet.vimのためのスニペット集
" Plug 'Shougo/neosnippet-snippets'

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

" pythonの補完､ジェダイ
" .を押すと補完候補が現れる｡
" 詳しくは↓
" https://wonderwall.hatenablog.com/entry/2017/01/29/213052
" Plug 'davidhalter/jedi-vim'

" flake8のプラグイン
" 追記設定でキーバインドなどを変更している(デフォルトだとF7で実行されちゃう)
" Plug 'nvie/vim-flake8'

" pythonのコーディングスタイルチェックどころか自動で修正してくれる
" 事前にpip3 install autopep8をしておこうね
" :Autopep8で実行､
" Plug 'tell-k/vim-autopep8'

" Rubyのコード補完機能を提供
" Plug 'osyo-manga/vim-monster'

" Ruby向けにendを自動挿入(本採用)
" Plug 'tpope/vim-endwise'

" Rubyのendキーワードを自動挿入part2
" Plug 'cohama/vim-smartinput-endwise'

" Ruby のシンタックスプラグインやその他便利機能が色々入ってる
" Plug 'vim-ruby/vim-ruby'

" Rubyのローカル変数をハイライト表示
" なぜかエラー吐いちゃう
" もうちょい詳しくなるまで放置 ↓の記事は使えそう
" https://pocke.hatenablog.com/entry/2014/06/22/113012
" Plug 'todesking/ruby_hl_lvar.vim'

" %を押せばendに飛べる(Ruby?)
" Plug 'vim-scripts/ruby-matchit'

" REPLをvimで
" Plug 'ujihisa/repl.vim'

" vimを開いたままgitのコマンドを実行
Plug 'tpope/vim-fugitive'

" ディレクトリツリーを一覧で表示したりファイルの追加削除したり
Plug 'scrooloose/nerdtree'

" プロジェクト内のファイルやバッファ、履歴からファイルを検索
" https://qiita.com/oahiroaki/items/d71337fb9d28303a54a8
Plug 'ctrlpvim/ctrlp.vim'

" ファイルを保存したときに追加で.vimrcに記述したもので文法を自動チェック
" 2019_09_05､えぇ!これの改良版が↓なのでこれはもう使えないのか…
" Plug 'scrooloose/syntastic'
"
" 構文チェックをしてくれるプラグイン
" flake8とかちゃんとインストールしておかないとダメだよ
" :syntasticInfoをvim内で打てば現在使われているチェッカーを確認できる
" :SynstaicCheckや:Errorsなど使い方の説明は↓
" https://wonderwall.hatenablog.com/entry/2017/02/05/214004
" pythonに関してはvim-flake8という↓にあるプラグインでいいかなって感じ
Plug 'vim-syntastic/syntastic'

call plug#end()



""" プラグインの追加設定

" 記述の順番は↑のプラグインを書いた順番に準拠､GitHubとかでウィンドウ出してた


"" rhysd/accelerated-jk

" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


"" vim-indent-guides

" 謎
let g:indent_guides_enable_on_vim_startup = 1


"" luochen1990/rainbow

" :RainbowToggle無しでの自動実行
" let g:rainbow_active = 1

" config
" ?

"" supertab

" 謎
" let g:SuperTabContextDefaultCompletionType = "context"

" 謎
" let g:SuperTabDefaultCompletionType = "<c-n>"


"" vim-quickrun

" 今後対応
" ①::QuickRun -args foo
" ②::QuickRun -args "foo bar baz"

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


"" Shougo/neocomplete.vim

" 自動補完機能を有効にする
" let g:neocomplete#enable_at_startup = 1


"" Shougo/deoplete.nvim

" 謎
let g:deoplete#enable_at_startup = 1


"" jedi-vim

" 参考サイトは
" https://kashewnuts.github.io/2018/08/22/jedivim_memo.html
" https://wonderwall.hatenablog.com/entry/2017/01/29/213052
"
" 補完候補を呼び出すとき常にポップアップメニューを使う
" set completeopt=menuone

" vim-plugの遅延ロード呼び出し
" autocmd! User jedi-vim call s:jedivim_hook()

" jedi-vimを使うときだけ呼び出す処理を関数化
" function! s:jedivim_hook()
  " 自動で実行される初期化処理を無効
  " let g:jedi#auto_initialization    = 0

  " 'completeopt' オプションを上書きしない
  " let g:jedi#auto_vim_configuration = 0

  " ドット(.)を入力したとき自動で補完しない
  " let g:jedi#popup_on_dot           = 0

  " 補完候補の1番目を選択しない
  " let g:jedi#popup_select_first     = 0

  " 関数の引数表示を無効(ポップアップのバグを踏んだことがあるため)
  " let g:jedi#show_call_signatures   = 0

  " 補完エンジンはjediを使う
  " autocmd FileType python setlocal omnifunc=jedi#completions
" endfunction


"" vim-flake8

" ファイル保存時に実行､だが重くなるのでコメントアウト
" autocmd BufWritePost *.py call Flake8()

" キーバインド変更､そもそもfiletypeがpythonじゃないとF7でも実行されないぽい
" デフォルトは<F7>､↓の設定は過去の自分が錯綜して設定
" autocmd FileType python map <buffer> <Space>f8 :call Flake8()<CR>

" Quickfixの位置､デフォルトにすると下にQuickFixを開いてくれるのでコメントアウト
" let g:flake8_quickfix_location="topleft"

" Quickfixの高さ
let g:flake8_quickfix_height=7

" 左端にシンボルを表示
let g:flake8_show_in_gutter=1

" ファイル内にマークを表示
let g:flake8_show_in_file=1


"" autopep8

" 謎
let g:autopep8_max_line_length=99

" 謎
let g:autopep8_disable_show_diff=1

" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
" function! Preserve(command)
"     " Save the last search.
"     let search = @/
"     " Save the current cursor position.
"     let cursor_position = getpos('.')
"     " Save the current window position.
"     normal! H
"     let window_position = getpos('.')
"     call setpos('.', cursor_position)
"     " Execute the command.
"     execute a:command
"     " Restore the last search.
"     let @/ = search
"     " Restore the previous window position.
"     call setpos('.', window_position)
"     normal! zt
"     " Restore the previous cursor position.
"     call setpos('.', cursor_position)
" endfunction

" 謎
" function! Autopep8()
"     call Preserve(':silent %!autopep8 -')
" endfunction


"" vim-monster

" neocomplete.vimとあわせて導入←よく分からない…
" let g:neocomplete#sources#omni#input_patterns = {
" \  'ruby': '[^. *¥t]\.\w*\|\h\w*::'
" \}


"" NERDTree

" MacだとNERDTeeでまるごとエラー吐いちゃう
"
" Ctrl+nでNERDTreeを表示
" map <C-n> :NERDTreeToggle<CR>
"
" 隠しファイルをデフォルトで表示させる
" let NERDTreeShowHidden = 1

" デフォルトでツリーを表示させる
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 拡張子のHighlight設定
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^¥s¥+.*'. a:extension .'$#'
" endfunction

" 着色
" call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ディレクトリ表示記号を変更する
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = '?'

" Macだと↓でエラーを吐いてる
" ↓をコメントアウトしたらもっとエラー吐いた…
" let g:NERDTreeDirArrowCollapsible = '▼'


"" ctrlpvim/ctrlp.vim

" 検索モードを開く
nmap <Leader>f :CtrlP<CR>


"" shyntastic

" README.mdの推奨設定
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ロケーションリストの永続表示､README.mdの4.6
let g:syntastic_always_populate_loc_list = 1

" 構文エラーリストを表示
let g:syntastic_auto_loc_list = 1

" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1

" 「:wq」で終了する時には構文エラーチェックをしない
let g:syntastic_check_on_wq = 0

" 複数のツールの解析結果をまとめて表示､README.mdの4.4
let g:syntastic_aggregate_errors = 1

" .py時に行われるツール､flake8から行われる
" pylintは厳しすぎるし､flake8にはflake8-docstrings,flake8-import-order,
" hackingなどのFlake8プラグインがあり､ また自動フォーマッタのblackや
" isortとの相性もOK!とする記事もあったので､flake8だけにしました
" https://blog.hirokiky.org/entry/2019/06/03/202745
let g:syntastic_python_checkers = ['flake8']

" Javascript以外は構文エラーチェックをしない
" let g:syntastic_mode_map = {
"       \ 'mode': 'passive',
"       \ 'active_filetypes': ['javascript'],
"       \ 'passive_filetypes': []
"       \ }


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
set lines=53

" Windowの横幅を指定
set columns=87

" 構文ごとに文字色を変化
syntax enable

" 行番号を表示する
set number

" 行番号の色
highlight LineNr ctermfg=darkyellow

" 画面の上下に余裕をもたせてスクロール
set scrolloff=5

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

" 折り返し時に表示行単位での移動
nnoremap <silent> j gj
nnoremap <silent> k gk

" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" インサートモードから抜けるときにpasteモードをやめる
autocmd InsertLeave * set nopaste

" インサートモードから抜ける際に日本語入力を解除する
" https://teratail.com/questions/90348
" inoremap <ESC> <ESC>:set iminsert=0<CR>
" autocmd InsertLeave * set iminsert=0 imsearch=0

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

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz



""" キーマッピングorキーバインド系

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

" :qを<Space>qで
nnoremap <Space>q :q<CR>

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
nmap <Space>so :<C-u>source<Space>$MYVIMRC<CR><ESC><ESC>ijj

" どこのファイルからでもすぐ.vimrcを編集
nnoremap <Space>ed :<C-u>edit $MYVIMRC<CR>

" :set numberと:set nonumberのキーバインド
nnoremap <Space>sny :set number<CR>
nnoremap <Space>snn :set nonumber<CR>

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Plug 'tomtom/tcomment_vim'のコメントアウトを短く
nmap <Space>c gcc

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
vnoremap <Tab> %

" 行の最初の文字へ移動
nnoremap <Space>a ^

" 行末へ移動
nnoremap <Space>e $

" <Space> → jkhlのどれかで多めに移動
nmap <Space>h 7h
nmap <Space>j 10j
nmap <Space>k 10k
nmap <Space>l 7l

" ウィンドウのプレフィックスが押しにくいので変更
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

" vim-quickrunの実行簡略化
nnoremap <Space>r :QuickRun<CR><C-w>j


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

" インサートモード時にカーソル左の1文字削除(ノーマルモードでの…どれだ…?)
inoremap <C-b> <BS>

" インサートモード時にカーソル位置の1文字削除(ノーマルモードでのx)
inoremap <C-d> <delete>

" インサートモード時の移動
" <C-h>はbackspaceキーと連動しているので、
" インサートモードでのbackspaceを用いた前の1文字削除が出来なくなることに注意
" 2個上のキーマッピングで左1文字を消すキーを設定
" inoremap <C-h> <left>
" inoremap <C-j> <down>
" inoremap <C-k> <up>
" inoremap <C-l> <right>
"
" emacsキーバインド方式に
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <ESC>^i
imap <C-e> <End>

"" ヴィジュアルモード用
" vを二回で行末まで選択
vnoremap v $h

" ビジュアルモード中の"*yをzの一押しに､その後ブラウザに即ペースト可能
vnoremap z "*y
