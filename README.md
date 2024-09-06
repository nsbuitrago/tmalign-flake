# Nix flake for TM-align.

## Install

Make sure you have Nix flakes enabled.

Intsall TMalign to user profile:

```bash
nix profile install github:nsbuitrago/tmalign-flake
```

Create a temporary shell with TMalign:

```bash
nix shell github:nsbuitrago/tmalign-flake
```

Use as an input to another flake:

```bash
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    tmalign.url = "github:nsbuitrago/tmalign-flake";
  };

  outputs = { nixpkgs, ollama, ... }:
    let
      tmalign = tmalign.packages.${system}.default;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # output attributes go here
    };
};
```

## License

Follows the license and disclaimer in the TM-align source. See [LICENSE](./LICENSE.md)

