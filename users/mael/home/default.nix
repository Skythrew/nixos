{ config, lib, pkgs, ... }:

{
  imports = [ ./gnome ./dev ];

  home.packages = with pkgs; [
    youtube-music
    discord
  ];

  home.stateVersion = "24.11";
}
