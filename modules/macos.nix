{
  config,
  pkgs,
  ...
}:
let
  user = "tumakovnikolaj";
in
{
  system.defaults = {
    dock = {
      autohide = false;
      show-recents = false;
      showhidden = false;
      static-only = false;
      persistent-apps = [
        "/Users/tumakovnikolaj/Applications/Home Manager Apps/Visual Studio Code.app"
        "/System/Applications/Notes.app"
        "/System/Applications/Calendar.app"
        "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
        "/Users/tumakovnikolaj/Applications/Home Manager Apps/Telegram.app"
        "/System/Applications/Utilities/Terminal.app"
        "/System/Applications/Launchpad.app"
      ];
      magnification = true;
    };

    finder = {
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
    };

    loginwindow = {
      GuestEnabled = false;
    };

    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };

    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyleSwitchesAutomatically = true;
      KeyRepeat = 2;
    };

    trackpad = {
      Clicking = true;
      Dragging = true;
    };
  };

  # system.activationScripts.applications.text =
  #   let
  #     env = pkgs.buildEnv {
  #       name = "system-applications";
  #       paths = config.environment.systemPackages;
  #       pathsToLink = "/Applications";
  #     };
  #   in
  #   pkgs.lib.mkForce ''
  #     echo "setting up /Applications..." >&2
  #     rm -rf /Applications/Nix\ Apps
  #     mkdir -p /Applications/Nix\ Apps
  #     find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
  #     while read src; do
  #       app_name=$(basename "$src")
  #       echo "copying $src" >&2
  #       ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
  #     done
  #   '';
}
