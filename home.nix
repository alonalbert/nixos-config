{ config, pkgs, ... }:

{
  home = {
    file.".bashrc" = { source = ./dots/bashrc.sh; };
    file.".bash_profile" = { source = ./dots/bash_profile.sh; };
  };

  # Make sure to set this. It's for state versioning.
  home.stateVersion = "25.11"; # Or your current NixOS version
}