{ config, pkgs, ... }:

{
  imports = [
    ../common
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    geary
    epiphany
    gnome-music
    gnome-user-docs
    yelp
  ] ++ lib.optional (!config.camera.enable) snapshot;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
  ];

  home-manager.sharedModules = [
    {
      dconf = {
        enable = true;
        settings = {
          "org/gnome/shell" = {
            enabled-extensions = [
              pkgs.gnomeExtensions.appindicator.extensionUuid
            ];
            disabled-extensions = [];
            favorite-apps = [
              "firefox.desktop"
              "thunderbird.desktop"
              "vesktop.desktop"
              "com.github.th_ch.youtube_music.desktop"
              "code.desktop"
              "steam.desktop"
              "org.gnome.Nautilus.desktop"
            ];
          };
        };
      };
    }
  ];
}
