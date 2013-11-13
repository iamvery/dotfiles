# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="iamvery"
IAMVERY_SHOW_BRACKETS='no'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias be="nocorrect bundle exec"
alias hu="hitch $@"
alias uh="hitch -u"
alias hum="hu iamvery brianstanwyck"
alias slog="the-stable log"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR=vim

PATH=$PATH:$HOME/bin                # Add user bin directory for executables
PATH=$PATH:/usr/local/share/npm/bin # Add node package manager  bin
PATH=/usr/local/git/bin:$PATH       # Use git from homebrew over Xcode's
PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

# Allows us to connect to local server without specifying host. This
# can simply things such as Rails db configs, allowing you to leave
# the host config out.
export PGHOST=/var/pgsql_socket

source ~/.secrets

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.0

# Run the export script after invoking the hitch command, this is how hitch
# sets the author and see for git. https://github.com/therubymug/hitch
hitch(){
  command hitch $@
  export_script="$HOME/.hitch_export_authors"
  if [[ -s $export_script ]]; then
    source $export_script
  fi
}
