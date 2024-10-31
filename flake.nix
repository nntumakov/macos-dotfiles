{
    description = "Zenful Darwin Nix Configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs }:

    {
        darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
            modules = [
                system/conf.nix

                modules/system.nix
                modules/code.nix

                apps/dev.nix
                apps/social.nix
            ];
        };
        
        darwinPackages = self.darwinConfigurations."mini".pkgs;
    };
}
