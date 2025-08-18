{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    vscode
  ];
}
