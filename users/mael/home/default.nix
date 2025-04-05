{ config, pkgs, ... }:

{
  imports = [ ./gnome ./dev ./jupyter ];

  home.packages = with pkgs; [
    youtube-music
    discord
  ];

  home.stateVersion = "24.11";
}
