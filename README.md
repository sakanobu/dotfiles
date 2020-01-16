# dotfiles



## .vimrc

### 注意

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
    - 多めのカーソル移動は \<Space> → h,j,k,l
    - 対応ペアにジャンプは tab
    - vimのウィンドウ操作プリフィックスは \<Space>w
    - vimのウィンドウの水平分割は \<Space>-
    - vimのウィンドウの垂直分割は \<Space>\ (\\なのは|のShift押さない版だから)
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

### 忘れやすいプラグイン



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



## .bashrc

### 注意

### エイリアス
- git
  - alias st='git status'
