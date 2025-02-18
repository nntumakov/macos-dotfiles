{...}: let
  user = "tumakovnikolaj";
in {
  system.defaults = {
    dock = {
      autohide = false;
      show-recents = true;
      showhidden = false;
      static-only = false;
      persistent-apps = [
        "/Applications/ChatGPT.app"
        "/Users/${user}/Applications/Home Manager Apps/Visual Studio Code.app"
        "/System/Applications/Notes.app"
        "/System/Applications/Calendar.app"
        "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
        "/Applications/Thunderbird.app"
        "/Applications/Telegram.app"
        "/Applications/Logseq.app"
        "/Applications/Obsidian.app"
        "/Applications/Alacritty.app"
        "/System/Applications/Launchpad.app"
      ];
      magnification = true;
      tilesize = 48;
      orientation = "left";
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
