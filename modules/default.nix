let
  user = "tumakovnikolaj";
in
  {pkgs, ...}: {
    imports = [
      ./social.nix
      ./code.nix
      ./dev.nix
      ./db.nix

      ./home.nix

      ./macos.nix
      ./brew.nix

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

    services.nix-daemon.enable = true;

    programs.zsh.enable = true;

    users.users.${user} = {
      name = user;
      home = "/Users/${user}";
    };

    fonts = {
      packages = with pkgs; [
        jetbrains-mono
        meslo-lgs-nf
        monaspace
      ];
    };
  }
