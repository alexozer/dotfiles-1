#!/usr/bin/env zsh

## Global aliases only works with ZSH
if [[ "$0" =~ 'zsh' ]]; then
    # Global directories aliases
    alias -g ..='..'
    alias -g ...='../..'
    alias -g ....='../../..'
    alias -g .....='../../../..'
    alias -g ......='../../../../..'
    alias -g .......='../../../../../..'

    # Global commands aliases
    alias -g X='| xargs'
    alias -g G='| grep'
    alias -g N='| grep -v'
    alias -g E='| grep-passthru'
    if [[ "$OSTYPE" == "darwin"* ]]; then
        alias -g CC='| pbcopy'
    else
        alias -g CC='| xclip -selection clipboard'
    fi
    alias -g XS='| xargs subl'
    alias -g HR='| highlight red'
    alias -g HG='| highlight green'
    alias -g HB='| highlight blue'
    alias -g HM='| highlight magenta'
    alias -g HC='| highlight cyan'
    alias -g HY='| highlight yellow'
    alias -g C='| wc -l'
    alias -g S='| sort'
    alias -g H='| head'
    alias -g L="| less"
    alias -g T='| tail'
    alias -g P='| pygmentize -O style=monokai -f console256 -g'
else
    # Directories aliases
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias .....='cd ../../../..'
    alias ......='cd ../../../../..'
    alias .......='cd ../../../../../..'
fi

# Aliases only for non root users
alias apt-installed="aptitude search '~i!~M'"
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias sudo='sudo ' ## Allow aliases to be sudo’ed
    alias watch='watch ' ## Allow aliases to be watched
    alias halt="osascript -e 'tell app \"System Events\" to shut down'"
    alias reboot="osascript -e 'tell app \"System Events\" to restart'"
    alias agall='brew update ; brew upgrade ; brew prune ; brew cleanup ; brew doctor'
    alias brewall='brew update ; brew upgrade ; brew prune ; brew cleanup ; brew doctor'
elif [[ $UID != 0 || $EUID != 0 ]]; then
    alias sudo='sudo ' ## Allow aliases to be sudo’ed
    alias watch='watch ' ## Allow aliases to be watched
    alias halt='sudo shutdown -h now'
    alias reboot='sudo shutdown -r now'
    alias apt='sudo apt-get'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias agu='sudo apt-get update'
    alias agg='sudo apt-get upgrade'
    alias ags='sudo apt-cache search'
    alias agall='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove'
else
    alias halt='shutdown -h now'
    alias reboot='shutdown -r now'
    alias apt='apt-get'
    alias agi='apt-get install'
    alias agr='apt-get remove'
    alias agu='apt-get update'
    alias agg='apt-get upgrade'
    alias ags='apt-cache search'
    alias agall='apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove'
fi

# Use GNU tools instead of bsd ones
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='\gls --color=auto'
    alias awk='\gawk'
    alias sed='\gsed'
    alias grep='\ggrep'
fi

# Directories working
alias pwd=' pwd'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias pwdc=' pwd | tr -d "\n" | pbcopy'
else
    alias pwdc=' pwd | tr -d "\n" | xclip -selection clipboard'
fi
alias cd=' cd'
alias cdg=' cd "$(git rev-parse --show-toplevel)"' ## git root
alias -- -=' cd -'
alias 1=' cd -'
alias 2=' cd -2'
alias 3=' cd -3'
alias 4=' cd -4'
alias 5=' cd -5'
alias 6=' cd -6'
alias 7=' cd -7'
alias 8=' cd -8'
alias 9=' cd -9'

alias l='ls -lh --group-directories-first'
alias ll='ls -lhA --group-directories-first'
alias llm='ls -lhAt --group-directories-first' ## "m" for sort by last modified date
alias llc='ls -lhAU --group-directories-first' ## "c" for sort by creation date
alias lls='ls -lhAS --group-directories-first' ## "s" for sort by size
alias lla='ll-archive' ## "a" for archive
alias k='k -h'
alias kl='k -h --no-vcs'
alias kk='k -Ah'
alias kkl='k -Ah --no-vcs'

# 1 letter commands shortcuts
alias p=' dirs -v | head -10' ## most used dirs for current session
alias x=' exit'
alias d='desk'
alias h='history'
alias j='jobs'
alias t='tmux'
alias v='open-with-vim'
alias e='open-with-vim'
alias s='open-with-sublime-text'
alias a='open-with-atom'
alias n='nano'
alias g='git'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias c=" clear && printf '\e[3J'"
    alias o='open'
