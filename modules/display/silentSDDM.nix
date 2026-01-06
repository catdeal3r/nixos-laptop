{ pkgs, inputs, ... }: let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    theme = "default";
    
    theme-overrides = {
      "LoginScreen" = {
         use-background-color = true;
      };
      "LockScreen" = {
         use-background-color = true;
      }; 
    };
  };
in
{
  environment.systemPackages = [ sddm-theme sddm-theme.test ];

  qt.enable = true;

  services.displayManager.sddm = {
    #package = pkgs.kdePackages.sddm;
    enable = true;
    wayland.enable = true;
    theme = sddm-theme.pname;
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/theme/${sddm-theme.pname}/component/,QT_IM__MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };
}
