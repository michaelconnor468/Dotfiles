export TERM="xterm-256color"
export EDITOR="vim"
export TERMINAL="alacritty"
export JAVA_HOME="/usr/lib/jvm/java-19-openjdk"
export PROMPT_EOL_MARK=''

## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git 
zstyle ':vcs_info:*' enable git 

# pre-promp computation hooks
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        if [[ -n $(git ls-files --others --exclude-standard) ]] ; then
            hook_com[staged]+='!'
        fi
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
PROMPT="%B%{$fg[green]%}%{$fg[blue]%}<%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}> %{$fg[yellow]%}%c %(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>)%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
export ZSH_COMPDUMP=~/.cache/zsh/zcompdump

alias ls='lsd'
alias la='lsd -Al'
alias vim='nvim'
alias cat='ccat -G String="darkgreen" -G Comment="darkgreen" -G Type="darkyellow" -G Plaintext="lightgray" -G Literal="darkyellow" -G Keyword="darkblue" -G Punctuation="lightgray" -G Decimal="darkred"'
alias diff='diff --color'
alias grep='grep --color=always'
alias weather='curl -s "wttr.in/?Fu"'
alias screenshot='flameshot gui'

function cl {
    cd $1 && ls -al 
}

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vim mode stuff
bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M menuselect 'h' vi-backwad-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

if [[ "$(uname)" == "Darwin" ]]; then
    source ~/.config/zsh/hooks/machook.sh
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    source ~/.config/zsh/hooks/linuxhook.sh
fi

# misc host-based envs
if [[ "$(hostname)" == "michael-james-connor-L2VTVM06F4" ]]; then
    source ~/.config/zsh/hooks/fairehook.sh
fi

source ~/.config/zsh/lscolors.sh

# emacs vterm stuff
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

