{pkgs, ...}: {
  bootdev = pkgs.callPackage ./bootdev.nix {};
}

