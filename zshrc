ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira2"
#ZSH_THEME="avit"
#ZSH_THEME="random"

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"
export LSCOLORS="exfxcxdxbxegedabagacad"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump osx zsh_reload brew tools)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export TERM=xterm-color
#eval `gdircolors ~/.dir_color`
export EDITOR=vi
export CLICOLOR=1


export PATH=$PATH:/usr/local/yan/bin:/Users/snow/.cabal/bin
export PATH="$HOME/.rbenv/bin:$PATH"

export LC_ALL=zh_CN.UTF-8
export LC_ALL=en_US.UTF-8

. /usr/local/opt/autojump/etc/autojump.sh
autoload -U compinit && compinit -u

#alias ls="ls -h --color=auto"
alias ll="ls -al"
alias l="ls -l"
alias df="df -h"
alias tree="tree --dirsfirst -C"
alias tn="dig www.google.com"
alias mld="ld -macosx_version_min 10.7.0 -lSystem "
alias nasm64="/usr/local/bin/nasm -f macho64 "
alias nasm32="/usr/local/bin/nasm -f macho "
alias otool="otool -tV"
alias masm="clang -mllvm --x86-asm-syntax=intel -S "
alias rrm="rsync -a --delete /Users/snow/.empty/"

# app
alias m="mplayer"
alias goproxy="goagent >/dev/null 2>&1 &"
alias mirror="wget --mirror -w 2 --html-extension --convert-link -P"

# path
alias lab="cd ~/yan/lab"
alias work="cd ~/yan/lab/work"
alias blog="cd ~/yan/repo/blog"

# python
. ~/.pythonbrew/etc/bashrc
# alias py="python"
alias py="python"
alias ipy="/Users/snow/.pythonbrew/pythons/Python-2.7.7/bin/ipython"
pythonbrew use 2.7.7  >/dev/null 2>&1
alias macpy="/usr/bin/python2.7"

# erlang
export ERL_ROOT="/Users/snow/yan/lab/erlang"
export PATH="/usr/local/yan/otp_R17/bin":$PATH
alias erls="erl -boot start_sasl"

# haskell


#racket
export PATH="/usr/local/yan/racket6.0/bin":$PATH
alias swift="/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift"

#go
export GOROOT="/usr/local/Cellar/go/1.4/libexec/"
#export GOROOT="/usr/local/yan/go/"
export GOBIN="$GOROOT/bin"
export GOPATH="/Users/snow/yan/lab/go/package"
export PATH="/usr/local/yan/tools/bin":$GOBIN:$PATH

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/snow/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

export PATH="/usr/local/yan/cargo/bin":$PATH
export PATH="/Library/Haskell":$PATH
export PATH="/Users/snow/yan/lab/sdk/android-sdk-macosx/platform-tools":$PATH

[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
pybrew use 2.7.7 1 > /dev/null 2 >&1
alias easy_install="/Users/snow/.pythonbrew/pythons/Python-2.7.7/bin/easy_install"
export PATH="/Users/snow/.pythonbrew/pythons/Python-2.7.7/bin":$PATH

launchctl setenv GOROOT $GOROOT
launchctl setenv GOPATH $GOPATH

alias fserver="python -m SimpleHTTPServer"
alias dev="ssh developer@192.168.199.200"
alias svnclean="svn st | grep '^?' | awk '{print $2}'"
alias rsyncdel="rsync --delete-before -d -a -H -v --progress --stats ~/yan/empty/ "
