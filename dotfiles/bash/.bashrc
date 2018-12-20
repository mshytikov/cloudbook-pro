# vim: filetype=sh

source ~/.bash_env && load_once || return 0

require  ~/.bash_lib
require  ~/.bash_completion

#require  ~/google-cloud-sdk/path.bash.inc

set -o vi

# History adjustments from http://goo.gl/wO8LQ
# Disable history trancation
HISTFILESIZE=-1
HISTSIZE=-1

# Write to history immediately without duplicates
HISTCONTROL=ignoreboth
shopt -s histappend

# Enable colors
CLICOLOR=1

# Set pager to less
PAGER=less
# Set default options for less
LESS="XSR"

# Make sure $HOSTNAME is set
test -z "${HOSTNAME}" && export HOSTNAME=$(hostname)

# Interactive Shells

# Shortening path
PROMPT_DIRTRIM=3

# Color naming
COLOR_NORMAL="\[\e[0m\]"
COLOR_BLACK="\[\e[0;30m\]"
COLOR_BLACK_BOLD="\[\e[1;30m\]"
COLOR_RED="\[\e[0;31m\]"
COLOR_RED_BOLD="\[\e[1;31m\]"
COLOR_GREEN="\[\e[0;32m\]"
COLOR_GREEN_BOLD="\[\e[1;32m\]"
COLOR_YELLOW="\[\e[0;33m\]"
COLOR_YELLOW_BOLD="\[\e[1;33m\]"
COLOR_BLUE="\[\e[0;34m\]"
COLOR_BLUE_BOLD="\[\e[1;34m\]"
COLOR_PURPLE="\[\e[0;35m\]"
COLOR_PURPLE_BOLD="\[\e[1;35m\]"
COLOR_CYAN="\[\e[0;36m\]"
COLOR_CYAN_BOLD="\[\e[1;36m\]"
COLOR_WHITE="\[\e[0;37m\]"
COLOR_WHITE_BOLD="\[\e[1;37m\]"

# Set promt
function update_ps1 {
  # Terminal title (execution/echoing embedded in $PS1)
  local ps1_term_title=""
  case $TERM in
    xterm*|rxvt*)
      ps1_term_title="\[\e]0;\W\a\]"
      ;;
  esac
  local ps1_user="\u"
  local ps1_hostname="\h"
  local ps1_workdir="\w"

  local ps1_git=""
  if [ "$(type -t __git_ps1)" = "function" ]; then
    local _git_ps1_output="$(__git_ps1 '%s')"
    if [ -n "${_git_ps1_output}" ]; then
      ps1_git="(${COLOR_GREEN}${_git_ps1_output}${COLOR_NORMAL})"
    fi
  fi

  ps1_user_blue="${COLOR_BLUE}${ps1_user}${COLOR_NORMAL}"

  PS1="${ps1_term_title}\n[${ps1_user_blue}]${ps1_git}\W# "
}
PROMPT_COMMAND="update_ps1; $PROMPT_COMMAND"