else
    alias c=" clear && echo -ne '\033c'"
    alias o='xdg-open 2>/dev/null'
fi

# Others commands shortcuts
alias dg='desk go'
alias co='pygmentize -O style=monokai -f console256 -g'
alias zd='z --del'
alias mu='mutt'
alias mf='mutt -F'
alias k9='kill -9'
alias rd='rmdir'
alias md='mkdir -p'
alias mcd='mkdir-cd'
alias mkcd='mkdir-cd'
alias trm='trash-put'
alias rmf="rm -rf"
alias rmrf="rm -rf"
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"
alias cpr="cp -r"
alias bak='backup-file'
alias psy='psysh'
alias run='make'
alias phpl='php -l'
alias tailf='tail -f'
alias less='less -r'
alias whence='type -a'
alias whereis='whereis'
alias grep='grep --color=auto'
alias vgrep='grep -v --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zshrc='source ~/.zshrc' ## Reload config
alias dotfiles='(cd ${DOTFILES_PATH} && git pull) ; (cd ${DOTFILES_PATH}/../private && git pull) ; source ~/.zshrc' ## Pull dotfiles from repositories and reload config
alias snippets="cat ${DOTFILES_PATH}/zsh/snippets.zsh | sed -r 's/^function //g' | sed -r 's/^# (.*)/\x1b[32m\x1b[1m# \1\x1b[0m/'"

# System stats
alias free='free -h'
alias ps='ps auxf'
alias iotop='iotop -Poa' ## iotop with only processes using i/o + accumulated i/o
alias dmesg="dmesg -T|sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'" ## dmesg with colored human-readable dates
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias df='gdf -h'
    alias du='gdu -h'
    alias du0='gdu --max-depth=0'
    alias du1='gdu --max-depth=1 | sort -k2' ## sort by name
    alias du1s='gdu --max-depth=1 | sort -h' ## sort by size
else
    alias df='df -h'
    alias du='du -h'
    alias du0='du --max-depth=0'
    alias du1='du --max-depth=1 | sort -k2' ## sort by name
    alias du1s='du --max-depth=1 | sort -h' ## sort by size
fi

# Search & find
alias sg='grep -rinw "." -e ' ## inside files
alias sa='ack -Hir' ## with ack
alias ss='sift -n' ## with sift
alias rg='rg -S' ## with ripgreprg
alias ff='find . -type f -iname ' ## insensitive filename
alias fr='find-and-replace' ## find and replace in current dir

# Git
alias gcl='git clone --recursive'
alias gcf='git config'
alias gs='git status'
alias gst='git status-short'
alias ga='git add'
alias gaa='git add -A'
alias gl='git log'
alias gls='git log --stat' ## include which files were altered
alias glp='git log -p' ## display the full diff of each commit
alias gll='git pretty-log'
alias gbl='git blame -b -w'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gdt='git difftool -d'
alias gw='git whatchanged'
alias gg='git grep -n -C2 -E'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcu='git reset --soft HEAD~' ## undo commit
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gb='git branch'
alias gbm='git branch --merged'
alias gbr='git branch -r'
alias gbu='git remote update origin --prune' ## update remote list
alias gm='git merge'
alias gms='git merge --squash'
alias gmm='git merge -m'
alias gt='git tag'
alias gco='git checkout'
alias gcom='git checkout master'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gp='git pull'
alias gpull='git pull'
alias gpush='git push'
alias gpr='git pull --rebase'
alias gsu='git set-upstream'
alias gget='git get'
alias gput='git put'
alias ggp='git get-put'
alias grb='git rebase'
alias gss='git stash save'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gsl='git stash list'
alias ggc='git gc --aggressive'
alias cgd='cdiff -s -w 0' ## columned & colored git diff
alias cgs='columns-git-show' ## columned & colored git diff

# Docker
alias doi="docker images"
alias dov="docker volume"
alias doe="docker exec"
alias dok="docker kill"
alias dops="docker ps"
alias dorm="docker rm"
alias dormi="docker rmi"
alias dc="docker-compose"
alias dcc="./docker-compose-run-script.sh"
alias dce="docker-compose exec"
alias dcr="docker-compose run"
alias dcb="docker-compose build"
alias dcup="docker-compose up"
alias dcrm="docker-compose rm"
alias dcsa="docker-compose start"
alias dcso="docker-compose stop"
alias dsss="docker-sync-stack start"
alias dssc="docker-sync-stack clean"

