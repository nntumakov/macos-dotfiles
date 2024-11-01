{
    config,
    pkgs,
    ...
}: 
{
    system.defaults = {
        dock = {
            autohide  = false;
            show-recents = false;
            showhidden = false;
            static-only = false;
            persistent-apps = [
                "${pkgs.vscode}/Applications/Visual Studio Code.app"
                "/System/Applications/Notes.app"
                "/System/Applications/Calendar.app"
                "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
                "${pkgs.telegram-desktop}/Applications/Telegram.app"
                "${pkgs.obsidian}/Applications/Obsidian.app"
                "/System/Applications/Utilities/Terminal.app"
                /System/Applications/Launchpad.app
            ];
            magnification = true;
        };

        finder = {
            FXPreferredViewStyle = "clmv";
            ShowPathbar = true;
        };

        loginwindow = {
            GuestEnabled  = false;
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

    nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = "aarch64-darwin";
    };

    system = {
        configurationRevision = null;
        stateVersion = 4;
    };

    nix.settings.experimental-features = "nix-command flakes";

    services.nix-daemon.enable = true;

    programs.zsh.enable = true;
}