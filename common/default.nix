{ pkgs, inputs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.xserver.xkb.layout = "fr";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
    helix
  ];

  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}

