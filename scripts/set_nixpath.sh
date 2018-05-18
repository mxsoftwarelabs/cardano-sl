update_NIX_PATH() {
  readlink=$(nix-instantiate --eval -E "/. + (import <nix/config.nix>).coreutils")/readlink
  local readlink
  scriptDir=$(dirname -- "$("$readlink" -f -- "${BASH_SOURCE[0]}")")
  local scriptDir
  NIX_PATH="nixpkgs=$(nix-build "${scriptDir}/../fetch-nixpkgs.nix" --no-out-link)"
  export NIX_PATH
}
update_NIX_PATH
