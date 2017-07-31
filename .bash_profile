##########################
## Global setup options ##
##########################

# Setup rbenv automatically
eval "$(rbenv init -)"

# Configure editor
export EDITOR='atom -w'

# Setup atom alias e
alias e='atom . &'

alias be='bundle exec '

# Set PS1
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
# export PS1="(\W)${git_branch} $ "
export PS1="(\W\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]) \$ "

# Git autocompletion
source ~/git-completion.bash
alias ll="ls -l"

# Make the path correct for homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
source /usr/local/opt/nvm/nvm.sh

# Add binstubs to the path
export PATH="./bin:$PATH"

# Need for signing commits with GPG
export GPG_TTY=$(tty)

# alias run="TZ=\"America/New_York\" bundle exec foreman start -f DevelopmentProcfile -p 3000"

# export local bin to path
export PATH="~/bin:$PATH"
