##########################
## Global setup options ##
##########################

#Setup rbenv automatically
eval "$(rbenv init -)"

#Configure editor
export EDITOR='atom -w'

#Setup sublime alias e
alias e='atom . &'

alias be='bundle exec '

#Set PS1
export PS1="(\W) $ "

#Git autocompletion
source ~/git-completion.bash
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias ll="ls -l"

#Turn on terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#Make the path correct for homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

#Add binstubs to the path
export PATH="./bin:$PATH"

#Need for signing commits with GPG
export GPG_TTY=$(tty)
