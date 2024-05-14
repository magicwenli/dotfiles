#!/bin/sh

set -e # -e: exit on error

if ! command -v gpg >/dev/null || ! command -v git >/dev/null || ! command -v pass >/dev/null; then
  echo "Installing gpg, git, and pass" >&2
  sudo apt update
  sudo apt install -y gpg git pass

  echo "please config gpg with gpg --homedir ~/.local/share/gnupg"
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

cz_dir="$HOME/.local/share/chezmoi"
git clone https://github.com/magicwenli/dotfiles.git -b dev "$cz_dir"
cd $cz_dir
export PASSWORD_STORE_DIR="$cz_dir/linux/private_dot_password-store"
exec "$chezmoi" init --apply --data=false "$@"