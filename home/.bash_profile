# bash profile
# updated December 3, 2019
# https://github.com/Dnld/dotfiles/

################################################################################

# paths
export GOPATH=/Users/djs/go
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export PATH=$PATH:/Users/djs/Library/Android/sdk/platform-tools/
export PATH=/Users/espireinfolabs/Desktop/soft/android-sdk-mac_x86/platform-tools:$PATH
export PATH=$PATH:$GOPATH/bin

# prompt
export PS1="\[\e[0;36m\]\W \[\e[0;36m\]$ \[\e[0m\]"
#
# default editor
export EDITOR=vim

alias c="clear"
alias c-="cd -"
alias cd..="cd ../"
alias ..="cd ../"
alias ...="cd ../../"
alias cp="cp -iv"
alias f="open -a Finder ./"
alias hc="history -c"
alias l="less"
alias ll="ls -lahG"
alias mk="mkdir -v"
alias mv="mv -iv"
alias pc="pbcopy"
alias pp="pbpaste"
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

# dotfiles
alias bp="vim ~/.bash_profile"
alias rbp="source ~/.bash_profile"
alias rtc="tmux source ~/.tmux.conf"
alias vrc="vim ~/.vimrc"
alias vtc="vim ~/.tmux.conf"

# navigation
alias db="cd ~/Dropbox\ \(Good\ Uncle\)/don"
alias desk="cd ~/Desktop"
alias dev="cd ~/Dropbox\ \(Good\ Uncle\)/don/development/"
alias devg="cd ~/go/src/github.com/goodunclefood"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias gpth="cd /Users/djs/go"

# get all tasks
alias tasks='git grep -EI "TODO|FIXME"'

# git
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
alias gpod="git push origin development"
alias gpom="git push origin master"
alias gpos="git push origin staging"
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

# open ports
alias ports="sudo lsof -PiTCP -sTCP:LISTEN"

# go
alias grm="go run main.go"

# node
alias nn="node"

# python
alias python="python3"
alias python2="python2"

# sublime
alias s="sublime"
alias s.="sublime ."

# tmux
alias tt="tmux"
alias tta="tmux attach -t"
alias ttd="tmux detach"
alias tte="exit"
alias ttk="tmux kill-server"
alias ttl="tmux ls"
alias ttn="tmux new -s "

# GU restarts
alias restart-production="aws ecs update-service --force-new-deployment --cluster ecs-production --service "
alias restart-staging="aws ecs update-service --force-new-deployment --cluster ecs-staging --service "

# Android_Home Environment Variable
export ANDROID_HOME=~/Library/Android/sdk

################################################################################
