{ config, pkgs, ... }:

{
  home = {
    file.".bash-extras" = { source = ./dots/bash-extras.sh; };
    file.".bash-aliases" = { source = ./dots/bash-aliases.sh; };
    file.".bash-bindings" = { source = ./dots/bash-bindings.sh; };
    file.".bash-git-prompt" = { source = ./dots/bash-git-prompt.sh; };
    file.".bash-prompt-constants" = { source = ./dots/bash-prompt-constants.sh; };
  };

    programs.bash = {
    enable = true;

    initExtra = ''
      source "${pkgs.git}/share/git/contrib/completion/git-prompt.sh"
      source ~/.bash-extras
    '';
  };
  home.stateVersion = "25.11";
}