# OS Specific
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Show/hide hidden files in Finder
    alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

    # Hide/show all desktop icons (useful when presenting)
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

    # Stuff I never really use but cannot delete either because of http://xkcd.com/530/
    alias stfu="osascript -e 'set volume output muted true'"

    # Kill all the tabs in Chrome to free up memory
    # [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
    alias chromekill="\ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

    alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

    # Ignore macos files
    alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"

    # Flush DNS
    alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

    # Quick-Look preview files from the command line
    alias ql="qlmanage -p &>/dev/null"

    # Reload native apps
    alias killos="killfinder && killdock && killmenubar"
else
    # Record x11
    alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" ## then pass a filename
fi

# rsync
alias rsync-copy="rsync -av --progress -h --exclude-from=$HOME/.cvsignore"
alias rsync-move="rsync -av --progress -h --remove-source-files --exclude-from=$HOME/.cvsignore"
alias rsync-update="rsync -avu --progress -h --exclude-from=$HOME/.cvsignore"
alias rsync-synchronize="rsync -avu --delete --progress -h --exclude-from=$HOME/.cvsignore"

# Files permissions
alias 400='chmod 400 -R'
alias 600='chmod 600 -R'
alias 640='chmod 640 -R'
alias 644='chmod 644 -R'
alias 755='chmod 755 -R'
alias 775='chmod 775 -R'
alias 777='chmod 777 -R'
alias www="chown www-data:www-data * .* -R"
alias mx='chmod u+x'

# SSH helpers
alias tunnel='ssh -f -N' ## Create a tunnel
alias tunnel-mysql='ssh -N -L 3307:localhost:3306' ## Create a MySQL tunnel
alias tunnel-socks='ssh -N -D 8080' ## SOCKS proxy
alias tunnel-list='ps aux | grep "ssh -f -N" | grep -v "grep"' ## List tunnels
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias pubkey="more ~/.ssh/keys/perso.rsa.pub | pbcopy | echo '=> Public key copied to pasteboard'"
else
    alias pubkey="more ~/.ssh/keys/perso.rsa.pub | xclip | echo '=> Public key copied to pasteboard'"
fi

# Date & time helpers
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias cal='cal'
else
    alias cal='cal -3'
fi
alias week='date +%V'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Network & ISP tests
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myips="ifconfig -a | grep -o 'inet6\? \(ad\?dr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:|adr:)? ?/, \"\"); print }' | grep -v '127.0.0.1' | grep -v '::1'"
alias localip="ifconfig | grep -Eo 'inet (addr:|adr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias ipstats="netstat -ntu | tail -n +3 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
alias ports="lsof -ni | grep LISTEN"
alias ns="nslookup"
alias he="sudo $EDITOR /etc/hosts"

for method in GET HEAD POST PUT DELETE PURGE TRACE OPTIONS; do
    alias "$method"="http '$method'"
done

# Curl & web helpers
alias dl='curl --continue-at - --location --progress-bar --remote-name --remote-time' ## download a file
alias weather='curl -A curl wttr.in'
alias wget-site='wget --mirror -p --convert-links -P'
alias header='curl-header'
alias purge='curl-purge'

# Online pastebins
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"

# Because Oo
alias tableflip="echo '(ノಠ益ಠ)ノ彡┻━┻'" ## see https://gist.github.com/endolith/157796
alias utf8test="wget -qO- http://8n1.org/utf8" ## test terminal UTF8 capabilities

# Composer helpers
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload"

# Laravel helpers (through docker)
alias art='docker-compose exec php php artisan'
alias art-mig-install='docker-compose exec php php artisan migrate:install'
alias art-mig-seed='docker-compose exec php php artisan migrate:refresh --seed'

# Symfony helpers (through docker)
alias sc="docker-compose exec php php bin/console"
alias sc-make-entity="docker-compose exec php php bin/console make:entity"
alias sc-make-migration="docker-compose exec php php bin/console make:migration"
alias sc-doctrine-migrate="docker-compose exec php php bin/console doctrine:migrations:migrate -n"
alias sc-doctrine-fixtures="docker-compose exec php php bin/console doctrine:fixtures:load -n"
