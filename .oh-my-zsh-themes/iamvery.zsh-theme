# IAMVERY - a modified version of Steve Eley's CRUNCH
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine, 
# and eschews the standard space-consuming user and hostname info.  Instead, only the 
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
#
# Colors are at the top so you can mess with those separately if you like.

CRUNCH_BRACKET_COLOR="%{$fg[white]%}"
CRUNCH_PROMPT_COLOR="%{$fg[yellow]%}"
CRUNCH_RVM_COLOR="%{$fg[magenta]%}"
CRUNCH_DIR_COLOR="%{$fg[green]%}"
CRUNCH_GIT_COLOR="%{$fg[cyan]%}"
CRUNCH_GIT_BRANCH_COLOR="%{$fg[blue]%}"
CRUNCH_GIT_CLEAN_COLOR="%{$fg[green]%}"
CRUNCH_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$CRUNCH_BRACKET_COLOR"["$CRUNCH_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="$CRUNCH_BRACKET_COLOR]"
ZSH_THEME_GIT_PROMPT_CLEAN=" $CRUNCH_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $CRUNCH_GIT_DIRTY_COLOR✗"

# Our elements:
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  CRUNCH_RVM_="$CRUNCH_BRACKET_COLOR"["$CRUNCH_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$CRUNCH_BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    CRUNCH_RVM_="$CRUNCH_BRACKET_COLOR"["$CRUNCH_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$CRUNCH_BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
CRUNCH_GIT_="$CRUNCH_GIT_COLOR\$(git_prompt_info) "
CRUNCH_PROMPT="$CRUNCH_PROMPT_COLOR%# "
CRUNCH_DIR_="$CRUNCH_DIR_COLOR%~"

# Put it all together!
PROMPT="$CRUNCH_GIT_$CRUNCH_PROMPT%{$reset_color%}"
RPROMPT="$CRUNCH_DIR_ $CRUNCH_RVM_%{$reset_color%}"
