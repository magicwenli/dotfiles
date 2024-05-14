z4h load ohmyzsh/ohmyzsh/plugins/brew
z4h load ohmyzsh/ohmyzsh/plugins/encode64
z4h load ohmyzsh/ohmyzsh/plugins/extract
z4h load ohmyzsh/ohmyzsh/plugins/fzf
z4h load ohmyzsh/ohmyzsh/plugins/git
z4h load ohmyzsh/ohmyzsh/plugins/thefuck
z4h load michaelaquilina/zsh-you-should-use
z4h load wfxr/forgit                                       \
    && forgit_log="fglo"                                   \
    && forgit_add="fga"                                    \
    && forgit_diff="fgd"                                   \
    && forgit_fixup="fgfu"                                 \
    && forgit_clean="fgclean"                              \
    && forgit_rebase="fgrb"                                \
    && forgit_ignore="fgi"                                 \
    && forgit_stash_show="fgss"                            \
    && forgit_cherry_pick="fgcp"                           \
    && forgit_reset_head="fgrh"                            \
    && forgit_checkout_file="fgcf"                         \
    && forgit_checkout_branch="fgcb"                       \
    && forgit_checkout_commit="fgco"

if [ -n "$(command -v grc)" ]; then
    z4h load unixorn/warhol.plugin.zsh
fi

if [ -n "$(command -v direnv)" ]; then
    eval "$(direnv hook zsh)"
fi

if [ -n "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh --cmd j)"
fi

if [ -n "$(command -v docker)" ]; then
    z4h load ohmyzsh/ohmyzsh/plugins/docker/completions/_docker
fi

if [ -n "$(command -v repo)" ]; then
    z4h load ohmyzsh/ohmyzsh/plugins/repo/_repo
fi

if [ -n "$(command -v atuin)" ]; then
    eval "$(atuin init zsh --disable-up-arrow)" # Bind ctrl-r but not up arrow
fi