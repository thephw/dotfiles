##########################
## Global setup options ##
##########################

source ~/.ssh/secrets

# Make the path correct for homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Setup rbenv automatically
eval "$(rbenv init -)"

# Setup Nodenv automatically
eval "$(nodenv init -)"

# Setup Jenv automatically
eval "$(jenv init -)"
export PATH="$HOME/.jenv/bin:$PATH"

# Configure editor
export EDITOR='atom -w'

# Setup atom alias e
alias e='atom . &'

alias be='bundle exec '

alias dc='docker-compose'

# Set PS1
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
# export PS1="(\W)${git_branch} $ "
export PS1="(\W\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]) \$ "

# Git autocompletion
source ~/git-completion.bash
alias ll="ls -l"

# Add binstubs to the path
export PATH="./bin:$PATH"

# Need for signing commits with GPG
export GPG_TTY=$(tty)

# alias run="TZ=\"America/New_York\" bundle exec foreman start -f DevelopmentProcfile -p 3000"

# export local bin to path
export PATH="~/bin:$PATH"

# Export the path for local binaries
export PATH=$PATH:/Users/thephw/bin

# Source for AZ bash completion
source '/Users/thephw/lib/azure-cli/az.completion'

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

#Kubectl autocomplete
source <(kubectl completion bash)
