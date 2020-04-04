# dotfiles



## .vimrc

### 注意
- .vim/after/ftpluginの中にある拡張子毎の設定にもキーマッピングあるよ

### キーマッピング
- 自作マッピング
  - ノーマルモード
    - :qは \<Space>q
    - .vimrcの再読み込みは \<Space>:s
    - :setは \<Space>sny
    - :set nonumberは \<Space>snn
    - ハイライト解除は \<Esc>\<Esc>
    - コメントアウトは \<Space>c
    - 1行下に空行は \<Space>o
    - 1行上に空行は \<Space>\<S-o>
    - 行固定して見た目位置変更はHigh,Middle,Lowの順で zh,zm,zl
    - 対応ペアにジャンプは tab
    - 行の最初の文字へ移動は \<Space>a
    - 行末へ移動は \<Space>e
    - 多めのカーソル移動は \<Space> → h,j,k,l
    - vimのウィンドウ操作プリフィックスは \<Space>w
    - vimのウィンドウの水平分割は \<Space>-
    - vimのウィンドウの垂直分割は \<Space>|
    - vim-quickrunの実行は \<Space>r
  - インサートモード
    - ノーマルモードのショトカは jj
    - カーソル左の1文字削除は \<C-b>
    - カーソル位置の1文字削除は \<C-d>
    - カーソル移動は Ctrl + h,j,k,l
  - ヴィジュアルモード
    - カーソルから行末まで選択は v (つまり行頭でvvすると一行全部選択)
    - ブラウザで即ペーストできるようにレジスタ\*レジスタ登録は z
- プラグインのマッピング
  - bronson/vim-trailing-whitespace
    - 自動削除は :FixWhitespace
  - mattn/emmet-vim
    - \<C-y> → ,
  - tpope/vim-surround
    - あああ
  - tomtom/tcomment_vim
    - gcc
  - vim-syntastic/syntastic
    - 現在使われているチェッカーを確認は :syntasticInfo
    - :SynstaicChec
    - :Errors
  - nvie/vim-flake8
    - デフォルトでは F7
  - ctrlpvim/ctrlp.vim
    - ファイルの捜索の実行は \<C-p>

### 忘れやすいプラグイン
- 後ほど追加



## .bashrc

### 注意

### エイリアス
- general
  - alias galias='git config --global --list | grep ^alias\.'
  - alias brewupdate='brew update && brew upgrade && brew cleanup'
  - alias chromeopen='open -a "Google Chrome"'
- git
  - alias g='git'
  - alias st='git status -bs'
  - alias ad='git add'
  - alias co='git commit'
  - alias ginit='git commit --allow-empty'
  - alias glogr='git log --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'



## .tmux.conf

### 注意
- prefixキーは \<C-s>

### キーマッピング
- tmux内で.tmux_conf変更した際の即リロードは prefix + r
- ペインの縦分割は prefix + |
- ペインの横分割は prefix + -
- ペインの移動は prefix + vimのカーソル移動のキーマッピング
- ペインのリサイズは prefix + vimのカーソル移動のキーマッピングを大文字
- コピーモード(ちょこっとvim風に)
  - コピーモードの開始は prefix → [ → v
  - コピーモードでのヤンクは prefix → [ → y



## .gitconfig

### 注意
- .bashrcにもstのエイリアスあって重複…

### エイリアス
- st = status
- co = commit



## その他

### python
- bpython
  - dotfiles/bpython/configにコピーしてるのでそれ参照
