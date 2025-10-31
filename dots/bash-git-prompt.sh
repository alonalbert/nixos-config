#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

source ~/.bash-prompt-constants
PROMPT_DIRTRIM=2

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
export PS1="[$Blue$Time$Color_Off] ($Host)"'$(git branch &>/dev/null; \
  if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" &> /dev/null; \
      if [ "$?" -eq "0" ]; then \
      # @4 - Clean repository - nothing to commit
      echo "'$Green'"$(__git_ps1 " (%s)"); \
    else \
      # @5 - Changes to working tree
      echo "'$IRed'"$(__git_ps1 " {%s}"); \
    fi) '$Black$PathFull$Color_Off'\$ "; \
  else \
    # @2 - Prompt when not in GIT repo
    echo " '$Black$PathFull$Color_Off'\$ "; \
  fi)'

