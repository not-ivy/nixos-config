{
  description = "do you want to build a snowman";

  inputs = {
    nixpkgs.url =                            "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url =                       "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows =    "nixpkgs";
    impermanence.url =                       "github:nix-community/impermanence";
  };

  outputs = { nixpkgs, home-manager, impermanence, ... }@inputs: {
    nixosConfigurations = {
      remorse = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      "nora@remorse" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./homes/nora.nix ];
      };
    };
  };
}
