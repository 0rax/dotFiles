#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

# ------------------------------------------------------------------------------
# ---  System  -----------------------------------------------------------------
# ------------------------------------------------------------------------------

# ---  System/Environment Variables  -------------------------------------------

set -gx XDG_CONFIG_HOME  $HOME/.config
set -gx XDG_DATA_HOME    $HOME/.data
set -gx OS_TYPE          (uname)
set -gx MINIMAL_SHELL    false
if [ "$TERM_PROGRAM" = "Terminal-Plus" ]
    set MINIMAL_SHELL true
else if [ "$OS_TYPE" != "Darwin" ]; and tty | grep tty > /dev/null
    set MINIMAL_SHELL true
end

# ---  System/Editor & Pager  --------------------------------------------------

set -gx EDITOR           'vim'
set -gx GIT_EDITOR       'vim'
set -gx ALTERNATE_EDITOR 'nano'

if command -s most > /dev/null
    set -gx MANPAGER     'most'
    set -gx PAGER        'most'
end

# ---  System/Fish Related Path  -----------------------------------------------

set -gx FISH_CONFIG_PATH $XDG_CONFIG_HOME/fish
set -gx FISH_PLUGIN_PATH $FISH_CONFIG_PATH/plugins
set -gx FISH_CONFD_PATH  $FISH_CONFIG_PATH/conf.d

# ------------------------------------------------------------------------------
# ---  END  --------------------------------------------------------------------
# ------------------------------------------------------------------------------
