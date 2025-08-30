{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
