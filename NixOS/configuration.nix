# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Move parts of file to home directory
      /home/ginningolive/.config/nixos/packages.nix
      # /home/ginningolive/.config/nixos/obs.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-f7a4bf69-5f7f-488c-8085-cd488271417d".device = "/dev/disk/by-uuid/f7a4bf69-5f7f-488c-8085-cd488271417d";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

 i18n.inputMethod = {
   enabled = "fcitx5";
   fcitx5.addons = with pkgs; [
     fcitx5-mozc
     fcitx5-gtk
   ];
 };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable Desktop Environments.
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.startx.enable = true;
  # services.xserver.displayManager.ly.enable = false;
  services.xserver.desktopManager.xfce.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # Greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

    # fix camera battery issue
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
          };
        };
      };
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ginningolive = {
    isNormalUser = true;
    description = "GinningOlive";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Fonts - https://nixos.wiki/wiki/Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    # noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    siji
    # liberation_ttf
    # fira-code
    # fira-code-symbols
    # mplus-outline-fonts.githubRelease
    # dina-font
    # proggyfonts
  ];

  # OpenTabletDriver
  hardware.opentabletdriver.enable = true;
  # hardware.opentabletdriver.package = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.opentabletdriver.blacklistedKernelModules = [
  "hid-uclogic"
  "wacom"
];

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Nvidia
  # https://nixos.wiki/wiki/nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
        intel-compute-runtime
        rocmPackages.clr.icd
    ];
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:6:0:0";
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
};

  # Dconf
  programs.dconf.enable = true;

  # ZSH
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # users.users.ginningolive.shell = pkgs.zsh;
  # users.users.ginningolive.useDefaultShell = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  # Steam - https://nixos.wiki/wiki/Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Polkit
  security.polkit.enable = true;

  # For OBS Virtual Camera
  # subject.isInGroup("users")
  # security.polkit.extraConfig = ''
    # polkit.addRule(function(action, subject) {
        # if (action.id == "org.freedesktop.policykit.exec" &&
            # action.lookup("program") == "/run/current-system/sw/bin/modprobe" &&
            # subject.isInGroup("users")) {
            # return polkit.Result.YES;
        # }
    # });
  # '';

  # Open network ports
  networking.firewall.allowedTCPPorts = [ 7000 7001 7100 ];
  networking.firewall.allowedUDPPorts = [ 5353 6000 6001 7011 ];

  # UXPLAY - To enable network-discovery
  services.avahi = {
    enable = true;
    nssmdns = true;  # printing
    openFirewall = true; # ensuring that firewall ports are open as needed
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
      domain = true;
    };
  };

  # Sunshine - https://nixos.wiki/wiki/Sunshine
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  # Samba Client
    # For mount.cifs, required unless domain name resolution is not needed.
  fileSystems."/mnt/share" = {
    device = "//192.168.1.210/sambashare";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };

  # Connect to sambashare with thunar
  services.gvfs = {
    enable = true;
    # package = lib.mkForce pkgs.gnome3.gvfs;
  };

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    # pkgs.xdg-desktop-portal-hyprland # Removed until update 1.3.3
    pkgs.xdg-desktop-portal-gtk
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # i3 polybar module fix
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
    # nvidia-x11
    # nvidia-settings
    # nvida-persistenced
  # ];

  # OBS
  environment.systemPackages = [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  # KEYD - https://github.com/rvaiya/keyd/issues/375#issuecomment-1307876178

  # Create keyd group
  # users.groups.keyd.name = "keyd";

  # Create systemd service
  systemd.services.keyd = {
    description = "key remapping daemon";
    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];
    wantedBy = [ "sysinit.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.keyd}/bin/keyd";
      # Restart = "on-failure";
    };
  };

  # Add quirks to make touchpad's "disable-while-typing" work properly
  environment.etc."libinput/local-overrides.quirks".text = ''
    [keyd]
    MatchUdevType=keyboard
    MatchVendor=0xFAC
    AttrKeyboardIntegration=internal
  '';

  # Configuration for keyd
  environment.etc."keyd/default.conf".text = ''
    [ids]
    *

    [main]
    
    capslock = overload(capslock_layer, backspace)

    [capslock_layer]

    w = up
    a = left
    s = down
    d = right
    q = C-left
    e = C-right
    z = C-S-left
    c = C-S-right
    x = delete
    r = home
    f = end
    t = C-home
    g = C-end
    v = S-home
    b = S-end
    esc = `
    space = enter
    n = 0
    m = 1
    , = 2
    . = 3
    j = 4
    k = 5
    l = 6
    u = 7
    i = 8
    o = 9
    / = .
    ; = +
    p = -
    y = /
    h = *
    ' = =
    1 = f1
    2 = f2
    3 = f3
    4 = f4
    5 = f5
    6 = f6
    7 = f7
    8 = f8
    9 = f9
    0 = f10
    - = f11
    = = f12
  '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
