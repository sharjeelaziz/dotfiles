# If you come from bash you might have to change your $PATH.
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:$PATH

# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

#set history size
export HISTSIZE=10000

#save history after logout
export SAVEHIST=10000

#history file
export HISTFILE=~/.zhistory

#append into history file
setopt INC_APPEND_HISTORY

#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS

#add timestamp for each entry
setopt EXTENDED_HISTORY 

eval "$(starship init zsh)"

# If a ~/.zshrc.local exists, source it
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
