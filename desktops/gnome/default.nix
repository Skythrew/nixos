{ config, pkgs, lib, ... }:

{
  imports = [
    ../common
  ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
  ];

  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  environment.gnome.excludePackages = with pkgs; [
    xterm
    gnome-tour
    epiphany
    geary
    gnome-user-docs
    yelp
  ];
}
