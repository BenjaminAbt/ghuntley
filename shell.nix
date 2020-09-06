# Copyright (c) 2020 Geoffrey Huntley <ghuntley@ghuntley.com>. All rights reserved.
# SPDX-License-Identifier: Proprietary

with import <nixpkgs> { };
mkShell {

  nativeBuildInputs = [
    direnv
  ];

  NIX_ENFORCE_PURITY = true;

  shellHook = ''
    # Configure the local PATH to contain tools which are fetched ad-hoc
    # from Nix.

    export REPO_ROOT=`pwd`
    export PATH="$REPO_ROOT/bin:$PATH"
    export NIX_PATH="nixpkgs=$REPO_ROOT/default.nix"

    # Disable telemetry
    export DOTNET_CLI_TELEMETRY_OPTOUT=1

    echo "[dev-env] Setting up the development environment"
    "$REPO_ROOT/bin/de-init"
  '';
}