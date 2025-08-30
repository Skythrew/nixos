{ config, pkgs, lib, ... }:

{
  home.username = "mael";
  home.homeDirectory = "/home/mael";

  home.packages = with pkgs; [
    gh
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "application/pdf" = [ "org.gnome.Evince.desktop" "org.gnome.Papers.desktop" ];
    };
  };

  home.stateVersion = "25.05";
}
