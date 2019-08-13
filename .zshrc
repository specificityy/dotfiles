# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/wilson.jimenez/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ll="ls -lha"
alias ..="cd .."


# QMetric specific
alias bubbles="cd ~/Projects/bubbles"
alias fedenv="cd ~/Projects/fe-dev-environment"
alias rsflow="./node_modules/.bin/flow stop; yarn flow:watch"
alias rsservices="fedenv; docker-compose down; ./start.sh; docker-compose ps"
alias startbubbles="cd ~/automation; osascript bubbles_terminal-tab.scpt"
alias startblossom="cd ~/automation; osascript dev_blossom.scpt"
alias startwebbackend="fedenv; ./start.sh; cd ~/automation; osascript mojo-jojo_and_fuzzylumpkins_terminal-tab.scpt; fedenv"
alias morningcoffee="cd ~/automation; osascript close-terminal-tabs-and-sessions.scpt; rsservices; sleep 1; startbubbles; startwebbackend; fedenv"
alias aggs_local_enquiry="cd ~/Projects/dooku; ./quote | xmllint --xpath 'string(//aggregatorResponse/quote/link)' - | sed 's/entrypoint.website.playground.internal.qmetric.co.uk/localhost:8086/' | xargs open -a \"Google Chrome\""
alias aggs_playground_enquiry="cd ~/Projects/dooku; ./quote | xmllint --xpath 'string(//aggregatorResponse/quote/link)' - | xargs open -a \"Google Chrome\""

source ~/.qmg_secrets

export PATH=~/.npm-global/bin:$PATH
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
