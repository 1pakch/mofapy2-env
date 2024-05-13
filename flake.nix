{ 
  description = "A Python environment with mofapy2 package";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let

    pkgs = import nixpkgs { system = "x86_64-linux"; };

    pyenv = import ./pyenv.nix {
      python3 = pkgs.python310;
      injectPackages = ps: []; #[ ps.ipykernel ];
      callPackageWith = pkgs.lib.callPackageWith;
    };

    flakeApp = program: {
      program = program;
      type = "app";
    };

  in {

    apps.x86_64-linux.default = flakeApp "${pyenv}/bin/python3";
    packages.x86_64-linux.default = pyenv;

  };
}
