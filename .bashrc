# ==============================================================================
# シェル全般
# ==============================================================================

# 対話シェル以外では .bashrc の以降の行は実行しない
case $- in
  *i*) ;;
  *) return ;;
esac

# C-d による EOF でシェルが終了するのを無効
# .inputrc で、insert mode 時には C-d でカーソル上の文字削除というキーバインドにしている
set -o ignoreeof

# ==============================================================================
# 補完
# ==============================================================================

# bash-completion
if [ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]; then
  . "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

# git-completion
if [ -r "$HOME/.git-completion.bash" ]; then
  . "$HOME/.git-completion.bash"

  # g という git コマンドを表すエイリアスの時でも Git 補完が効くようにする
  __git_complete g __git_main
fi

# ==============================================================================
# プロンプト 1/2
# ==============================================================================

# プロンプトに Git に関する情報を表示するための読み込み
if [ -r "$HOME/.git-prompt.sh" ]; then
  . "$HOME/.git-prompt.sh"
fi

# Git 管理中のファイルに変更がある場合、それを * や + などの記号で表示
GIT_PS1_SHOWDIRTYSTATE=true

# Git でまだ追跡されていないファイルがある場合に % を表示
GIT_PS1_SHOWUNTRACKEDFILES=true

# stash が存在する場合、その状態を $ で表示
GIT_PS1_SHOWSTASHSTATE=true

# ローカルブランチと追跡先のリモートブランチとの進み具合を < > <> = などの記号で表示
GIT_PS1_SHOWUPSTREAM=auto

PS1='\[\e[1;31m\][\u@\h:\W$(__git_ps1 " (%s)")]\[\e[0m\]\n\$ '

# 各プロンプトの前に空行を1行入れるための関数
add_line() {
  if [[ -z "$PS1_NEWLINE_LOGIN" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

# ==============================================================================
# 履歴
# ==============================================================================

# 現在のBashセッションがメモリ上に保持する履歴件数
HISTSIZE=50000

# 履歴用のファイルに保存する履歴ファイルの最大件数
HISTFILESIZE=50000

# 指定したパターンに一致するコマンドを履歴へ保存しない
HISTIGNORE='ls:history*:pwd:clear'

# history コマンドの各履歴へ日時を表示する書式設定
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# 直前と同じコマンドを連続して履歴へ保存しない
HISTCONTROL=ignoredups

# シェルの終了時に履歴ファイルを上書きせず追記する
shopt -s histappend

# 各端末でのコマンド履歴を同期するための関数の自作
share_history() {
  # 現在セッションの新しい履歴を書きファイルルに追記
  history -a

  # 他シェルが追加した未読履歴だけ読み込み
  history -n
}

# peco による対話的検索の関数
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi
    else
        history -d $((HISTCMD-1))
    fi
}

# Ctrl r を押すと peco-history 関数が実行
bind -x '"\C-r":peco-history'

# ==============================================================================
# プロンプト 2/2
# ==============================================================================

# Bash がプロンプトを表示する直前に、毎回実行する処理 を指定
PROMPT_COMMAND='share_history; add_line'

# ==============================================================================
# 外部ツール
# ==============================================================================

# fzf(対話的な絞り込み検索ツール)
[ -r "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# GHCup
[ -r "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# ==============================================================================
# エイリアス
# ==============================================================================

# 全般
alias cl='clear'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias mv='mv -i'
alias cp='cp -i'

alias rm='rmtrash'

# http://mironal-memo.blogspot.com/2012/09/macosx-ls.html
case "${OSTYPE}" in
darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls='ls --color=auto -F'
  ;;
esac
alias ll='ls -Alh'

# Git
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
# Git のエイリアス確認
alias galias='git config --global --list | grep ^alias\.'

# HomeBrew 一括アップデート
alias brewupdate='brew update && brew upgrade && brew cleanup'

# Chrome をコマンドラインから開くエイリアス、引数として HTML を指定する｡
alias chromeopen='open -a "Google Chrome"'

# irb の出力を整形
alias irbclean_commentout='awk '\''{sub(/^irb\([^)]*\):[0-9]+[>*] ?/,""); if(/^=> /){$0="# "$0; buf=buf $0 ORS ORS} else {buf=buf $0 ORS}} END{print ""; printf "%s", buf}'\'''
alias irbclean_ignore_return_value='awk '\''{sub(/^irb\([^)]*\):[0-9]+[>*] ?/,""); if(!/^=> /) buf = buf $0 ORS} END{print ""; printf "%s", buf}'\'''

# atcoder-cli
alias accspy='acc s --skip-filename -- --guess-python-interpreter pypy'
alias accsrb='acc s --skip-filename'

# online-judge-tools
alias ojtpy='oj t -c "python3 ./main.py" -d ./tests'
alias ojtrb='oj t -c "ruby ./main.rb" -d ./tests'
alias ojtrbN='oj t -c "ruby ./main.rb" -d ./tests -N'

# Mac にある既存のではなく HomeBrew でダウンロードした ctags を利用
alias ctags="`brew --prefix`/bin/ctags"

# ↓ 未分類
