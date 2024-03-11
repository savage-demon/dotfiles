# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# update automatically without asking
zstyle ':omz:update' mode auto
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always --icons $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf-tab)


# User configuration

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_ed25519_toolkit_gitlab &>/dev/null

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export PIPENV_VENV_IN_PROJECT=1

export PATH="/home/deman/projects/vlang/v:$PATH"
export PATH="/home/deman/go/bin:$PATH"
export PATH="/home/deman/.local/bin:$PATH"
export PATH="$PATH:/home/deman/programs/bin"
export PATH="$PATH:/home/deman/projects/go/png-invert"
export PATH="/home/deman/.config/composer/vendor/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
fpath=(~/.zsh.d/ $fpath)

PATH="/home:$PATH"

PATH="/home/deman/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/deman/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/deman/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/deman/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/deman/perl5"; export PERL_MM_OPT;

fpath=(/home/linuxbrew/.linuxbrew/share/zsh/site-functions/ $fpath)

source ~/powerlevel10k/powerlevel10k.zsh-theme


autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%%"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

export VISUAL="nvim"
export EDITOR="$VISUAL"

# exa
alias ls="exa --icons"
alias ll="exa -lh --icons"
alias la="exa -lah --icons"
alias tree="exa --tree --icons -L 2"

# cd zoxide
alias cd="z"
alias j="z"

# docker 
alias dc="docker compose"

#tldr
alias tldrf='tldr --list | fzf --preview "tldr {1}" --preview-window=right,70% | xargs tldr'

alias colorgrid='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'


#cat bat
alias cat="bat"

#zellij
alias zj="zellij"

#helix
alias hx="helix"

# curl cheat
ch(){
  cht "$@" | bat
}

# pacman -S
alias pac="sudo pacman -S"

chshell(){
  cht --shell "$@"
}

iown(){
  sudo chown -R deman:deman "$@"
}

iownall(){
  sudo chown -R deman:deman *
}

alias t='task'
