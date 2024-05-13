{
  pkgs,
  python3,
  injectPackages ? (ps: [])
}:

let

  # see https://summer.nixos.org/blog/callpackage-a-tool-for-the-lazy/
  callPackage = pkgs.lib.callPackageWith (python3.pkgs // packages);

  packages = {
    anndata = callPackage ./anndata.nix { fetchPypi = pkgs.fetchPypi; };
    mofapy2 = callPackage ./mofapy2.nix { fetchFromGitHub = pkgs.fetchFromGitHub; };
  };

in (

  python3.withPackages (
    ps: 
      #(builtins.map (a: builtins.getAttr a ps) (builtins.attrNames packages))
      [ packages.mofapy2 ]
      ++ (injectPackages ps)
  )

)
