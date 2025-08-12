{ config, pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;
    policies = {
      Preferences = {
        "intl.locale.requested" = "fr,en-US";
      };
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "langpack-fr@thunderbird.mozilla.org" = {
          install_url = "https://archive.mozilla.org/pub/thunderbird/releases/${pkgs.thunderbird.version}/linux-x86_64/xpi/fr.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
