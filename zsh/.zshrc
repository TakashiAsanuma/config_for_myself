#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# zsh-autosuggestions
plugins=(
    zsh-autosuggestions
)

# Ctrl-PとCtrl-Nで前方一致検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# 全履歴を一覧表示する
function history-all { history -E 1 }

# historyの共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# nvimへのalias
which nvim > /dev/null && alias vim='nvim'

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh
[[ /Users/asanumatakashi/.asdf/shims/kubectl ]] && source <(kubectl completion zsh)
fpath=(${ASDF_DIR}/completions $fpath)
autoload -U compinit
compinit

#source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#  PS1='$(kube_ps1)'$PS1

# MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/asanumatakashi/.rd/bin:$PATH"
# MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

