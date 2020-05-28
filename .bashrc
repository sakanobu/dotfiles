### 導入

## source ~/.bashrcで反映

## .bash_profileは基本的に環境変数について書く
# それ以外の
# 1.環境変数でない変数を設定する (export しない変数)
# 2.エイリアスを定義する
# 3.シェル関数を定義する
# といった設定は.bashrcへ
# ※ただ､このファイルにあるbashのGit云々にexport含まれていて…うーん

## bashの補完に関しては以下のサイトを参照
# https://qiita.com/notakaos/items/d44a4c2b72625746de25
# https://rcmdnk.com/blog/2015/05/14/computer-linux-mac-bash/
#
#いや､やっぱり↓を参照するようにした
# https://qiita.com/Canon11/items/e9efae4966f0d71217f8

## git-prompt.shが無いとエラーを吐くので以下をやる
# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
# chmod a+x ~/.git-prompt.sh



### 本編

## ターミナルでの入力をviライクに
set -o vi
#
# ターミナルに入った直後ではインサートモードから始まる
# もしいま現在がインサートなのかノーマルなのかを表示するには↓を参照
# https://www.trhrkmk.com/posts/setting-vi-mode-in-bash-comfortable/
#
# 注意なのは
# 1.インサートモード時には1つ上の履歴をみる<Ctrl+p>が使えないからノーマルモードへ
# 2._やg_の挙動がおかしい…ほかの便利キーバインドになってるっぽい
#
# viライクターミナルでもjjでノーマルモードへ､キーマッピング
bind '"jj": vi-movement-mode'

## bashでの補完
# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
#
# git-completion
source ~/.git-completion.bash
# gというbashのエイリアスからgitの補完を動かせるように
# https://r17n.page/2019/09/24/git-completion-with-bash-alias/
if [ -f ~/.git-completion.bash ]; then source ~/.git-completion.bash; __git_complete g __git_main; fi

## bashの見た目改造
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
#
# プロンプト設定
# デフォルトは"\h:\W \u\$"
# export PS1="\[\e[1;31m\][\h@\u:\W]\$ \[\e[1;30m\]"
# gitのブランチ名表示パターン
export PS1='\[\e[1;31m\][\h@\u:\W$(__git_ps1 "(%s)")]\$ \[\e[1;30m\]'

## 出力の後に改行を入れる
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

## tmux限定ではないけど､C-dでログアウトするのを防ぐやつ
# https://superuser.com/questions/479600/how-can-i-prevent-tmux-exiting-with-ctrl-d
set -o ignoreeof



### エイリアス

## 全般
# gitのエイリアス確認
alias galias='git config --global --list | grep ^alias\.'

# homebrew一括アップデート
alias brewupdate='brew update && brew upgrade && brew cleanup'

# chromeをコマンドラインから開くエイリアス､引数としてhtmlを指定する｡
alias chromeopen='open -a "Google Chrome"'

# bpythonを少しでも短く
alias bp='bpython'

# Macにある既存のではなくbrewでダウンロードしたctagsを利用
alias ctags="`brew --prefix`/bin/ctags"

## git
alias g='git'
alias st='git status -bs'
alias ad='git add'
alias co='git commit'
alias gdw='git diff'
alias gds='git diff --cached'
alias ginit='git commit --allow-empty'
alias pushf='git push --force-with-lease'
# 空コミットのciスキップver
# https://yulii.github.io/git-wip-alias-20160206.html
# alias ginit='git commit --allow-empty "[ci skip] wip commit"'
alias glogr='git log --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'




### 未分類
