### 導入

## source ~/.bash_profileで反映

## .bash_profileは基本的に環境変数について書く
# それ以外の
# 1.環境変数でない変数を設定する (export しない変数)
# 2.エイリアスを定義する
# 3.シェル関数を定義する
# といった設定は.bashrcへ



### 本編

##
# Your previous /Users/tyobi0913/.bash_profile file was backed up as /Users/tyobi0913/.bash_profile.macports-saved_2018-11-25_at_10:59:31
##

## .bashrc を読み込む処理
# https://qiita.com/magicant/items/d3bb7ea1192e63fba850
test -r ~/.bashrc && . ~/.bashrc



### 環境変数

## utf-8
export LANG=ja_JP.UTF-8

## historyコマンド設定色々
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE=ls:history*:pwd:clear
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

## gitのdiffなどでの文字化け防止
export GIT_PAGER="LESSCHARSET=utf-8 less"

## pipenvの.venvをプロジェクトディレクトリに作成
export PIPENV_VENV_IN_PROJECT=true


## PATH
# なんか知らないうちに設定されてたPATH
# MacPorts Installer addition on 2018-11-25_at_10:59:31: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# nodeのやつ?
export PATH=$HOME/.nodebrew/current/bin:$PATH

# なんかのパス
export PATH=$PATH:/usr/local/bin

# 環境変数PATHの重複をなくす
# https://qastack.jp/unix/40749/remove-duplicate-path-entries-with-awk-command
export PATH=`printf %s "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

# node
eval "$(anyenv init -)"

### 未分類
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
