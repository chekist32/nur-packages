{ pkgs }:
let
  ccra-pkg =
    (builtins.getFlake "git+https://git.uncleched.com/chekist32/rust-crypto-price-api?ref=refs/tags/v0.1.0")
    .packages.${pkgs.system}.default;
in
{
  ccra = ccra-pkg.overrideAttrs (oldAttrs: {
    meta = (oldAttrs.meta or { }) // {
      description = "Simple crypto rates API built with Rust";
      license = pkgs.lib.licenses.unfreeRedistributable;
      platforms = pkgs.lib.platforms.linux;
    };
  });
}
