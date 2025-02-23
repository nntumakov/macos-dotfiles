let
  user = "tumakovnikolaj";
in
  {
    lib,
    options,
    ...
  }: {
    imports = [
      {
        options = {
          hm = lib.mkOption {
            type = options.home-manager.users.type.nestedTypes.elemType;
            default = {};
          };
        };

        config = {
          home-manager.users.${user} = lib.mkAliasDefinitions options.hm;
        };
      }
    ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${user} = {
      programs.home-manager.enable = true;
      home = {
        stateVersion = "24.11";
        username = user;
        homeDirectory = "/Users/${user}";
      };
    };
  }
