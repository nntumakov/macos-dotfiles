{
  description = "Darwin Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }:

    {
      darwinConfigurations.MacBook-Air-Tumakov = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.darwinModules.home-manager
          ./modules
        ];
      };

      # darwinPackages = self.darwinConfigurations."mini".pkgs;
    };
}
