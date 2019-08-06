" 2019_06_09_Mac本体のvim(vim-plug)の設定.txt


""" メモ

" ノーマルモードで下に1行挿入みたいなキーバインド欲しいな

" pasteモードの時にjjでインサートモードにいけるようにしたいな
" というか､何かが邪魔してるのか?

" インサートモードに戻ったら､かな入力から半角英数字入力になってほしい


""" エンコードなど

" 本当は1つ下の段落の導入を先に書きたかったが､
" 先にエンコード読み込んだほうがいいかなと上に書いた

set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" ↓の設定でiso-2022-jpでファイルが保存されるという珍事があった
" しょうがないのでMacのテキストエディタでiso-2022-jpで開き､
" 保存の際にutf-8にして保存するということで対処
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8



""" 導入

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

" ubuntuのデフォルトのvimはクリップボード連携ができない最小機能のvim-tiny
" というわけで､vim-gnomeを持ってこよう!
" sudo apt-get install vim-gnome
" Macの場合はhomebrewでごちゃごちゃやる


""" vim-plugの本文

call plug#begin('~/.vim/plugged')

" 行末のスペースを色付けする
" :FixWhitespace で自動削除
Plug 'bronson/vim-trailing-whitespace'

" html閉じタグを自動挿入する
Plug 'alvan/vim-closetag'

" 謎
Plug 'tpope/vim-sensible'

" Ruby向けにendを自動挿入(本採用)
" Plug 'tpope/vim-endwise'

" Rubyのendキーワードを自動挿入part2
" Plug 'cohama/vim-smartinput-endwise'

"  Ctrl + / (/は2回押す)でコメントのON/OFF、gccでも可
"  2019_04_06現在､gccなら可能だが､/では反応なし
Plug 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" カラースキーム solarized
Plug 'altercation/vim-colors-solarized'

" ステータスライン表示をおしゃれに
Plug 'itchyny/lightline.vim'

" スニペット入力サポート
" neocomplete.vimや次のスニペット集と合わせて導入
Plug 'Shougo/neosnippet.vim'

" neosnippet.vimのためのスニペット集
Plug 'Shougo/neosnippet-snippets'

" カラースキーム molokai
Plug 'tomasr/molokai'

" カラースキーム badwolf
Plug 'sjl/badwolf'

" カラースキーム Twilight
Plug 'vim-scripts/twilight'

" REPLをvimで
" Plug 'ujihisa/repl.vim'

"  j/kによる移動を速くする
Plug 'rhysd/accelerated-jk'

"  自動補完機能を有効にする
Plug 'Shougo/neocomplete.vim'

" Rubyのコード補完機能を提供
" Plug 'osyo-manga/vim-monster'

" ソースコードを実行し、その結果をVim上で表示することができる
" デフォルトでは実行結果が編集領域の上または左に表示されるため
" 以下で変更した方がよいかもしれない
" " エディタの分割方向を設定する
" set splitbelow
" set splitright
Plug 'thinca/vim-quickrun'

" プロジェクト内のファイルやバッファ、履歴からファイルを検索
" 検索モードを開く
" nmap <Leader>f :CtrlP<CR>と併用
Plug 'ctrlpvim/ctrlp.vim'

" カッコ（(や{など）を入力すると、自動で閉じカッコを補完
Plug 'Townk/vim-autoclose'

" Rubyのローカル変数をハイライト表示
" なぜかエラー吐いちゃう
" もうちょい詳しくなるまで放置 ↓の記事は使えそう
" https://pocke.hatenablog.com/entry/2014/06/22/113012
" Plug 'todesking/ruby_hl_lvar.vim'

" 選択した文字列をコマンドで上下左右に移動したり、コピーしたりできる
" 詳細は以下のURLで確認
" https://vim-jp.org/vim-users-jp/2011/07/18/Hack-223.html
" Plug 't9md/vim-textmanip'

" vimを開いたままgitのコマンドを実行
Plug 'tpope/vim-fugitive'

" 文字列を囲っている引用符や括弧を編集
Plug 'tpope/vim-surround'

