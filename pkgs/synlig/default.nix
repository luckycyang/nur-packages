{
  stdenv,
  lib,
  fetchurl,
  fetchpatch,
  pkg-config,
  antlr4,
  capnproto,
  readline,
  surelog,
  uhdm,
  yosys,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "yosys-synlig";
  plugin = "synlig";

  # The module has automatic regular releases, with date + short git hash
  GIT_VERSION = "2024-06-26-96c444a";

  # Derive our package version from GIT_VERSION, remove hash, just keep date.
  version = builtins.concatStringsSep "-" (
    lib.take 3 (builtins.splitVersion finalAttrs.GIT_VERSION)
  );

  src = fetchurl {
    url = "https://github.com/chipsalliance/synlig/releases/download/2024-06-26-96c444a/synlig-plugin-96c444a-2024-06-26.tar.gz";
    hash = "sha256-GF7ntF64+hJMOEBP2mBn9Scbp1a2Zir3ACEuHyfYbcQ=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    antlr4.runtime.cpp
    capnproto
    readline
    surelog
    uhdm
    yosys
  ];

  installPhase = ''
    runHook preInstall
    ls -l
    mkdir -p $out/share/yosys/plugins
    cp current/share/yosys/plugins/systemverilog.so \
           $out/share/yosys/plugins/synlig.so
    runHook postInstall
  '';

  meta = with lib; {
    description = "SystemVerilog support plugin for Yosys";
    homepage = "https://github.com/chipsalliance/synlig";
    license = licenses.asl20;
    maintainers = with maintainers; [hzeller];
    platforms = platforms.all;
  };
})
