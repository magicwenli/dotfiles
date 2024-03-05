# vim: syntax=sh

[ -n "$(command -v zoxide)" ]                           \
    && debug_info "Initializing functions for 'zoxide'" \
    && eval "$(zoxide init zsh --cmd j)"

[ -n "$(command -v direnv)" ]    \
    && eval "$(direnv hook zsh)" \
    && debug_info "Initializing functions for 'direnv'"

[ -n "$(command -v chezmoi)" ]          \
    && eval "$(chezmoi completion zsh)" \
    && debug_info "Initializing functions for 'chezmoi'"