" ディレクトリツリーを一覧で表示したりファイルの追加削除したり
Plug 'scrooloose/nerdtree'

" Ruby のシンタックスプラグインやその他便利機能が色々入ってる
" Plug 'vim-ruby/vim-ruby'

" %を押せばendに飛べる
Plug 'vim-scripts/ruby-matchit'

" () や {} の自動入力
Plug 'kana/vim-smartinput'

" 構文チェックをしてくれるプラグイン
Plug 'vim-syntastic/syntastic'

" SublimeTextでの複数カーソルもどき
" 詳細は以下のurlで確認
" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

call plug#end()


""" プラグインとの併用系

" rhysd/accelerated-jkというプラグインの追加設定
" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" Shougo/neocomplete.vimというプラグインの追加設定
" 自動補完機能を有効にする
let g:neocomplete#enable_at_startup = 1

" vim-monsterというプラグインの追加設定
" neocomplete.vimとあわせて導入
let g:neocomplete#sources#omni#input_patterns = {
\  'ruby': '[^. *¥t]\.\w*\|\h\w*::'
\}

" ctrlpvim/ctrlp.vimというプラグインの追加設定
" 検索モードを開く
nmap <Leader>f :CtrlP<CR>

" vim-indent-guidesというプラグインの追加設定
let g:indent_guides_enable_on_vim_startup = 1

""" NERDTree設定
" MacだとNERDTeeでまるごとエラー吐いちゃう
" Ctrl+nでNERDTreeを表示
" map <C-n> :NERDTreeToggle<CR>
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

" 行番号を表示する
" set number

" 行番号の色
highlight LineNr ctermfg=darkyellow

" カーソルが何行目の何列目に置かれているかを表示
set ruler

" 構文ごとに文字色を変化
syntax enable

" 入力中のコマンドを表示する
set showcmd

" 編集中ファイル名の表示
set title

" タブ、空白、改行を可視化
set list

" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<

" 括弧入力時の対応する括弧を表示
set showmatch

" コマンドラインに使われる画面上の行数
set cmdheight=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" Windowの縦幅を指定
set lines=35

" Windowの横幅を指定
set columns=90

" 全角スペースの表示
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

" 挿入モード時、ステータスラインの色を変更
" MacではStatusLineがE492となる…
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
" if has('syntax')
  " augroup InsertHook
    " autocmd!
    " autocmd InsertEnter * call s:StatusLine('Enter')
    " autocmd InsertLeave * call s:StatusLine('Leave')
  " augroup END
" endif
"
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
  " if a:mode == 'Enter'
    " silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    " silent exec g:hi_insert
  " else
    " highlight clear StatusLine
    " silent exec s:slhlcmd
  " endif
" endfunction

" function! s:GetHighlight(hi)
  " redir => hl
  " exec 'highlight '.a:hi
  " redir END
  " let hl = substitute(hl, '[¥r¥n]', '', 'g')
  " let hl = substitute(hl, 'xxx', '', '')
  " return hl
" endfunction


""" カラースキーム系

" set background=dark

"" molokai関連
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" colorscheme badwolf

" let g:badwolf_darkgutter = 1

" colorscheme desert

"" solarized関連
colorscheme solarized
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast='low'
" let g:solarized_visibility='normal'


""" 入力系

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" インサートモードから抜けるときにpasteモードをやめる
autocmd InsertLeave * set nopaste

" タブ文字の表示幅
set tabstop=4

" 指定した数のスペースを1回で削除できるようにする
set softtabstop=4

" Tab文字の代わりに半角スペースに
set expandtab

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" オートインデント時にインデントする幅
set shiftwidth=4

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent


""" 補完系

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 括弧の自動補完
" call lexima#add_rule({'char': '「', 'input_after': '」', 'at': '¥%#$'})

" { + Enter を押せば
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" 自動的に閉じ括弧を入力する(あまり賢くないらしい)
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

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

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ↓はE109やE15というエラーの原因だったので使わない
" /{pattern}の入力中は「/」をタイプすると自動で「¥/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「¥?」が、
" 入力されるようになる
" cnoremap <expr> / getcmdtype() == '/' ? '¥/' : '/'
" cnoremap <expr> ? getcmdtype() == '?' ? '¥?' : '?'

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz


""" キーマッピング

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

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %

