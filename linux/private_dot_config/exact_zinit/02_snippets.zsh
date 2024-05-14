# vim: syntax=sh

# LOAD OMZ SNIPPETS

# git aliases
zinit ice lucid wait --if="[ -n $(command -v git) ]" \
    && zinit snippet "OMZ::plugins/git/git.plugin.zsh"

# auto-completion with fzf
zinit ice lucid wait --if="[ -n $(command -v fzf) ]" \
    && zinit snippet "OMZ::plugins/fzf/fzf.plugin.zsh"

# un-archive any file pressing 'x'
zinit ice lucid wait  \
    && zinit snippet "OMZ::plugins/extract/extract.plugin.zsh"

# correct command pressing 'esc - esc'
zinit ice lucid wait  \
    && zinit snippet "OMZ::plugins/thefuck/thefuck.plugin.zsh"

# toggle fg and bg commands pressing 'ctrl + z'
zinit ice lucid wait  \
    && zinit snippet "OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh"

# shift and arrows to switch folder
zinit trackbinds bindmap'^[[1;3A -> ^[[1;2A' for "OMZ::plugins/dirhistory/dirhistory.plugin.zsh"

# complete repo
zinit ice as"completion" \
    && zinit snippet "OMZ::plugins/repo/_repo"

# complete docker
zinit ice as"completion" \
    && zinit snippet "OMZ::plugins/docker/completions/_docker"