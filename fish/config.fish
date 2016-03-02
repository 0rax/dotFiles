#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

# ---  System  -----------------------------------------------------------------

set -gx XDG_CONFIG_HOME $HOME/.config/
set -gx XDG_DATA_HOME   $HOME/.data/
set -gx OS_TYPE         (uname)
set -gx PATH            $PATH $HOME/bin /sbin/ /usr/sbin /usr/local/sbin

# ---  Editor & Pager  ---------------------------------------------------------

set -gx EDITOR           'vim'
set -gx GIT_EDITOR       'vim'
set -gx ALTERNATE_EDITOR 'nano'

if command -s most > /dev/null
    set -gx MANPAGER     'most'
    set -gx PAGER        'most'
end

# ---  Emacs  ------------------------------------------------------------------

if command -s emacs > /dev/null
    alias emacs   'emacs_connect'
    alias ne      'command emacs -nw --quick --no-init-file'
end

# ---  Aliases  ----------------------------------------------------------------

alias l       'ls -A'
alias la      'ls -a'
alias lla     'ls -lha'

alias fgrep   'fgrep --color=auto'
alias egrep   'egrep --color=auto'
alias grep    'grep --color=auto'

alias size    'du -sh'
alias share   'python -m SimpleHTTPServer 8000'

if begin; command -s rlwrap; and command -s gpg2; end > /dev/null
    alias gpg 'rlwrap gpg2'
end

# ---  System Specific Aliases  ------------------------------------------------

if [ "$OS_TYPE" = "Darwin" ] # Mac OS X

    alias airport "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
    alias lsusb   "system_profiler SPUSBDataType"

else if [ "$OS_TYPE" = "Linux" ] # GNU/Linux

    if command -s viewnior > /dev/null
        alias display "viewnior"
    else if command -s eog > /dev/null
        alias display "eog"
    end

end

# --- GPG Agent ----------------------------------------------------------------

start_gpg_agent

# ---  Fleetctl  ---------------------------------------------------------------

if test -e $HOME/.fleetctl/host # Check for a remote fleetctl host configuration
    set -gx FLEETCTL_TUNNEL (cat $HOME/.fleetctl/host)
end

# ---  Golang  -----------------------------------------------------------------

if test -d /usr/local/go
    set -gx GOROOT /usr/local/go
    set -gx PATH   $PATH $GOROOT/bin
end

if test -d $HOME/Projects/Go
    set -gx GOPATH $HOME/Projects/Go
    set -gx PATH   $PATH $GOPATH/bin
else if test -d $HOME/projects/Go
    set -gx GOPATH $HOME/projects/Go
    set -gx PATH   $PATH $GOPATH/bin
end

# ---  Python for MacOSX  ------------------------------------------------------

if test -d /Users/orax/Library/Python/3.5/bin/
    # Add local Python 3 path on OS X
   set -gx PATH $PATH /Users/orax/Library/Python/3.5/bin/
end

if test -d /Users/orax/Library/Python/2.7/bin/
    # Add local Python 2 path on OS X
   set -gx PATH $PATH /Users/orax/Library/Python/2.7/bin/
end

# ---  FishLine  ---------------------------------------------------------------

if test -f "$XDG_CONFIG_HOME/fish/fishline/fishline.fish"

    set FLINE_PATH "$XDG_CONFIG_HOME/fish/fishline"
    source $FLINE_PATH/fishline.fish

    if test -f "$XDG_CONFIG_HOME/fish/fishline-theme.fish"
        source $XDG_CONFIG_HOME/fish/fishline-theme.fish
    end

    if [ "$OS_TYPE" = "Linux" ]; and tty | grep tty > /dev/null
        source $FLINE_PATH/themes/git_minimal.fish
        source $FLINE_PATH/themes/tty.fish
    end

end

# ---  VirtualFish  ------------------------------------------------------------

if test -f "$XDG_CONFIG_HOME/fish/virtualfish/virtualfish/virtual.fish"

    source $XDG_CONFIG_HOME/fish/virtualfish/virtualfish/virtual.fish
    emit virtualfish_did_setup_plugins

    set -gx VIRTUALFISH_DEFAULT_PYTHON "python3"
    set -gx VIRTUALFISH_HOME           "$HOME/.virtualenvs"

end

# ---  Z  ----------------------------------------------------------------------

set -gx Z_DATA $XDG_DATA_HOME/z.db

# ---  Fish-BD  ----------------------------------------------------------------

set -gx BD_OPT 'insensitive'

# ---  Narwhal  ----------------------------------------------------------------

alias docker  'narwhal'

# ---  Fisherman ---------------------------------------------------------------

if test -d $XDG_DATA_HOME/fisherman
    set -gx fisher_home   $XDG_DATA_HOME/fisherman
    set -gx fisher_config $XDG_CONFIG_HOME/fisherman
    source $fisher_home/config.fish
end

# ---  END  --------------------------------------------------------------------
