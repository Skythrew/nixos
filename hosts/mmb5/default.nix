# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../desktops/gnome
      ../../desktops/utils/print/bjnp.nix
      ../../users/mael
      ../../desktops/utils/gaming
    ];

  environment.gnome.excludePackages = with pkgs; [
    snapshot
  ];

  networking.hostName = "mmb5"; # Define your hostname.

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  system.stateVersion = "24.11";
}

