# ↓ 注意書き

# 1. `source ~/.bash_profile` で反映

# 2. .bash_profile と .bashrc の使い分けについて
# .bash_profile は基本的に環境変数について書く
# それ以外の
# 環境変数でない変数を設定する (export しない変数)
# エイリアスを定義する
# シェル関数を定義する
# といった設定は .bashrc へ

# 2022.09.19時点での PATH
# /Users/tyobi0913/.nvm/versions/node/v16.17.0/bin:/Users/tyobi0913/.rbenv/shims:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Apple/usr/bin:/usr/local/opt/fzf/bin:/Users/tyobi0913/.rbenv/bin:/usr/local/Cellar/go/1.16.3/libexec:/Users/tyobi0913/go/bin:/Users/tyobi0913/.poetry/bin

# ↓ 起動時の処理

# Your previous /Users/tyobi0913/.bash_profile file was backed up as /Users/tyobi0913/.bash_profile.macports-saved_2018-11-25_at_10:59:31

# .bashrc を読み込む処理
# https://qiita.com/magicant/items/d3bb7ea1192e63fba850
test -r ~/.bashrc && . ~/.bashrc

# ↓ 環境変数

# utf-8
export LANG=ja_JP.UTF-8

# history コマンド設定色々
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTIGNORE=ls:history*:pwd:clear
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# git の diff などでの文字化け防止
export GIT_PAGER="LESSCHARSET=utf-8 less"

# pipenv の .venv をプロジェクトディレクトリに作成
export PIPENV_VENV_IN_PROJECT=true

# PostgreSQL の環境変数
# https://qiita.com/yorokobi_kannsya/items/f77d074e382a88dae971
export PGDATA=/usr/local/var/postgres

# なんか知らないうちに設定されてた PATH
# MacPorts Installer addition on 2018-11-25_at_10:59:31: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# なんかのパス
export PATH=$PATH:/usr/local/bin

# OpenSSH が上記の古いものを参照してしまうので Homebrew 系の PATH をちょっと下に移動している
# Homebrew の M1 Mac 対応のための PATH
export PATH="/opt/homebrew/bin:$PATH"

# Homebrew の doctor で sbin が PATH に見つからなかったと言われた対策
export PATH="/opt/homebrew/sbin:$PATH"

# Node
# nvm の設定(M1 Mac)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# nvm の設定(旧Mac)
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# $PATH よりも前に書かないと、/usr/local/bin/node を先に探し出してしまうので、順番に注意
# export PATH=$HOME/.nodebrew/current/bin:$PATH
# 以下は anyenv の設定なのでコメントアウト(これを)
# eval "$(anyenv init -)"
# npm や yarn でインストールしたパッケージを npm run など無しで実行
export PATH=$PATH:./node_modules/.bin

# Ruby
# export PATH="$PATH:$HOME/.rbenv/bin"
# eval "$(rbenv init -)"
# export LDFLAGS="-L/usr/local/opt/libffi/lib"
# export CPPFLAGS="-I/usr/local/opt/libffi/include"
# export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
# 2023.03.19 の M1 Mac用
eval "$(rbenv init - bash)"
# 2023.03.19 rails new で失敗後、libpq を入れて
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Go の Homebrew 経由でのインストール時の PATH の設定
export PATH=$PATH:/usr/local/Cellar/go/1.16.3/libexec
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# .Net5 の PATH
export PATH=$PATH:/usr/local/share/dotnet

# poetry の PATH
export PATH=$PATH:$HOME/.local/bin

# Docker の PATH
export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin/

# 環境変数 PATH の重複をなくす
# https://qastack.jp/unix/40749/remove-duplicate-path-entries-with-awk-command
export PATH=`printf %s "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

# ↓ 未分類
