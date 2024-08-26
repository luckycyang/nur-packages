{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "chiptool";
  version = "a349968cd740c03f1aa6bfbecc49c80db1e19fda";

  src = fetchFromGitHub {
    owner = "embassy-rs";
    repo = pname;
    rev = version;
    sha256 = "sha256-qGi0GpvKR/BQ1ZulkhAYKCsBV+qy+GucGA0fy6tVzQI=";
  };
  # cargoHash = "";

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "svd-parser-0.14.5" = "sha256-st68YwzqIkBCEvp01IuGNBBAR8czaGeownPDyScj9zU=";
    };
  };
  meta = with lib; {
    description = "Generate Rust register maps (`struct`s) from SVD files";
    mainProgram = "chiptool";
    homepage = "https://github.com/embassy-rs/chiptool";
    license = with licenses; [ mit asl20 ];
    maintainers = with maintainers; [ newam ];
  };

}
