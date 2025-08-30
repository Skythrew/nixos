{ config, lib, pkgs, ... }:

let
  sane-mscan = pkgs.stdenv.mkDerivation {
        name = "sane-mscan";
        version = "1.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "Skythrew";
          repo = "sane_mscan";
          rev = "1.0.0";
          hash = "sha256-wpnlOw/PBYJmOYqSVYUa2DXUOp6p5j9tljCt/Wzt/Cs=";
        };

        buildInputs = [ pkgs.sane-backends ];

        installPhase = ''
          mkdir -p $out/lib/sane/
          cp libsane-mscan.so.1 $out/lib/sane/

          mkdir -p $out/etc/sane.d/dll.d/
          echo "mscan" >> $out/etc/sane.d/dll.d/mscan.conf
        '';
      };
in
{
  options.camera = {
    enable = lib.mkEnableOption "Enable or disable the camera module.";
  };

  imports = [
    ../../pkgs/firefox
    ../../pkgs/thunderbird
  ];

  config = {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    services.xserver.excludePackages = with pkgs; [
      xterm
    ];

    environment.systemPackages = with pkgs; [
      fastfetch
      vesktop
      youtube-music
      libreoffice
      hunspell
      hunspellDicts.fr-moderne
    ];

    # environment.pathsToLink = [ "share/hunspell" ];

    # Enable CUPS to print documents.
    services.printing.enable = true;
    services.printing.drivers = with pkgs; [ gutenprint cups-bjnp ];

    # Enable scanners
    hardware.sane.enable = true;
    hardware.sane.extraBackends = [ sane-mscan ];

    # Add sg kernel module (needed for MSCAN scanner)
    boot.kernelModules = [ "sg" ];

    # Open ports for BJNP protocol
    networking.firewall.allowedTCPPorts = [ 8611 ];
    networking.firewall.allowedUDPPorts = [ 8611 ];

    services.flatpak.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
