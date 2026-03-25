{ pkgs, ... }:

{
  imports = [
    ./silentSDDM.nix
    ./niri.nix
    ./kde.nix
  ];
}
