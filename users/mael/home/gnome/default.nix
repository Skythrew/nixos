{ config, pkgs, lib, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    "org/gnome/desktop/interface" = {
        accent-color = "red";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file://" + ./wallpaper_light.png;
      picture-uri-dark = "file://" + ./wallpaper.png;
    };
    "org/gnome/shell" = {
      enabled-extensions = with pkgs; [
        gnomeExtensions.gsconnect.extensionUuid
        gnomeExtensions.caffeine.extensionUuid
        gnomeExtensions.appindicator.extensionUuid
      ];
      favorite-apps = [
        "brave-browser.desktop"
        "thunderbird.desktop"
        "discord.desktop"
        "code.desktop"
        "youtube-music.desktop"
        "steam.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
  };
}
