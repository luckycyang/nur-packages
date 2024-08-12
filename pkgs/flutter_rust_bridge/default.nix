{
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  lib
}:
rustPlatform.buildRustPackage rec {
  pname = "flutter_rust_bridge";
  version = "v2.2.0";

  src = fetchFromGitHub {
    owner = "fzyzcjy";
    repo = pname;
    rev = version;
    sha256 = "sha256-I1f1Dye9DH5/cNYZhPPXcNZ1gG7a0F4Yj9G2SIe1aJ8=";
  };

  cargoSha256 = "sha256-7qag39B0DBUEmCdyJEuBPs5W0lT7ehlQkuDKAMAm/Ys=";

  doCheck = false;

  meta = with lib; {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = licenses.unlicense;
    maintainers = [ maintainers.tailhook ];
  };
}
