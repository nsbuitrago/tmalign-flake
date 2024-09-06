{
  description =
    "TM-align: Sequence independent protein structure comparisons.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;

      forAllSystems = systems: buildPackages:
        lib.genAttrs systems (system:
        buildPackages nixpkgs.legacyPackages.${system});

      buildPackages = systems: packageOverrides:
        forAllSystems systems (pkgs:
          builtins.mapAttrs
            (_: pkgs.callPackage ./package.nix)
            (packageOverrides pkgs));

      linuxPackages = buildPackages lib.platforms.linux (pkgs: {
        default = { };
      });
    in
    {
      packages = linuxPackages;
    };
}
