{ pkgs, inputs, config, ... }:


let

  pkgs-stable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

in
{

  imports = [
    ./quickshell.nix
    ./flatpak.nix
  ];
  
  environment.systemPackages = with pkgs; [
    vim
    wget
    tmux
    git
    gh
    fastfetch
    tree
    fish
    flatpak
    krita
    gimp
    opentabletdriver
    mpv
    ffmpeg
    zoxide
    yazi
    tldr
    cbonsai
    playerctl
    firefox
    udisks
    geany
    feh
    cava
    mlocate
    gvfs
    libgcc
    gnat15
    raylib
    libGL
    vlc
    htop
    vscodium
    libreoffice
    ungoogled-chromium
    libinput
    gnome-text-editor
    unzip
    gnome-extension-manager
    commit-mono
    orchis-theme
    stow
    helix  
    pkg-config
    jq
    power-profiles-daemon
    gparted
    pandoc
    texliveTeTeX
    fox
    tty-clock
    waybar
    imagemagick
    ueberzugpp
    clipman
    python313
    python313Packages.pip
    viewnior
    ghidra
    gdb
    glow
    dnsmasq
    equibop
    xsel
    ngrok
    php
    openvpn
    lunar-client
    prismlauncher
    gnome-calculator
    gnome-clocks
    sherlock-launcher
    proxychains
    fuse3
    btop
    godot
    reaper
    vital
    helm
    stirling-pdf
    #inputs.prism-cracked.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.idescriptor.packages.${pkgs.stdenv.hostPlatform.system}.default
    #inputs.legacyLauncher.packages.${pkgs.stdenv.hostPlatform.system}.legacylauncher
    kdePackages.kdenlive
    ifuse
    libimobiledevice
    yt-dlp
    davinci-resolve
    moonlight-qt
    sunshine
    safeeyes
    tailscale 
    samba4Full
    cifs-utils
    nuclear
    docker
    pwgen
    tor-browser
    nodejs_25
    element-desktop
  ];
  
  services.tailscale.enable = true;
  
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.avahi.enable = true;
  services.usbmuxd.enable = true;
  services.usbmuxd.package = pkgs.usbmuxd2;

  virtualisation.libvirtd.enable = true;

  users.groups.libvirtd.members = [ "catdealer" ];
  users.groups.kvm.members = [ "catdealer" ];

  fonts.packages = with pkgs; [
    minecraftia
  ];
}
