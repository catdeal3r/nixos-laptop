{ pkgs, inputs, config, ... }:


let

  pkgs-stable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

in
{

  imports = [
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
    feh
    cava
    mlocate
    gvfs
    libgcc
    gnat15
    raylib
    libGL
    htop
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
    tty-clock
    waybar
    imagemagick
    ueberzugpp
    clipman
    python313
    python313Packages.pip
    viewnior
    gdb
    glow
    dnsmasq
    equibop
    xsel
    php
    prismlauncher
    gnome-calculator
    gnome-clocks
    fuse3
    btop
    stirling-pdf
    #inputs.prism-cracked.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.idescriptor.packages.${pkgs.stdenv.hostPlatform.system}.default
    #inputs.legacyLauncher.packages.${pkgs.stdenv.hostPlatform.system}.legacylauncher
    ifuse
    libimobiledevice
    yt-dlp
    moonlight-qt
    sunshine
    safeeyes
    tailscale 
    #samba4Full
    cifs-utils
    docker
    pwgen
    tor-browser
    nodejs_25
    steam
    foot
    xwayland-satellite
    swaybg
    swayidle
    slurp
    grim
    wofi
    matugen
    nautilus
    libnotify
    wl-clipboard
    glib
    lxsession
    gtk3
    gtk4
    brightnessctl
    pulseaudio
    mpvpaper
    wf-recorder
    gammastep
    # fonts
    material-icons
    material-symbols
    nerd-fonts.hack
    roboto
    inter
    # try to fix gtk monke ass ahh file picker
    xdg-user-dirs-gtk
    xdg-desktop-portal-gtk
    gsettings-desktop-schemas
    dconf-editor
    dconf
  ];

  services.tailscale.enable = true;
  
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.avahi.enable = true;
  services.usbmuxd.enable = true;
  services.usbmuxd.package = pkgs.usbmuxd2;

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  users.groups.libvirtd.members = [ "catdealer" ];
  users.groups.kvm.members = [ "catdealer" ];

  fonts.packages = with pkgs; [
    minecraftia
    material-symbols
    material-icons
    nerd-fonts.hack
    roboto
    inter
    #inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro
    inputs.product-sans-font.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
