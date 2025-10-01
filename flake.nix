{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
    all = nixpkgs.lib.genAttrs systems;
 in  {

    devShells = all (sys: let
      pkgs = nixpkgs.legacyPackages.${sys};
    in {
      default = pkgs.mkShell {
        packages = builtins.attrValues {inherit (pkgs) nil git gh alejandra ripgrep fzf tree python313;
        inherit (pkgs.python313Packages) uv pygame ruff python-lsp-server;
        cli = pkgs.callPackage ./pkgs/bootdev.nix {};
      };
      };
     });

        packages = all (sys: import ./pkgs {pkgs = nixpkgs.legacyPackages.${sys};});    

  };
}

