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

## pyenv
# pyenvさんに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
export PYENV_ROOT=/usr/local/var/pyenv
#
# pyenvさんに自動補完機能を提供してもらう
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

## pipenvの.venvをプロジェクトディレクトリに作成
export PIPENV_VENV_IN_PROJECT=true


## PATH
# なんか知らないうちに設定されてたPATH
# MacPorts Installer addition on 2018-11-25_at_10:59:31: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# nodeのやつ?
export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenvのパス
export PATH="$PYENV_ROOT/shims:$PATH"

# 数ヶ月ぶりにMacのアップデートをしてvimのdeopleteにエラーが出た際､
# それを直すために使ったもの
# ※pythonのバージョンが3.8から変化したら､また対処しないとかもか…
# ※というか､pyenvのせいでvimがpynvimをインストールしたディレクトリを
# 探せなくなったせいかなって今思えてきた…
# pythonとpython3､pipとpip3の挙動や組み合わせが違うとかもそのせいだし…
# https://github.com/roxma/vim-hug-neovim-rpc/issues/47
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# なんかのパス
export PATH=$PATH:/usr/local/bin

# 環境変数PATHの重複をなくす
# https://qastack.jp/unix/40749/remove-duplicate-path-entries-with-awk-command
export PATH=`printf %s "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

# rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# node
eval "$(anyenv init -)"

### 未分類
