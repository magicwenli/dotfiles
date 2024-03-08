#!/bin/sh

set -e # -e: exit on error

if ! command -v gpg >/dev/null || ! command -v git >/dev/null || ! command -v pass >/dev/null; then
  echo "Installing gpg, git, and pass" >&2
  sudo apt update
  sudo apt install -y gpg git pass
fi

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://get.chezmoi.io)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
cd $script_dir
export PASSWORD_STORE_DIR="$script_dir/linux/private_dot_password-store"
exec "$chezmoi" init --apply --data=false "$@"