" 折り返し時に表示行単位での移動
nnoremap <silent> j gj
nnoremap <silent> k gk

" インサートモード時にカーソル左の1文字削除(ノーマルモードでの?)
inoremap <c-b> <BS>

" インサートモード時にカーソル位置の1文字削除(ノーマルモードでのx)
inoremap <c-d> <delete>

" インサートモード時の移動
" <c-h>はbackspaceキーと連動しているので、
" インサートモードでのbackspaceを用いた前の1文字削除が出来なくなることに注意
" 2個上のキーマッピングで左1文字を消すキーを設定
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" インサートモード時の移動
" Shift + Enterで下に、Shift + Ctrl + Enterで上に空行を挿入
" https://qiita.com/itmammoth/items/312246b4b7688875d023
" ただし、↓だけではうごかない可能性大なので↑のurlを参考に
" imap <S-CR> <End><CR>
" imap <C-S-CR> <Up><End><CR>
" nnoremap <S-CR> mzo<ESC>`z
" nnoremap <C-S-CR> mzO<ESC>`z

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" ビジュアルモード中の"*yをzの一押しに
vnoremap z "*y


""" スクリプト起動ショートカット

" F6でPythonを実行
" function内にちゃんとpython3と書かないとpython2gajikkousaretesimau
command! Python call s:Python()
nmap <F6> :Python<CR>

function! s:Python()
        :w
	        :!python3 %
		endfunction

" C
command! Gcc call s:Gcc()
nmap <F7> :Gcc<CR><CR><CR>

function! s:Gcc()
	:w
		:!gcc % -o %.out
		:!./%.out
    :!rm -f ./%.out
		endfunction

" C++
command! CPlus call s:CPlus()
nmap <F8> :CPlus<CR><CR><CR>
function! s:CPlus()
	:w
		:!g++ % -o %.exe
		:!./%.exe
    :!rm -f ./%.exe
		endfunction

" 他のvim内でのPython実行方法
" autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
" imap <F5> <Esc>:w<CR>:!clear;python %<CR>



""" 新しく追加したい

" vimshell設定
" ,sh: シェルを起動
" nnoremap <silent> ,sh :VimShell<CR>
" ,spy: pythonを非同期で起動
" nnoremap <silent> ,spy :VimShellInteractive python<CR>
" ,irb: irbを非同期で起動
" nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
" vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
" nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
" grep検索の実行後にQuickFix Listを表示する
" autocmd QuickFixCmdPost *grep* cwindow
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
" cmap w!! w !sudo tee > /dev/null %
" カーソル下の単語を * で検索
" vnoremap <silent> * "vy/¥V<C-r>=substitute(escape(@v, '¥/'), "¥n", '¥¥n', 'g')<CR><CR>
" Ctrl + hjkl でウィンドウ間を移動
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" T + ? で各種設定をトグル
" nnoremap [toggle] <Nop>
" nmap T [toggle]
" nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
" nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
" nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
" nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
" colorscheme solarized
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
" function! s:mkdir(dir, force)
"   if !isdirectory(a:dir) && (a:force ||
"         ¥ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y¥%[es]$')
"     call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"   endif
" endfunction
" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
" function! s:ChangeCurrentDir(directory, bang)
"     if a:directory == ''
"         lcd %:p:h
"     else
"         execute 'lcd' . a:directory
"     endif
"     if a:bang == ''
"         pwd
"     endif
" endfunction
" ~/.vimrc.localが存在する場合のみ設定を読み込む
" let s:local_vimrc = expand('~/.vimrc.local')
" if filereadable(s:local_vimrc)
"     execute 'source ' . s:local_vimrc
" endif
"画面切り替え
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-l> <c-w>l
" nnoremap <c-h> <c-w>h
"<space>j, <space>kで画面送り
" noremap [Prefix]j <c-f><cr><cr>
" noremap [Prefix]k <c-b><cr><cr>
" 文字がない場所にもカーソルを移動できるようにする"
" set virtualedit=all