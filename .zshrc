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
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/tmp}/ssh-agent.socket"
if [ ! -S "$SSH_AUTH_SOCK" ]; then
    ssh-agent -a "$SSH_AUTH_SOCK" > /dev/null
fi

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

# попробуем кикстарт
# export NVIM_APPNAME=kickstart

alias vim="nvim"

# neovim vanilla
alias vnvim="NVIM_APPNAME=vim nvim"

# neovim astronvim
alias astronvim="NVIM_APPNAME=astronvim nvim"

# neovim nvchad
alias nvchad="NVIM_APPNAME=nvchad nvim"

# neovim lazyvim
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

# neovim kickstart nvim
alias ksnvim="NVIM_APPNAME=kickstart nvim"

# exa
alias ls="exa --icons"
alias ll="exa -lah --icons"
alias la="exa -a --icons"
alias tree="exa --tree --icons -L 2"

# cd zoxide
alias cd="z"
alias j="z"

# docker 
alias dc="docker compose"

#tldr
alias tldrf='tldr --list | fzf --preview "tldr {1}" --preview-window=right,70% | xargs tldr'

alias colorgrid='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'


#zellij
alias zj="zellij"

#helix
alias hx="helix"

alias kub="k9s -c dp"

alias yayi='yay -S --noconfirm --needed --sudoloop'

alias wco='wl-copy'
alias wpa='wl-paste'

alias zconf='nvim ~/.zshrc && source ~/.zshrc'

alias lg='lazygit'

# Универсальный и безопасный алиас для вставки из буфера
alias -g V='"$(wl-paste | sed "s/[[:space:]]*$//")"'

alias get_idf='. $HOME/.espressif/esp-idf/export.sh'

cb() {
  if [ -f "$1" ]; then
    # Если передан существующий файл
    local file_path=$(realpath "$1")
    echo -n "copy\nfile://$file_path" | wl-copy -t x-special/gnome-copied-files
    echo "Файл $1 скопирован в буфер"
  else
    # Если это текст или вывод через пайп
    if [ -t 0 ]; then
      # Если аргумент передан текстом: cb "привет"
      echo -n "$@" | wl-copy
      echo "Текст скопирован"
    else
      # Если данные пришли через пайп: ls | cb
      wl-copy
      echo "Вывод команды скопирован"
    fi
  fi
}



# curl cheat
ch(){
  cht "$@" | bat
}

# поиск пакетов в yay
yays() {
  yay -Sl | awk '{print $2 ($4=="" ? "" : " [УСТАНОВЛЕНО]")}' | \
  fzf --multi \
      --preview 'yay -Si {1}' \
      --header "Vim: Ctrl-J/K — список, Ctrl-H/L — прокрутка. Выбор: TAB, Установка: ENTER." \
      --header-first \
      --bind 'ctrl-j:down,ctrl-k:up,ctrl-h:preview-half-page-up,ctrl-l:preview-half-page-down' | \
  awk '{print $1}' | xargs -ro yay -S
}

# pacman -S
alias pac="sudo pacman -S"

alias bpaste="xclip -o -sel clip"

chshell(){
  cht --shell "$@"
}

iown(){
  sudo chown -R deman:deman "$@"
}

iownall(){
  sudo chown -R deman:deman *
}

mkd(){
  mkdir -p "$@" && cd "$_"
}

alias t='task'
if [ -f "/home/deman/.config/fabric/fabric-bootstrap.inc" ]; then . "/home/deman/.config/fabric/fabric-bootstrap.inc"; fi

alias matrix="unimatrix -abf -s 96"


# pnpm
export PNPM_HOME="/home/deman/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


eval $(thefuck --alias)


alias sz="source ~/.zshrc"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/deman/.lmstudio/bin"
# End of LM Studio CLI section


alias archupdate="yay -Syu --needed --noconfirm --sudoloop "
export PATH="$HOME/.local/bin:$PATH"


export TERMINAL=kitty

export GOTOOLCHAIN=auto

# Функция для быстрой очистки корня
clean_system() {
    echo "--- Анализ места ДО очистки ---"
    df -h / | awk 'NR==2 {print "Доступно: " $4 " (из " $2 ")"}'
    echo "--------------------------------"

    echo "1/4: Очистка кэша pacman..."
    sudo rm -f /var/cache/pacman/pkg/*.part
    sudo pacman -Scc --noconfirm
    
    echo "2/4: Очистка системного журнала (до 500МБ)..."
    sudo journalctl --vacuum-size=500M
    
    echo "3/4: Удаление coredumps..."
    sudo rm -rf /var/lib/systemd/coredump/*
    
    echo "4/4: Удаление неиспользуемых данных Flatpak..."
    if command -v flatpak &> /dev/null; then
        sudo flatpak uninstall --unused -y
    fi
    
    echo "--------------------------------"
    echo "--- Анализ места ПОСЛЕ очистки ---"
    df -h / | awk 'NR==2 {print "Доступно: " $4 " (из " $2 ")"}'
}


alias mem="smem -rkc 'name uss' | head -20"

export CAVEMAN_DEFAULT_MODE=ultra
