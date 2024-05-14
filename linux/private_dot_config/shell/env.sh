# vim: syntax=sh

# ENABLE DEBUGGING
DEBUG=0
function debug_info () {
    [ "$DEBUG" -eq 1 ]                             \
        && reset="$(tput sgr0)"                    \
        && green="$(tput setaf 2)"                 \
        && printf "${green}[INFO] ${@} ${reset}\n" \
        >&2
    return 0
}

# SETUP XDG BASE DIRECTORIES
# https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_DATA_HOME="$HOME/.local/share" \
    && debug_info "Exporting XDG_DATA_HOME='$XDG_DATA_HOME'"
export XDG_CACHE_HOME="$HOME/.cache"      \
    && debug_info "Exporting XDG_CACHE_HOME='$XDG_CACHE_HOME'"
export XDG_STATE_HOME="$HOME/.state"      \
    && debug_info "Exporting XDG_STATE_HOME='$XDG_STATE_HOME'"
export XDG_CONFIG_HOME="$HOME/.config"    \
    && debug_info "Exporting XDG_CONFIG_HOME='$XDG_CONFIG_HOME'"

# SETUP XDG USER DIRECTORIES
export XDG_MUSIC_DIR="$HOME/Music"         \
    && debug_info "Exporting XDG_MUSIC_DIR='$XDG_MUSIC_DIR'"
export XDG_VIDEOS_DIR="$HOME/Videos"       \
    && debug_info "Exporting XDG_VIDEOS_DIR='$XDG_VIDEOS_DIR'"
export XDG_DESKTOP_DIR="$HOME/Desktop"     \
    && debug_info "Exporting XDG_DESKTOP_DIR='$XDG_DESKTOP_DIR'"
export XDG_PICTURES_DIR="$HOME/Pictures"   \
    && debug_info "Exporting XDG_PICTURES_DIR='$XDG_PICTURES_DIR'"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"  \
    && debug_info "Exporting XDG_DOWNLOAD_DIR='$XDG_DOWNLOAD_DIR'"
export XDG_DOCUMENTS_DIR="$HOME/Documents" \
    && debug_info "Exporting XDG_DOCUMENTS_DIR='$XDG_DOCUMENTS_DIR'"
export XDG_TEMPLATES_DIR="$HOME/Templates" \
    && debug_info "Exporting XDG_TEMPLATES_DIR='$XDG_TEMPLATES_DIR'"
export XDG_PUBLICSHARE_DIR="$HOME/Public"  \
    && debug_info "Exporting XDG_PUBLICSHARE_DIR='$XDG_PUBLICSHARE_DIR'"

# SETUP HISTORY SETTINGS
export SAVEHIST=10000000                           \
    && debug_info "Exporting SAVEHIST='$SAVEHIST'"
export HISTSIZE=10000000                            \
    && debug_info "Exporting HISTSIZE='$HISTSIZE'"
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zsh_history" \
    && debug_info "Exporting HISTFILE='$HISTFILE'"

# ADD USER SCRIPTS TO PATH
export PATH="$PATH:$XDG_DATA_HOME/../bin" \
    && debug_info "Exporting PATH='$PATH'"

# SETUP LANGUAGE SETTINGS
export LANG="en_US.UTF-8" \
    && debug_info "Exporting LANG='$LANG'"

# SETUP EDITING SETTINGS
export PAGER="bat" \
    && debug_info "Exporting PAGER='$PAGER'"
export EDITOR="nvim" \
    && debug_info "Exporting EDITOR='$EDITOR'"

# SETUP ZSH SETTINGS
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" \
    && debug_info "Exporting ZDOTDIR='$ZDOTDIR'"

[ -d "/opt/homebrew/bin/" ]      \
    && _BREW="/opt/homebrew/bin" \
    || [ -d "/home/linuxbrew/.linuxbrew/bin" ] \
        && _BREW="/home/linuxbrew/.linuxbrew/bin" \
        || _BREW="${HOME}/.linuxbrew/bin" \

export ZPFX="$XDG_DATA_HOME/zinit/polaris" \
    && debug_info "Exporting ZPFX='$ZPFX'"

# INITIALIZE CLI TOOLS FUNCTIONS
[ -n "$(command -v $_BREW/brew)" ]    \
    && eval "$($_BREW/brew shellenv)" \
    && debug_info "Initializing functions for 'brew'"

[ -n "$(command -v pipx)" ]                                \
    && debug_info "Initializing functions for 'pipx'"      \
    && export PIPX_HOME="$XDG_DATA_HOME/pipx"              \
    && debug_info "Exporting PIPX_PATH='$PIPX_HOME'"       \
    && export PIPX_BIN_DIR="$XDG_DATA_HOME/../bin"         \
    && debug_info "Exporting PIPX_BIN_DIR='$PIPX_BIN_DIR'"

[ -d "$HOME/.cargo/" ]      \
    && . "$HOME/.cargo/env"

[ -n "$(command -v rbenv)" ]                           \
    && debug_info "Initializing functions for 'rbenv'"  \
    && eval "$(rbenv init -)"                           \
    && export RBENV_ROOT="$XDG_DATA_HOME/rbenv"          \
    && debug_info "Exporting RBENV_ROOT='$RBENV_ROOT'"

[ -n "$(command -v jenv)" ]                           \
    && debug_info "Initializing functions for 'jenv'"  \
    && eval "$(jenv init -)"                           \
    && export JENV_ROOT="$XDG_DATA_HOME/jenv"           \
    && debug_info "Exporting JENV_ROOT='$JENV_ROOT'"

