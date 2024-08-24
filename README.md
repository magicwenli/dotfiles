# Dotfiles

This dotfiles only for ubuntu and debian based distros.

## Installation

```bash
# fish shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply magicwenli
```

## Features

This dotfiles include 3 distros for various usage.

|                                      | tiny | middle | full |
| ------------------------------------ | ---- | ------ | ---- |
| linuxbrew                            | ✅   | ✅     | ✅   |
| fish                                 | ✅   | ✅     | ✅   |
| less cli tools(rg, fd, dust, ..)     | ✅   | ✅     | ✅   |
| more cli tools(bat, fzf, eza, ..)    |      | ✅     | ✅   |
| dev tools(git, openssl, just, ..)    |      | ✅     | ✅   |
| dev languages(nvm, python, rust, ..) |      |        | ✅   |

## Test

The dotfiles can be tested in docker.

```bash
cd docker
docker compose up -d
# change password for ubuntu
docker compose exec -u 0 dotfiles passwd ubuntu
# login to ubuntu
docker compose exec dotfiles bash
# once login, you can install dotfiles with chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply .
```

after test, you can clean the docker.

```bash
docker compose down
```
