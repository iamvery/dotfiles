# IAMVERY - a modified version of Steve Eley's CRUNCH
# (https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/crunch.zsh-theme)
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine, 
# and eschews the standard space-consuming user and hostname info. Instead, only the 
# things that vary in my own workflow are shown:
#
# * The Git branch and its 'dirty' state
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
#
# Colors are at the top so you can mess with those separately if you like.

IAMVERY_BRACKET_COLOR="%{$fg[white]%}"
IAMVERY_PROMPT_COLOR="%{$fg[yellow]%}"
IAMVERY_RVM_COLOR="%{$fg[magenta]%}"
IAMVERY_DIR_COLOR="%{$fg[green]%}"
IAMVERY_GIT_COLOR="%{$fg[cyan]%}"
IAMVERY_GIT_BRANCH_COLOR="%{$fg[blue]%}"
IAMVERY_GIT_CLEAN_COLOR="%{$fg[green]%}"
IAMVERY_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$IAMVERY_BRACKET_COLOR"["$IAMVERY_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="$IAMVERY_BRACKET_COLOR]"
ZSH_THEME_GIT_PROMPT_CLEAN=" $IAMVERY_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $IAMVERY_GIT_DIRTY_COLOR✗"

# Our elements:
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  IAMVERY_RVM_="$IAMVERY_BRACKET_COLOR"["$IAMVERY_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$CRUNCH_BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    IAMVERY_RVM_="$IAMVERY_BRACKET_COLOR"["$IAMVERY_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$CRUNCH_BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
IAMVERY_GIT_="$IAMVERY_GIT_COLOR\$(git_prompt_info) "
IAMVERY_PROMPT="$IAMVERY_PROMPT_COLOR» "
IAMVERY_DIR_="$IAMVERY_DIR_COLOR%~"

# Put it all together!
PROMPT="$IAMVERY_GIT_$IAMVERY_PROMPT%{$reset_color%}"
RPROMPT="$IAMVERY_DIR_ $IAMVERY_RVM_%{$reset_color%}"