[ -n "$(command -v sdk)" ]                           \
    && debug_info "Initializing functions for 'sdk'"  \
    && export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"       \
    && debug_info "Exporting SDKMAN_DIR='$SDKMAN_DIR'"

[ -n "$(command -v asdf)" ]                           \
    && debug_info "Initializing functions for 'asdf'" \
    && export ASDF_DIR="$XDG_DATA_HOME/asdf"           \
    && debug_info "Exporting ASDF_DIR='$ASDF_DIR'"

[ -n "$(command -v volta)" ]                           \
    && debug_info "Initializing functions for 'volta'" \
    && export VOLTA_HOME="$XDG_DATA_HOME/volta"         \
    && debug_info "Exporting VOLTA_HOME='$VOLTA_HOME'"

[ -n "$(command -v pyenv)" ]                           \
    && debug_info "Initializing functions for 'pyenv'" \
    && eval "$(pyenv init --path)"                     \
    && export PYENV_ROOT="$XDG_DATA_HOME/pyenv"        \
    && debug_info "Exporting PYENV_ROOT='$PYENV_ROOT'"

[ -n "$(command -v goenv)" ]                           \
    && debug_info "Initializing functions for 'goenv'" \
    && eval "$(goenv init -)"                          \
    && export GOPATH="$XDG_DATA_HOME/go"               \
    && debug_info "Exporting GOPATH='$GOPATH'"         \
    && export GOENV_ROOT="$XDG_DATA_HOME/goenv"        \
    && debug_info "Exporting GOENV_ROOT='$GOENV_ROOT'" \
    && export GOENV_GOPATH_PREFIX="$GOPATH"            \
    && debug_info "Exporting GOENV_GOPATH_PREFIX='$GOENV_GOPATH_PREFIX'"

[ -n "$(command -v pyenv)" ]                           \
    && debug_info "Initializing functions for 'pyenv'" \
    && eval "$(pyenv init --path)"                     \
    && export PYENV_ROOT="$XDG_DATA_HOME/pyenv"        \
    && debug_info "Exporting PYENV_ROOT='$PYENV_ROOT'"

# CLI TOOLS SETTINGS
[ -n "$(command -v rg)" ]                                                 \
    && export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgrep.conf" \
    && debug_info "Exporting RIPGREP_CONFIG_PATH='$RIPGREP_CONFIG_PATH'"

[ -n "$(command -v gpg)" ]                     \
    && export GNUPGHOME="$XDG_DATA_HOME/gnupg" \
    && debug_info "Exporting GNUPGHOME='$GNUPGHOME'"

[ -n "$(command -v bat)" ]                                    \
    && export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf" \
    && debug_info "Exporting BAT_CONFIG_PATH='$BAT_CONFIG_PATH'"

[ -n "$(command -v fzf)" ]                                                                       \
    && export FZF_TMUX_HEIGHT="80%"                                                              \
    && export FZF_DEFAULT_OPTS="                                                  \
        --prompt='~ ❯ '                                                           \
        --height='80%'                                                            \
        --marker='✗'                                                              \
        --pointer='▶'                                                             \
        --border                                                                  \
        --inline-info                                                             \
        --layout=reverse                                                          \
        --preview                                                                 \
            '([[ -f {} ]] &&                                                      \
            (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && \
            (exa --tree --icons --color=always {} | less)) || echo {} 2> /dev/null | head -200'" \
    && export FZF_DEFAULT_COMMAND="fd --type f"                                                  \
    && debug_info "Exporting FZF_DEFAULT_COMMAND='$FZF_DEFAULT_COMMAND'"                         \
    && export FZF_COMPLETION_TRIGGER="**"                                                        \
    && debug_info "Exporting FZF_COMPLETION_TRIGGER='$FZF_COMPLETION_TRIGGER'"

[ -n "$(command -v navi)" ]                           \
    && debug_info "Initializing functions for 'navi'" \
    && eval "$(navi widget zsh)"                      \
    && export NAVI_PATH="$XDG_CONFIG_HOME/navi"       \
    && debug_info "Exporting NAVI_PATH='$NAVI_PATH'"

[ -n "$(command -v nvim)" ] \
    && export EDITOR="nvim" \
    && debug_info "Exporting EDITOR='$EDITOR'"

[ -n "$(command -v vivid)" ]                                       \
    && export LS_COLORS="$(vivid -m 24-bit generate gruvbox-dark)" \
    && debug_info "Exporting LS_COLORS='$LS_COLORS'"

[ -n "$(command -v packer)" ] \
    && export PACKER_CONFIG="$XDG_CONFIG_HOME/packer.json"       \
    && debug_info "Exporting PACKER_CONFIG='$PACKER_CONFIG'"     \
    && export PACKER_HOME_DIR="$XDG_CACHE_HOME/packer"           \
    && debug_info "Exporting PACKER_HOME_DIR='$PACKER_HOME_DIR'" \
    && export PACKER_LOG_PATH="$XDG_CACHE_HOME/packer/logs"      \
    && debug_info "Exporting PACKER_LOG_PATH='$PACKER_LOG_PATH'"

[ -n "$(command -v sshpass)" ]                \
    && export SSHPASS="$(pass show ssh/pass)" \
    && debug_info "Exporting SSHPASS='$SSHPASS'"

[ -n "$(command -v thefuck)" ]    \
    && eval $(thefuck --alias)    \
    && debug_info "Initializing functions for 'thefuck'"