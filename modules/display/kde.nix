{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    kate
    ark
    elisa
    discover
  ];
  
  environment.systemPackages = with pkgs; [
    libsForQt5.qtmultimedia # Or qt6.qtmultimedia
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
  ];
  
  environment.variables = {
    QT_MEDIA_BACKEND = "gstreamer";
  };
}
