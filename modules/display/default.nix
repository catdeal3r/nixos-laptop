{ pkgs, ... }:

{
  imports = [
    ./silentSDDM.nix
    ./kde.nix
    ./niri.nix
  ];
}
