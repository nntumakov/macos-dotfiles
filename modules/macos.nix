{...}: let
  user = "tumakovnikolaj";
in {
  system.defaults = {
    dock = {
      autohide = false;
      show-recents = false;
      showhidden = false;
      static-only = false;
      persistent-apps = [
        "/Users/${user}/Applications/Home Manager Apps/Visual Studio Code.app"
        "/System/Applications/Notes.app"
        "/System/Applications/Calendar.app"
        "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
        "/Users/${user}/Applications/Home Manager Apps/Telegram.app"
        "/System/Applications/Utilities/Terminal.app"
        "/Users/${user}/Applications/Home Manager Apps/Obsidian.app"
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
}