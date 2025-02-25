let
  user = "tumakovnikolaj";
in
  {...}: {
    imports = [
      ./brew.nix
      ./code.nix
      ./db.nix
      ./dev.nix
      ./home.nix
      ./macos.nix
      ./utils.nix
      ./zsh
    ];

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
      hostPlatform = "aarch64-darwin";
    };

    system = {
      configurationRevision = null;
      stateVersion = 5;
    };

    nix.settings.experimental-features = "nix-command flakes";

    users.users.${user} = {
      name = user;
      home = "/Users/${user}";
    };
  }
