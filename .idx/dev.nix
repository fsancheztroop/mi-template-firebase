{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = [];

  env = {};

  idx = {
    extensions = [
      "google.geminicodeassist"
      "Natizyskunk.sftp"
    ];

    previews = {
      enable = true;
      previews = {};
    };

    workspace = {
      onCreate = {
        setup-gitignore = ''
          echo ".vscode/sftp.json" >> .gitignore
          echo "stats/" >> .gitignore
          echo "backups/" >> .gitignore
        '';
        setup-sftp = ''
          mkdir -p .vscode
          cat <<EOF > .vscode/sftp.json
          {
              "name": "Produccion",
              "host": "TU_SERVIDOR",
              "protocol": "sftp",
              "port": 22,
              "username": "TU_USUARIO",
              "remotePath": "/ruta/en/el/servidor",
              "uploadOnSave": false,
              "syncMode": "update",
              "ignore": [
                  ".vscode",
                  ".git",
                  ".git/**",
                  ".DS_Store",
                  "legacy/"
              ]
          }
          EOF
        '';
      };
      onStart = {};
    };
  };
}
