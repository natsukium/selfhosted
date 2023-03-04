{
  description = "Simple Docker Flake project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.calibre = pkgs.dockerTools.buildImage {
          name = "calibre";
          tag = "6.11.0";

          config = { Cmd = [ "${pkgs.calibre}/bin/calibre" ]; };

          created = "now";
        };
        packages.calibre-web = pkgs.dockerTools.buildImage {
          name = "calibre-web";
          tag = "0.6.19";

          config = { Cmd = [ "${pkgs.calibre-web}/bin/calibre-web" ]; };

          created = "now";
        };
      });
}
