# Start tmux
[[ -z "$TMUX" ]] && exec tmux

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
# The following lines were added by compinstall
zstyle :compinstall filename '/cygdrive/c/Users/Revan/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall


#autoload promptinit
#promptinit
#prompt fade blue

#prompt (modified fade)
local fadebar_cwd=${1:-'blue'}
local userhost=${2:-'white'}
local date=${3:-'white'}

local -A schars
autoload -Uz prompt_special_chars
prompt_special_chars

PS1="%(?..[%?] )%F{$fadebar_cwd}%B%K{$fadebar_cwd}$schars[333]$schars[262]$schars[261]$schars[260]%F{$userhost}%K{$fadebar_cwd}%B%~/%b%k%f%b%F{$fadebar_cwd}%K{black}$schars[333]$schars[262]$schars[261]$schars[260]%f%k"
PS2="%F{$fadebar_cwd}%K{black}$schars[333]$schars[262]$schars[261]$schars[260]%f%k>"
RPROMPT="%F{$date}%K{black}%B %D{%I:%M:%S%P}%F{$fadebar_cwd}%K{black}%B%b"

prompt_opts=(cr subst percent)

#vim mode
bindkey -v

function zle-line-init zle-keymap-select {
	RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
	RPS2=$RPS1
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#Fix keys
#bindkey '\e[H' beginning-of-line
#bindkey '\e[F' end-of-line
#bindkey ';5D' emacs-backward-word
#bindkey ';5C' emacs-forward-word
#bindkey "^[[3~" delete-char
#bindkey "^[3;5~" delete-char

#set window title to directory name
case $TERM in
	    xterm*)
	        precmd () {print -Pn "\e]0;%~\a"}
	        ;;
esac

#back-delete stops at symbols
autoload -U select-word-style
select-word-style bash

#colorize ls
alias ls='LANG=en_US ls -Gh --file-type --color=tty --hide="\$RECYCLE.BIN" --hide="System Volume Information" --hide="ntuser.dat*" --hide="NTUSER.DAT*"'

alias subl="run /cygdrive/c/Program\ Files/Sublime\ Text\ 2/sublime_text.exe"
alias heroku="/usr/local/heroku/bin/heroku"
#alias virtualenv="/cygdrive/c/Python27/Scripts/virtualenv"

alias vm="ssh -l revan -p 2222 localhost"
alias ilab="ssh rws114@man.cs.rutgers.edu"

alias xclip="xclip -selection c"

export PATH="/usr/local/heroku/bin:$PATH"
export PATH=".gem/ruby/2.0.0/bin:$PATH"

