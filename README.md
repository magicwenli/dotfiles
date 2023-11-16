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

## Install

Install them with:

    # For macOS / Linux
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply magicwenli

    # For Windows PS
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    (irm -useb https://get.chezmoi.io/ps1) | powershell -c -
    & .\bin\chezmoi.exe init --apply magicwenli