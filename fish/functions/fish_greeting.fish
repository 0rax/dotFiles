#!/usr/bin/env fish
# -*-  mode:fish; tab─width:4  -*-

#
#       ╱ ╲
# ┌───╱     ╲ ───┐ user@hostname
# │ ╱ ╲     ╱ ╲  │ OS ..... OS Type & Release
# ╱     ╲ ╱     ╲  Kernel . Kernel Type
# ╲     ╱ ╲     ╱  Arch ... CPU Architecture
# │ ╲ ╱     ╲ ╱  │ CPU .... Number of CPU cores
# └───╲     ╱ ───┘ Load ... Load Average
#       ╲ ╱
#

function fish_greeting

    alias _s "set_color 16c"
    alias _t "set_color cb410b"
    alias _i "set_color fa1"
    alias _n "set_color normal"

    set -l OS
    set -l LOAD
    set -l CPU
    set -l GPG_AGENT_PID
    set -l GPG_AGENT_ALIVE
    set -l SSH_AGENT_ALIVE

    if test -f /etc/os-release
        set OS (cat /etc/os-release | sed -nE 's/^PRETTY_NAME="(.*)"$/\1/p')
        set LOAD (cat /proc/loadavg | cut -d " " -f1-3)
        set CPU (cat /proc/cpuinfo | grep -E '^processor\s+:' | wc -l)
    else if command -s lsb_release > /dev/null
        set OS (lsb_release)
        set LOAD (cat /proc/loadavg | cut -d " " -f1-3)
        set CPU (cat /proc/cpuinfo | grep -E '^processor\s+:' | wc -l)
    else if command -s sw_vers > /dev/null
        set OS 'Mac OS X' (sw_vers -productVersion)
        set LOAD (sysctl -n vm.loadavg | cut -d" " -f2-4)
        set CPU (sysctl -a machdep.cpu.thread_count | cut -d' ' -f2)
    else
        set OS 'Unknown'
        set CPU '?'
        set LOAD '? ? ?'
    end

    if set -q GPG_AGENT_INFO
        set GPG_AGENT_PID (echo $GPG_AGENT_INFO | cut -d':' -f2)
        if kill -0 "$GPG_AGENT_PID" ^ /dev/null
            set GPG_AGENT_ALIVE true
        else
            set -ge GPG_AGENT_INFO
            set -le GPG_AGENT_PID
        end
    end
    if set -q SSH_AGENT_PID; and kill -0 "$SSH_AGENT_PID" ^ /dev/null
        set SSH_AGENT_ALIVE true
    else
        set -ge SSH_AGENT_PID
        set -ge SSH_AUTH_SOCK
    end

    echo (_n)
    echo (_t)'       ╱ ╲        '             (_i)
    echo (_s)' ┌───'(_t)'╱     ╲ '(_s)'───┐ ' (_i)$USER(_s)@(_t)(hostname)
    echo (_s)' │ '(_i)'╱ ╲     ╱ ╲  '(_s)'│ ' (_i)'OS '(_s).....(_t) $OS
    echo (_i)' ╱     ╲ ╱     ╲  '             (_i)'Kernel '(_s).(_t) (uname -rs)
    echo (_i)' ╲     ╱ ╲     ╱  '             (_i)'Arch '(_s)...(_t) (uname -m)
    echo (_s)' │ '(_i)'╲ ╱     ╲ ╱  '(_s)'│ ' (_i)'CPU '(_s)....(_t) "$CPU core(s)"
    echo (_s)' └───'(_t)'╲     ╱ '(_s)'───┘ ' (_i)'Load '(_s)...(_t) $LOAD
    echo (_t)'       ╲ ╱        '             (_i)
    echo (_n)
    if [ "$GPG_AGENT_PID" != "" -a "$GPG_AGENT_PID" = "$SSH_AGENT_PID" ]
        echo (_i)' GPG Agent PID '(_s)...(_t) $GPG_AGENT_PID(_s)' (with SSH Agent)'
    else if [ "$GPG_AGENT_PID" != "" ]
        echo (_i)' GPG Agent PID '(_s)...(_t) $GPG_AGENT_PID
    end
    if [ "$SSH_AGENT_PID" != "" -a "$SSH_AGENT_PID" != "$GPG_AGENT_PID" ]
        set AGENT_PRESENT true
        echo (_i)' SSH Agent PID '(_s)...(_t) $SSH_AGENT_PID
    end
    if test "$SSH_AGENT_ALIVE"
        for i in (ssh-add -l ^ /dev/null | cut -d" " -f3)
            echo (_i)'  > Known ID '(_s).....(_t)' '$i
        end
    end
    if test "$SSH_AGENT_ALIVE" -o "$GPG_AGENT_ALIVE"
        echo
    end

end
