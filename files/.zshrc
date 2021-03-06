# General config
export EDITOR=vim
export LC_ALL=en_US.UTF-8

# ZSH config
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(
    git
)
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# GPG config
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# Aliases
alias ll='exa -la --group-directories-first --all'
alias awsv='AWS_SESSION_TOKEN_TTL=1h aws-vault exec --duration=30m'
alias upgrade='brew update && brew bundle --global && brew bundle cleanup --force --global && upgrade_oh_my_zsh'

# HACK: Assume AWS organization access role given an account ID.
aws-org-login() {
    sed -i.bak -E "s/^(role_arn[ ]*= arn:aws:iam::)[0-9]{12}(:role\/OrganizationAccountAccessRole)/\1$1\2/g" ~/.aws/config && aws-vault login org-access-role
}
