### 導入

# source ~/.bash_profileで反映

# .bash_profileは基本的に環境変数について書く
# それ以外の
# 1.環境変数でない変数を設定する (export しない変数)
# 2.エイリアスを定義する
# 3.シェル関数を定義する
# といった設定は.bashrcへ



### 本編

##
# Your previous /Users/tyobi0913/.bash_profile file was backed up as /Users/tyobi0913/.bash_profile.macports-saved_2018-11-25_at_10:59:31
##

# .bashrc を読み込む処理
# https://qiita.com/magicant/items/d3bb7ea1192e63fba850
test -r ~/.bashrc && . ~/.bashrc

# bash_completionという補完のための設定､参照サイトは↓
# bashの補完に関しては以下のサイトを参照
# https://qiita.com/notakaos/items/d44a4c2b72625746de25
# https://rcmdnk.com/blog/2015/05/14/computer-linux-mac-bash/
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion



### 環境変数

# MacPorts Installer addition on 2018-11-25_at_10:59:31: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# utf-8
export LANG=ja_JP.UTF-8

# historyコマンド設定色々
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE=ls:history*:pwd:clear
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# gitのdiffなどでの文字化け防止
export GIT_PAGER="LESSCHARSET=utf-8 less"

# nodeのやつ?
export PATH=$HOME/.nodebrew/current/bin:$PATH

# なんかのバス
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# なんかのパス
export PATH=$PATH:/usr/local/bin

# 未分類
