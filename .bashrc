# 2019_09_02_.bashrcの設定

### 導入

# git-prompt.shが無いとエラーを吐くので以下をやる
# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
# chmod a+x ~/.git-prompt.sh

# source ~/.bashrcで反映

# bashの補完に関しては以下のサイトを参照
# https://qiita.com/notakaos/items/d44a4c2b72625746de25
# https://rcmdnk.com/blog/2015/05/14/computer-linux-mac-bash/

### 注意

# .bash_profileは基本的に環境変数について書く
# それ以外の
# 1.環境変数でない変数を設定する (export しない変数)
# 2.エイリアスを定義する
# 3.シェル関数を定義する
# といった設定は.bashrcへ

# ターミナルのウィンドウサイズについては
# Macだとターミナル→環境設定→プロファイル→ウィンドウサイズ→ウィンドウサイズ
# で列:90､行:35にする｡

# ubuntuに元からある.bashrcはコメントアウトしちゃって､
# 共有フォルダから持ってきた.bashrcをcat xx >> 〇〇みたいに追記しちゃう


### 本編

# utf-8
export LANG=ja_JP.UTF-8

# gitのブランチ名をターミナルに表示
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
# Gitブランチ名を表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
# Gitブランチの状況を*+%で表示
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプト設定
# デフォルトは"\h:\W \u\$"
# export PS1="\[\e[1;31m\][\h@\u:\W]\$ \[\e[1;30m\]"
# gitのブランチ名表示パターン
export PS1='\[\e[1;31m\][\h@\u:\W$(__git_ps1 "(%s)")]\$ \[\e[1;30m\]'

# 出力の後に改行を入れる
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# ターミナルでの入力をviライクのキーバインドに&jjでノーマルモードへ
# ターミナルに入った直後ではインサートモードから始まる
# もしいま現在がインサートなのかノーマルなのかを表示するには↓を参照
# https://www.trhrkmk.com/posts/setting-vi-mode-in-bash-comfortable/
# 注意なのは
# 1.インサートモード時には1つ上の履歴をみる<Ctrl+p>が使えないからノーマルモードへ
# 2._やg_の挙動がおかしい…ほかの便利キーバインドになってるっぽい
set -o vi
bind '"jj": vi-movement-mode'
