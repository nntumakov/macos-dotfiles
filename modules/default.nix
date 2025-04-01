let
  user = "tumakovnikolaj";
in
  {...}: {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };
      hostPlatform = "aarch64-darwin";
    };

    imports = [
      ./brew.nix
      ./code.nix
      ./db.nix
      ./dev.nix
      ./home.nix
      ./macos.nix
      ./media.nix
      ./zsh
    ];

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
