{ pkgs, ... }:

{
  imports = [
    ./home.nix
  ];  

  users.users.catdealer = {
    isNormalUser = true;
    description = "catdeal3r";
    initialPassword = "12345";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      gnome-themes-extra
      adwaita-icon-theme
      xdg-user-dirs
      tela-circle-icon-theme
    ];
  };
  
  programs.fish.enable = true;
  hardware.opentabletdriver = {
    enable = true;
    blacklistedKernelModules = [ "wacom" ];
  };

  system.userActivationScripts.clone-config = ''
    if [ ! -d "/home/catdealer/personaldots" ]; then
      git clone https://github.com/catdeal3r/personaldots /home/catdeal3r/personaldots
      stow -d /home/catdealer/personaldots -t /home/catdealer
    fi
  '';

  # polkit
  security.polkit.enable = true;
  
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
