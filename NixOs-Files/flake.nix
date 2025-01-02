{

  description = "My first flake";

  input = {
  
    #nixpkgs = {
    #  url = "github:NixOs/nixpkgs/nixos-23.05";
    #};
    # Insted this: do..
    #nixpkgs.url = "github:NixOs/nixpkgs/nixos-23.05";
    #  OR
    nixpkgs.url = "NixOs/nixpkgs/nixos-24.05";
    #  OR
    #nixpkgs.url = "NixOs/nipkgs/nixos-unstable"; 

  };

  outputs = { self, nixpkgs, ... }:
    let 
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      warehouse = lib.nixosSystem {
        system = "x86_64-linux";
        moduls = [ ./configuration.nix ];
      };
    };
  };

}
