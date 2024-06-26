{
  stdenv,
  lib,
  fetchurl,
  autoPatchelfHook,
}:
stdenv.mkDerivation {
  pname = "gear";
  version = "1.4.1";
  src = fetchurl {
    url = "https://gear-builds.s3.amazonaws.com/gear-v1.4.1-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-rmbhF7MULnBjbxERfHwyNRFwIrUiawX1UaxMVERd98o=";
  };

  LD_LIBRARY_PATH = lib.makeLibraryPath [stdenv.cc.cc];
  buildInputs = [stdenv.cc.cc.lib];
  nativeBuildInputs = [autoPatchelfHook];
  sourceRoot = ".";
  installPhase = ''
    runHook preInstall
    install -m755 -D gear $out/bin/gear
    runHook postInstall
  '';
  meta = with lib; {
    homepage = "https://github.com/gear-tech/gear";
    description = "About Web3 Ultimate Execution Engine";
    platforms = platforms.all;
    license = licenses.gpl3Only;
  };
}
