{ config, pkgs, lib, ... }:

{
  boot.kernelPatches = [
    {
      name = "usb-storage Novatek";
      patch = ../../kernel/usb-storage.patch;
    }
  ];

  environment.systemPackages = with pkgs; [
    git
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
