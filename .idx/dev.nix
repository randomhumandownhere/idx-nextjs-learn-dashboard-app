{pkgs}: {
  channel = "stable-23.11";
  packages = [
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
  ];
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "alphabotsec.vscode-eclipse-keybindings"
    ];
    workspace = {
      onCreate = {
        commands = ''
          chmod +x .idx/onCreate.sh
          .idx/onCreate.sh
        '';
        default.openFiles = ["app/page.tsx"];
      };
    };
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["pnpm" "dev" "--port" "$PORT" "--hostname" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
