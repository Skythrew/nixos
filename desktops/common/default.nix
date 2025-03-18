{ config, pkgs, lib, ... }:

{
  programs.thunderbird.enable = true;

  environment.systemPackages = with pkgs; [
    brave
    libreoffice-fresh
  ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
}
