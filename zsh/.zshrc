export ZSH="/home/bang/.oh-my-zsh"

#ZSH_THEME="random"
ZSH_THEME="refined"


HIST_STAMPS="mm/dd/yyyy"

plugins=(git copydir copyfile z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias cb='clipcopy'
alias cpd='copydir'
alias cpf='copyfile'
alias cppc='history | tail -n 1 | cut -d " " -f 5- | clipcopy'

alias ipe='/home/bang/tools/ipe/ipe.AppImage'
alias ipeslides='/home/bang/tools/ipe/ipe.AppImage ipe -sheet presentation'

alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias r='ranger'
alias untar='tar xvfz'

alias gits='git status'
alias gita='git add'
alias gitc='git commit -m'
alias pull='git pull'
alias push='git push'
alias ghpw='cpf ~/.ghpw'
alias dhpw='cpf ~/.dhpw'
alias cp-git-remote="git remote -v | grep fetch | awk -F ' ' '{print $2}' | clipcopy"

alias mousecoords='watch -t -n 0.0001 xdotool getmouselocation'
alias mousepos='watch -t -n 0.0001 xdotool getmouselocation'

alias dls='cd ~/Downloads'
alias l='lsd -l'

alias m='micro'
alias esb='history | tail -n 50 | cut -c 26- | micro +10000:100'
alias msb='micro -startpos 100000,1 $BYOBU_RUN_DIR/printscreen'

alias ff='firefox'

alias saturny='ssh -Y bang@saturn.cs.hmc.edu'
alias saturn='ssh bang@saturn.cs.hmc.edu'
alias knuthy='ssh -Y bang@knuth.cs.hmc.edu'
alias knuth='ssh bang@knuth.cs.hmc.edu'

alias ytdl='youtube-dl -x --audio-format mp3 --audio-quality 1'
alias mousepos='watch -t -n 0.0001 xdotool getmouselocation'

alias flc='ls | wc | awk '\''{print $1}'\'''
alias hs='history | grep -i'
alias m='micro'
alias dhpw='cpf ~/.dhpw'
alias hs='history | grep -i'

# alias dotfix="sed -e s/rank\ =\ sink\;//g -i "

# hsc() {
#     history | grep -B "$2" -A "$3" "$1"
# }

hsc () {
        omz_history -f | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} -B "$2" -A "$3" "$1"
}

cpfp () {
	emulate -L zsh
	print -n $PWD/$1 | clipcopy
}

vpdf () {
    evince "$1" & disown;
} 

xopen () {
    xdg-open "$1" & disown;
} 

#alias sb='xdotool key shift+F7; micro "$BYOBY_RUN_DIR"/printscreen;'
sb () {
  xdotool key shift+F7;
  #/snap/bin/micro "$BYOBU_RUN_DIR/printscreen":10000:1;
  cat "$BYOBU_RUN_DIR/printscreen" | grep . > ~/.tmp.sb.micro 
  /snap/bin/micro ~/.tmp.sb.micro:10000:100;
}

giturl (){ git remote -v | grep fetch | awk -F ' ' '{print $2}' }

precmd() { eval "$PROMPT_COMMAND" }

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

clear
# echo $fg[yellow] "$(cat ~/.unicorn.ascii)"
# neofetch --off
# lolcat ~/.logo.ascii
