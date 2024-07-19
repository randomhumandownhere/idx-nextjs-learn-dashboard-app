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
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        clone-starter = "npx create-next-app@latest nextjs-dashboard --example \"https://github.com/vercel/next-learn/tree/main/dashboard/starter-example\" --use-pnpm";
        cd-dashboard = "cd nextjs-dashboard";
        npm-install = "pnpm i";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        cd-dashboard = "cd nextjs-dashboard";
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["pnpm" "dev" "--" "--port" "$PORT" "--hostname" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
