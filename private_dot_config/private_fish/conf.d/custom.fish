### Aliases

abbr gco "git checkout"
abbr gst "git status"
abbr gcp "git cherry-pick"

# for loop to cd into directories
abbr 4DIRS --set-cursor=! "$(string join \n -- 'for dir in */' 'cd $dir' '!' 'cd ..' 'end')"
abbr -a !! --position anywhere --function last_history_item

### Bind

### Environment Variables

set -gx HOMEBREW_API_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
set -gx HOMEBREW_PIP_INDEX_URL "https://pypi.tuna.tsinghua.edu.cn/simple" 

### Functions

# input last history when type `!!`
function last_history_item --description 'Get the last history item'
    echo $history[1]
end

# git
function grtgp --description 'Push commit to gerrit'
    set remote_name (git remote | head -n 1)
    set remote_branch (git rev-parse --abbrev-ref HEAD | head -n 1)
    git push $remote_name HEAD:refs/for/$remote_branch
end

# brew
function brew_formula_dep_tree --description 'Show dependency tree of a formula'
    brew deps --tree --installed $argv
end

function brew_formula_root_tree --description 'Show reverse dependency tree of a formula'
    brew uses --recursive --installed $argv
end

function brew_each_formula_size --description 'Show size of each formula'
    du -sch $(brew --cellar)/*/* | sed "s|$(brew --cellar)/\([^/]*\)/.*|\1|" | sort -k1 -rh
end

# op
function op_signin --description 'Sign in to 1Password'
    set SUBDOMAIN my
    eval (op signin --account $SUBDOMAIN)
end

# fish
function fish_find_function --description 'Find fish function'
    grep --files-with-matches "$argv" $fish_function_path/*.fish
end

function pxy --description 'Set proxy. use -f to force'
    if not set -q __HTTP_PROXY; or test "$argv" = "-f"
        read -P "proxy string(http://ip:port) " -Ux __HTTP_PROXY
        echo "set proxy string: $__HTTP_PROXY"
    end
    set -gx http_proxy $__HTTP_PROXY
    set -gx https_proxy $__HTTP_PROXY
end

function unpxy --description 'Unset proxy. use -f to force'
    if test "$argv" = "-f"
        set -e __HTTP_PROXY
    end
    set -e http_proxy
    set -e https_proxy
    echo "unset proxy"
end

function git_config_user --description 'Set git user for current repo. use -f to force'
    if not set -q __CONFIG_USER; or test "$argv" = "-f"
        read -P "git user name " -Ux __CONFIG_USER
        read -P "git user email " -Ux __CONFIG_EMAIL
    end
    git config user.name $__CONFIG_USER
    git config user.email $__CONFIG_EMAIL
    echo "set git user: $__CONFIG_USER <$__CONFIG_EMAIL>"
end