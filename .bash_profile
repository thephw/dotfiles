export BASH_SILENCE_DEPRECATION_WARNING=1

# Make the path correct for homebrew and install Brewfile depedencies
if  [ "$(uname -m)" == "arm64" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
else
  eval $(brew shellenv)
fi
brew bundle check --file $HOME/Brewfile || {
  brew bundle --file $HOME/Brewfile
}

# Setup bash completions and secrets
[ -f $HOMEBREW_PREFIX/libexec/asdf.sh ] && . $HOMEBREW_PREFIX/libexec/asdf.sh
[ -f $HOMEBREW_PREFIX/etc/bash_completion.d/asdf.bash ] && . $HOMEBREW_PREFIX/etc/bash_completion.d/asdf.bash
[ -n "$(which fzf)" ] && [ -f "$HOME/.fzf.bash" ] && source $HOME/.fzf.bash
[ -n "$(which kubectl)" ] && source <(kubectl completion bash | sed 's/kubectl/kc/g')
[ -f "$HOME/git-completion.bash" ] && source $HOME/git-completion.bash
[ -n "$(which op)" ] && source <(op completion bash)
GITAWAREPROMPT="$HOME/.bash/git-aware-prompt"
[ -f "$GITAWAREPROMPT/main.sh" ] && source "$GITAWAREPROMPT/main.sh"
[ -f "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc" ] && source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
[ -f "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ] && source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

# Makefile autocompletion
complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make

# Setup options for asdf plugins
export KERL_BUILD_DOCS=yes # Enables building erlang with documentation

# PATH updates
export PATH="./bin:$PATH" # Add project binaries to the path
export PATH="$HOME/bin:$PATH" # Add person binaries to the path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Configure bash
export EDITOR='code --wait'
shopt -s histappend
HISTSIZE=
HISTFILESIZE=
export PS1="(\W\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]) \$ "
export GPG_TTY=$(tty) # Need for signing commits with GPG

# Aliases
alias e='code .'
alias be='bundle exec '
alias dc='docker-compose'
alias kc='kubectl'
alias kx='kubectx'
alias kn='kubens'
alias ll="ls -l"
. $HOME/.asdf/asdf.sh

# FLOWERWORK_CLUSTERS_VERSION=0.0.1
CLUSTERS_DIR="$HOME/clusters"
mkdir -p "$CLUSTERS_DIR"
export KUBECONFIG="$(ls $CLUSTERS_DIR/*.{yml,yaml} | tr "
" ":")$HOME/.kube/config"
# FLOWERWORK_CLUSTERS_END

source ~/functions.sh
source ~/.ssh/secrets
