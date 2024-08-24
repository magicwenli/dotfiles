### Environment Variables

set -gx HOMEBREW_API_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
set -gx HOMEBREW_PIP_INDEX_URL "https://pypi.tuna.tsinghua.edu.cn/simple"

set -gx FZF_TMUX_HEIGHT "80%"
set -gx FZF_DEFAULT_OPTS "--prompt='~ ❯ ' --height='80%' --marker='✗'  \
    --inline-info --pointer='▶'                                        \
    --bind 'tab:down,btab:up,shift-up:preview-up,shift-down:preview-down,shift-left:preview-page-up,shift-right:preview-page-down' \
    --preview 'fzf_custom {}'"

set -gx FZF_DEFAULT_COMMAND "ls -p"
set -gx FZF_COMPLETION_TRIGGER "**"
