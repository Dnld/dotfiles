# bash profile
# updated May 21, 2017
# https://github.com/Dnld/dotfiles/

################################################################################

# set paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# prompt
export PS1="\[\033[2m\]\W\$(parse_git_branch) $\[\033[0m\] "

# default editor
export EDITOR=vim

# environment shortcuts
alias bp="vim ~/.bash_profile"
alias c="clear"
alias c-="cd -"
alias cd..="cd ../"
alias ..="cd ../"
alias ...="cd ../../"
alias cp="cp -iv"
alias f="open -a Finder ./"
alias ll="ls -lahG"
alias mk="mkdir -v"
alias mv="mv -iv"
alias pc="pbcopy"
alias pp="pbpaste"
alias rbp="source ~/.bash_profile"
alias rm="rm -iv"
alias t="touch"
alias v="vim"
function ts() {
  touch "$1"
  sublime "$1"
}
function tv() {
  touch "$1"
  vim "$1"
}
function cdf() {
  currFolderPath=$( /usr/bin/osascript <<EOT
    tell application "Finder"
      try
    set currFolder to (folder of the front window as alias)
      on error
    set currFolder to (path to desktop folder as alias)
      end try
      POSIX path of currFolder
    end tell
EOT
  )
  cd "$currFolderPath"
}
function mc() {
  mkdir "$1"
  cd "$1"
}
function pwdc() {
  pwd | pbcopy
  pwd
}

# application shortcuts
alias act="open -a activity\ monitor"
alias cal="open -a calendar"
alias con="open -a contacts"
alias itu="open -a itunes"
alias mai="open -a mail"
alias mes="open -a messages"
alias pho="open -a photos"
alias sim="open -a simplenote"
alias sla="open -a slack"
alias twe="open -a tweetbot"

# navigational shortcuts
alias db="cd ~/Dropbox/"
alias desk="cd ~/Desktop"
alias dev="cd ~/Dropbox/development"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"

# Chrome shortcuts
alias chr="open -a google\ chrome"

# Git shortcuts
alias ga="git add"
alias gaa="git add -A"
alias gad="git add ."
alias gb="git branch"
alias gbco="git checkout -b"
alias gcm="git commit -m"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gi="git init"
alias gl="git log"
alias gll="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias glll="gll --all"
alias gmc="git commit -m"
alias gmg="git merge"
alias gpf="git push -f"
alias gpfo="git push -f origin"
alias gpfom="git push -f origin master"
alias gpl="git pull"
alias gpo="git push origin"
alias gpod="git push origin develop"
alias gpom="git push origin master"
alias gpu="git push"
alias gpuf="git push -f"
alias gpr="git pull --rebase"
alias gpro="git pull --rebase origin"
alias gpru="git pull --rebase upstream"
alias gpum="git pull upstream master"
alias gr="git remote"
alias grao="git remote add origin"
alias grb="git rebase"
alias grau="git remote add upstream"
alias gs="git status -s"
alias gss="git status"
alias get="git"
alias got="git"

# Networking shortcuts
alias ports="sudo lsof -PiTCP -sTCP:LISTEN"

# Node shortcuts
alias no="node"
alias nde="nodemon"

# Python shortcuts
alias pss="python -m SimpleHTTPServer"
alias py="python"

# Safari shortcuts
alias saf="open -a safari"

# Sublime shortcuts
alias s="sublime"
alias s.="sublime ."

# Xcode shortcuts
alias xco="open -a xcode"

# Git branch in prompt
function parse_git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}

# Node path
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

################################################################################
