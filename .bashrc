# ↓ 注意書き

# 1. `source ~/.bash_profile` で反映

# 2. .bash_profile と .bashrc の使い分けについて
# .bash_profile は基本的に環境変数について書く
# それ以外の
# 環境変数でない変数を設定する (export しない変数)
# エイリアスを定義する
# シェル関数を定義する
# といった設定は .bashrc へ

# 3. vim ライクな挙動にする設定は .inputrc に書いてる

# 4. bash の補完について
# bash の補完に関しては以下のサイトを参照
# https://qiita.com/notakaos/items/d44a4c2b72625746de25
# https://rcmdnk.com/blog/2015/05/14/computer-linux-mac-bash/
# いや､やっぱり下記を参照するようにした
# https://qiita.com/Canon11/items/e9efae4966f0d71217f8

# 5. git-prompt.sh が無いとエラーを吐くのでその対処
# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
# `wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh``
# `chmod a+x ~/.git-prompt.sh``

# 本編

# 1. bash での補完
# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# 2. git-completion による補完
# 下記を参考に設定
# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
# まずは下記の2つのコマンドを実行
# `wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash`
# `chmod a+x ~/.git-completion.bash`
# 後は下記を読み込むように `source .bashrc`
source ~/.git-completion.bash

# 3. g という bash のエイリアスから git の補完を動かせるように
# https://r17n.page/2019/09/24/git-completion-with-bash-alias/
if [ -f ~/.git-completion.bash ]; then source ~/.git-completion.bash; __git_complete g __git_main; fi

# 4. bash の見た目改造
# git のブランチ名をターミナルに表示
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
# git のブランチ名を表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
# git ブランチの状況を *, +, % などで表示
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# プロンプト設定
# a. デフォルト
# "\h:\W \u\$"
# b. git ブランチ名なし情報多めかつ $ の行は改行パターン
# `export PS1='\[\e[1;31m\][\h@\u:\W]\n\$ \[\e[1;30m\]'`
# c. git のブランチ名表示パターン
export PS1='\[\e[1;31m\][\h@\u:\W$(__git_ps1 "(%s)")]\n\$ \[\e[1;30m\]'

# 5. 出力の後に改行を入れる
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# 6. tmux 限定ではないけど、C-d でログアウトするのを防ぐやつ
# https://superuser.com/questions/479600/how-can-i-prevent-tmux-exiting-with-ctrl-d
set -o ignoreeof

# ↓ エイリアス

# 基本コマンドのエイリアス
alias cl='clear'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rmtrash'
# http://mironal-memo.blogspot.com/2012/09/macosx-ls.html より、Mac と Linux 対応
case "${OSTYPE}" in
darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls='ls --color=auto -F'
  ;;
esac
alias ll='ls -A'

## git コマンドのエイリアス
alias g='git'
alias st='git status -bs'
# -av オプションを付与したことで `git branch feature`` のような操作が出来ないので､
# .gitconfig に設定した `g br` でブランチ作成や消去を代用しましょう
alias br='git branch -av'
alias co='git checkout'
alias ad='git add'
alias cm='git commit'
alias gdw='git diff'
alias gds='git diff --cached'
alias ginit='git commit --allow-empty'
alias pushf='git push --force-with-lease'
# 空コミットの ci スキップ ver
# https://yulii.github.io/git-wip-alias-20160206.html
# alias ginit='git commit --allow-empty "[ci skip] wip commit"'
alias glogr='git log --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'

# その他のエイリアス
# git のエイリアス確認
alias galias='git config --global --list | grep ^alias\.'

# homebrew 一括アップデート
alias brewupdate='brew update && brew upgrade && brew cleanup'

# chrome をコマンドラインから開くエイリアス、引数として html を指定する｡
alias chromeopen='open -a "Google Chrome"'

# bpython を少しでも短く
alias bp='bpython'

# Mac にある既存のではなく brew でダウンロードした ctags を利用
alias ctags="`brew --prefix`/bin/ctags"

# ↓ 未分類

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/tyobi0913/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
