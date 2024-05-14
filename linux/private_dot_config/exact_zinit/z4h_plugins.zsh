z4h load ohmyzsh/ohmyzsh/plugins/brew
z4h load ohmyzsh/ohmyzsh/plugins/encode64
z4h load ohmyzsh/ohmyzsh/plugins/extract
z4h load ohmyzsh/ohmyzsh/plugins/fzf
z4h load ohmyzsh/ohmyzsh/plugins/git
z4h load ohmyzsh/ohmyzsh/plugins/thefuck
z4h load michaelaquilina/zsh-you-should-use
# change forgit aliases
export forgit_revert_commit="fgrc"
export forgit_log="fglo"
export forgit_add="fga"
export forgit_diff="fgd"
export forgit_fixup="fgfu"
export forgit_clean="fgclean"
export forgit_rebase="fgrb"
export forgit_ignore="fgi"
export forgit_stash_show="fgss"
export forgit_cherry_pick="fgcp"
export forgit_reset_head="fgrh"
export forgit_checkout_file="fgcf"
export forgit_checkout_branch="fgcb"
export forgit_checkout_commit="fgco"
export forgit_revert_commit="fgrc"
z4h load wfxr/forgit

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