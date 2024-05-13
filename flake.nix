{ 
  description = "A Python environment with mofapy2 package";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let

    pkgs = import nixpkgs { system = "x86_64-linux"; };

    pyenv = import ./pyenv.nix {
      inherit pkgs;
      python3 = pkgs.python311;
      injectPackages = ps: []; #[ ps.ipykernel ];
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
