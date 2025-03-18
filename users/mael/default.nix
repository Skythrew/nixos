{ config, pkgs, lib, ... }:

{
  users.users.mael = {
    isNormalUser = true;
    description = "Maël";
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
  };

  home-manager.users.mael = import ./home;
}
