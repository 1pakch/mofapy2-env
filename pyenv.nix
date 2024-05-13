{
  python3,
  callPackageWith,
  injectPackages ? (ps: [])
}:

let

  # see https://summer.nixos.org/blog/callpackage-a-tool-for-the-lazy/
  callPackage = callPackageWith (python3.pkgs // packages);

  packages = {
    # name = callPackage ./definition.nix
  };

in (

  python3.withPackages (
    ps:
      (builtins.attrNames packages)
      ++ (injectPackages ps)
  )

)
