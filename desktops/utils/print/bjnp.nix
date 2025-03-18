{ config, lib, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  networking.firewall.allowedTCPPorts = [ 8611 ];
  networking.firewall.allowedUDPPorts = [ 8611 ];

  services.printing.drivers = with pkgs; [
    gutenprint
    cups-bjnp
  ];
}
