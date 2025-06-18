{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
in {
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    i3
    rofi-wayland
    fuzzel
    arandr
    sxhkd
    stow
    picom
    stalonetray
    xdotool
    ydotool
    brightnessctl
    playerctl
    flameshot
    satty
    lxappearance
    nwg-look
    dunst
    feh
    btop
    htop
    neofetch
    cava
    mangohud
    trash-cli
    autojump
    tldr
    xclip
    tmux
    screenkey
    cmatrix
    lolcat
    gnome-boxes
    gnome-calculator
    gpick
    micro
    redshift
    sl
    x11vnc
    wayvnc
    polybar
    waybar
    eww
    ags
    libdbusmenu-gtk3
    hyprland
    hyprpaper
    hyprshot
    hyprpicker
    hyprlock
    hypridle
    hyprlandPlugins.hyprwinwrap
    hyprlandPlugins.hyprexpo
    swaybg
    swaylock
    # wpaperd
    swww
    mpvpaper
    waypaper
    mpv
    opentabletdriver
    wshowkeys
    awesome
    # bspwm
    wmctrl
    screenfetch
    alacritty
    kitty
    glava
    krusader
    ranger
    lf
    uxplay
    wlsunset
    wlogout
    wl-clipboard
    superTuxKart
    helix
    nil
    vlc
    fzf
    neovim
    nix-search-cli
    clonehero
    pavucontrol
    brave
    celeste64
    easyeffects
    # obs-studio
    parsec-bin
    # cura
    vesktop
    discord
    mupen64plus
    jamulus
    anki
    runelite
    audacity
    krita
    remmina
    qpwgraph
    synthesia
    plover.dev
    killall
    appimage-run
    pywal
    # python310Full
    (python311.withPackages(ps: with ps; [ pandas requests mido python-rtmidi pynput]))
    python3Packages.python-lsp-server
    jdk17
    jdt-language-server
    dbus
    alsa-utils
    cifs-utils
    xorg.xf86inputsynaptics
    xorg.xeyes
    # xorg.xf86videodummy
    # xorg.xinit
    pulseaudioFull
    mplayer
    mint-themes
    mint-y-icons
    autotiling
    # xarchive - https://search.nixos.org/packages?channel=unstable&show=xarchive&from=0&size=50&sort=relevance&type=packages&query=xarchive
    xarchiver
    arrpc
    glxinfo
    # input-leap
    ffmpeg
    # osu-lazer-bin
    libnotify
    linux-wallpaperengine
    jq
    slurp
    grim
    xfce.xfce4-whiskermenu-plugin
    pistol
    file
    # davinci-resolve
    # sunshine
    # pywalfox-native
    asciiquarium
    discover-overlay
    kdePackages.plasma-browser-integration
    w3m
    cool-retro-term
    altserver-linux
    yt-dlp
    unstable.lunar-client
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
    rclone
    rclone-browser
    bottles
    musescore
    # stylish
    kdePackages.kdenlive
    kdePackages.kdeconnect-kde
    glaxnimate
    barrier
    fastfetch
    retroarch
    qrencode
    tetrio-desktop
    v4l-utils
    peaclock
    space-cadet-pinball
    spotify-player
    protontricks
    ripgrep
    unstable.spicetify-cli
    spotube
    xwinwrap
    swaynotificationcenter
    ncpamixer
    win2xcur
    gimp-with-plugins
    warpd
    wl-kbptr
    wlrctl
    unstable.moonlight-qt
    kanjidraw
    qalculate-qt
    qalculate-gtk
    unstable.scrcpy
    qtscrcpy
    dolphin-emu
    beeper
    keepassxc
    kando
    # nvidia_x11
    libvdpau
    vdpauinfo
    localsend
    remnote
    gamemode
    xwayland-satellite
  ];
}
