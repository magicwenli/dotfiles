# vim: syntax=sh

# LOAD PLUGINS FROM GITHUB
zinit lucid wait for \
    atload'_zsh_autosuggest_start' \
    'zsh-users/zsh-autosuggestions' \
    blockf atpull'zinit creinstall -q .' \
    'zsh-users/zsh-completions'

zinit lucid atload"zicompinit; zicdreplay" for \
    'zdharma/fast-syntax-highlighting'

zinit light zinit-zsh/z-a-patch-dl

zinit ice lucid \
    && zinit light "tarrasch/zsh-bd"

# start dashboard for the shell
zinit ice lucid                                      \
    && zinit light "zdharma-continuum/zsh-startify"    \
    && zstyle ":plugin:zsh-startify:vim"        size 5 \
    && zstyle ":plugin:zsh-startify:shellutils" size 5 \
    && bindkey "^n" autosuggest-accept

# git wrapper for fzf
zinit ice lucid wait --if="[ -n $(command -v git) ]" \
    && zinit light "wfxr/forgit"                           \
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

# use fzf for tab completion
zinit ice lucid --if="[ -n $(command -v fzf) ]" \
    && zinit light "aloxaf/fzf-tab"

# status line for the shell
zinit ice lucid \
 && zinit light "romkatv/powerlevel10k"

# colorize output using the grc command
zinit ice lucid wait --if="[ -n $(command -v grc) ]" \
    && zinit light "unixorn/warhol.plugin.zsh"

# suggest a command based on previous history
zinit ice lucid \
    && zinit light "zsh-users/zsh-autosuggestions"

# alias reminder when you type a full command
zinit ice lucid \
    && zinit light "michaelaquilina/zsh-you-should-use"
