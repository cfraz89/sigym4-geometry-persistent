{ nixpkgs, mkDerivation, base, base16-bytestring, binary, bytestring
, conduit, containers, esqueleto, hspec, HUnit, monad-control
, monad-logger, persistent, persistent-postgresql
, persistent-template, QuickCheck, resourcet
, stdenv, text, transformers, callCabal2nix, fetchFromGitHub
}:
let
   sigym4-geometry = callCabal2nix "sigym4-geometry" (fetchFromGitHub {
      owner = "krisajenkins";
      repo = "sigym4-geometry";
      rev = "26d0cef776106b9dba8b933296865f7bcc81d902";
      sha256 = "087bmgfpr73rc6vc6gvyxh7b79zfdcy7lyr7ls81y0kn5zh8c1a2";
   }) {};
in
mkDerivation {
  pname = "sigym4-geometry-persistent";
  version = "0.1.0.1";
  src = ./.;
  libraryHaskellDepends = [
    base base16-bytestring binary bytestring esqueleto persistent
    persistent-postgresql sigym4-geometry
  ];
  testHaskellDepends = [
    base conduit containers esqueleto hspec HUnit monad-control
    monad-logger persistent persistent-postgresql persistent-template
    QuickCheck resourcet sigym4-geometry text transformers
  ];
  doCheck = false;
  homepage = "https://github.com/meteogrid/sigym4-geometry-persistent";
  description = "Interoperatibility with postgis geometry columns for persistent-postgresql";
  license = stdenv.lib.licenses.mit;
}
