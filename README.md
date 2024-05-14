# dotfiles

Personal dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Pre-requisites

A proxy is needed to access the Internet. Set the proxy with:

    # For macOS / Linux
    export http_proxy=http://127.0.0.1:7890
    export https_proxy=http://127.0.0.1:7890

    # For Windows PS
    $Env:http_proxy="http://127.0.0.1:7890"
    $Env:https_proxy="http://127.0.0.1:7890"

## Import GnuPG

```shell
gpg --homedir ~/.local/share/gnupg
gpg --import private.asc
```

## Install

Install them with:

    # For ubuntu
    sudo apt update && sudo apt install git gpg pass -y
    sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --branch dev magicwenli
    ~/.local/bin/chezmoi apply

    # For Windows PS
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    (irm -useb https://get.chezmoi.io/ps1) | powershell -c -
    & .\bin\chezmoi.exe init --apply magicwenli
