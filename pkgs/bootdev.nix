{ pkgs, lib, buildGoModule, fetchFromGitHub, ...}: 
  buildGoModule rec {
    pname = "bootdev";
    version = "1.20.3";

    src = fetchFromGitHub {
      owner = "bootdotdev";
      repo = "bootdev";
      rev = "v${version}";
      sha256 = "sha256-vjWlD31NCWCtcmhwh+DCjXZHE12VZxj+PdIQx/A6tOY=";
    };

    vendorHash = "sha256-jhRoPXgfntDauInD+F7koCaJlX4XDj+jQSe/uEEYIMM=";
  }
