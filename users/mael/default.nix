{ config, pkgs, ... }:

{
  home-manager.users.mael = import ./home.nix;
  users.users.mael.extraGroups = [ "docker" "disk" "scanner" "lp" ];
}
