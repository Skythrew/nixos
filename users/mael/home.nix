{ config, pkgs, lib, ... }:

{
  home.username = "mael";
  home.homeDirectory = "/home/mael";

  programs.git = {
    enable = true;
    userName = "Mael GUERIN";
    userEmail = "mael.guerin@murena.io";
  };

  home.packages = with pkgs; [
    gh
  ];

  home.stateVersion = "25.05";
}
