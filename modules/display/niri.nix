{ pkgs, inputs, ... }:

{

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
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

  programs.dconf.enable = true;
  
  fonts.packages = with pkgs; [
    material-symbols
    material-icons
    nerd-fonts.hack
    roboto
    inter
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro
    inputs.product-sans-font.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
