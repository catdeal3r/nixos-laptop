{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;    
  };

  home-manager.users.catdealer = { pkgs, ... }: {

    # location dirs and mime types
    xdg = {
      userDirs = {
        enable = true;
        pictures = "/run/media/catdealer/Data/Pictures";
        documents = "/run/media/catdealer/Data/Documents";
        music = "/run/media/catdealer/Data/Music";
        videos = "/run/media/catdealer/Data/Videos";
      };

      mimeApps = {
        enable = true;
        
        defaultApplications = {
          "application/pdf" = [ "firefox.desktop" ];
          "text/html" = [ "firefox.desktop" ];
          "image/png" = [ "viewnior.desktop" ];
          "image/jpeg" = [ "viewnior.desktop" ];
          "image/svg" = [ "viewnior.desktop" ];
          "image/avif" = [ "viewnior.desktop" ];
          "image/webp" = [ "viewnior.desktop" ]; 
          "image/gif" = [ "viewnior.desktop" ];
          "image/tiff" = [ "viewnior.desktop" ];
          "text/markdown" = [ "md.obsidian.Obsidian.desktop" ];
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
          "application/x-gnome-saved-search" = [ "org.gnome.Nautilus.desktop" ]; 
        };
      };

      desktopEntries.firefox = {
        name = "Firefox";
        genericName = "Web Browser";
        comment = "Browse the internet";
        categories = [ "Network" "WebBrowser" ];
        icon = "firefox";
        mimeType = [ "text/html" "text/xml" "application/xhtml+xml" "application/vnd.mozilla.xul+xml" "x-scheme-handler/http" "x-scheme-handler/https" ];
        startupNotify = true;
        terminal = false;
        type = "Application";
        actions = {
          "NewWindow" = {
            exec = "firefox --new-window %U -P";
            name = "New Window";
          };
          "ProfileManager" = {
            exec = "firefox -P";
            name = "Profile Manager";
          };
          "NewPrivateWindow" = {
            exec = "firefox --private-window %U -P";
            name = "New Private Window";
          };
        };
        exec = "firefox --name firefox %U -P";
      };
    };

    gtk = {
      enable = true;
      
      iconTheme = {
        name = "Tela-circle";
        package = pkgs.tela-circle-icon-theme;
      };
      
      font = {
        name = "SF Pro Display";
        package = inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro;
      };

      cursorTheme = {
        name = "McMojave";
        package = inputs.mcmojave-cursor.packages.${pkgs.stdenv.hostPlatform.system}.default; 
      };

      #theme = {
      #  name = "Orchis-Grey-Dark";
      #  package = pkgs.orchis-theme.override { tweaks = [ "solid" "black" "macos" ]; };
      #};
    };
    
    home.pointerCursor = {
      enable = true;
      name = "McMojave";
      package = inputs.mcmojave-cursor.packages.${pkgs.stdenv.hostPlatform.system}.default;
      gtk.enable = true;
      x11.enable = true;
    };
   
    home.stateVersion = "25.05";
  };
}
