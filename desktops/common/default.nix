{ config, pkgs, lib, ... }:

{
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;

  environment.systemPackages = with pkgs; [
    libreoffice-fresh
  ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
}
