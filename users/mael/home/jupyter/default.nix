{ config, lib, pkgs, ...}:
{
  home.packages = with pkgs; [
    jupyter
    python312Packages.jupyter-book
    texliveFull
    pandoc
  ];
}
