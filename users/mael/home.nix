{ config, pkgs, lib, ... }:

{
  home.username = "mael";
  home.homeDirectory = "/home/mael";

  home.packages = with pkgs; [
    gh
  ];

  home.stateVersion = "25.05";
}
