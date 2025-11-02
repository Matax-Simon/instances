{
  lib,
  # pkgs,
  config,
  ...
}: let
  cfg = config.matax.www;

  default =
    if (cfg.domain == "")
    then {
      "default_server" = {
        default = true;
        root = "/var/www/matax-uz";
      };
    }
    else {
      ${cfg.domain} = {
        default = true;
        forceSSL = true;
        enableACME = true;
        serverAliases = cfg.alias;
        root = "/var/www/matax-uz";
      };
    };
in {
  options = {
    matax.www = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the web server/proxy.";
      };

      domain = lib.mkOption {
        type = lib.types.str;
        default = "matax.uz"; # work in progress
        description = "The default signature domain of instance.";
      };

      alias = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "List of extra aliases to host.";
      };

      anubis = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Add nginx user to anubis group for unix socket access.";
      };

      hosts = lib.mkOption {
        type = with lib.types; attrsOf (submodule anything);
        default = {};
        description = "List of hosted service instances.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = !((builtins.length cfg.alias) != 0 && cfg.domain == "");
        message = "don't set aliases if there's no primary domain yet";
      }
    ];

    users.users.nginx.extraGroups = lib.optionals config.matax.www.anubis [config.users.groups.anubis.name];

    # Configure Nginx
    services.nginx = {
      # Enable the Nginx web server
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;

      # Default virtual host
      virtualHosts = lib.mkMerge [
        default
        cfg.hosts
      ];
    };

    # Accepting ACME Terms
    security.acme = {
      acceptTerms = true;
      defaults = {
        email = "magdiyevbahrom@gmail.com";
      };
    };

    # Ensure the firewall allows HTTP and HTTPS traffic
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
    networking.firewall.allowedUDPPorts = [
      80
      443
    ];
  };

  # meta = {
  #   doc = ./readme.md;
  #   buildDocsInSandbox = true;
  #   maintainers = with lib.maintainers; [bahrom04];
  # };
}
