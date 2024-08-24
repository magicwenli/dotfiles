# Don't move functions from ~/.config/fish/conf.d to ~/.config/fish/functions
# or it will not be loaded by fish.
#
# To use functions autoloading, put one function per file in ~/.config/fish/functions.
# And make sure the file name is the same as the function name.

### Functions
function custom_funcs --description 'Custom functions'
    echo "custom functions loaded"
end

# input last history when type `!!`
function last_history_item --description 'Get the last history item'
    echo $history[1]
end

# git
function gerrit_push_commit --description 'Push commit to gerrit'
    set remote_info (git rev-parse --abbrev-ref --symbolic-full-name @{u})
    set remote_name (string split -m 1 -r / $remote_info)[1]
    set remote_branch (string split -m 1 -r / $remote_info)[2]
    echo "git push $remote_name HEAD:refs/for/$remote_branch"
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
    if not set -q __HTTP_PROXY; or contains -- -f $argv
        read -P "proxy string(http://ip:port) " -Ux __HTTP_PROXY
        echo "set proxy string: $__HTTP_PROXY"
    end
    set -gx http_proxy $__HTTP_PROXY
    set -gx https_proxy $__HTTP_PROXY
end

function unpxy --description 'Unset proxy. use -f to force'
    if contains -- -f $argv
        set -e __HTTP_PROXY
    end
    set -e http_proxy
    set -e https_proxy
    echo "unset proxy"
end

function git_config_user --description 'Set git user. -f to force. -g to global, otherwise local'
    if not set -q __CONFIG_USER; or contains -- -f $argv
        read -P "Input git user name: " -Ux __CONFIG_USER
        read -P "Input git user email: " -Ux __CONFIG_EMAIL
        if test -z $__CONFIG_USER; or test -z $__CONFIG_EMAIL
            echo "user name or email is empty. abort"
            return -1
        end
    end
    set -f func_arg " "
    if contains -- -g $argv
        set -f func_arg " --global"
    end
    git config user.name "$__CONFIG_USER" "$func_arg"
    git config user.email "$__CONFIG_EMAIL" "$func_arg"
    echo "set git user$func_arg: $__CONFIG_USER <$__CONFIG_EMAIL>"
end

function git_sync_tag_date --description 'Sync tag date with author date.'
    if test -z $argv
        echo "Usage: git_sync_tag_date <message>"
        echo "  ex: git_sync_tag_date 'bump: '"
        echo "will auto add tag name after message"
        return -1
    end
    git for-each-ref --format="%(refname:short) %(taggerdate:short)" refs/tags | while read tag date
        set -l rev (git rev-list -n 1 $tag)
        set -l commit_date (git show -s --format=%ai --date=short $rev)
        if not contains -- "$date" "$commit_date"
            GIT_COMMITTER_DATE="$commit_date" git tag -f -a $tag -m "$argv$tag" $rev
            echo "sync $tag date to $commit_date($rev)"
        end
    end
end

# fzf func
function fzf_custom --description 'Custom opts for fzf'
    set -l file $argv
    if test -f $file;
        if test (file $file | grep text)
            bat --style=numbers --color=always $file; or cat $file
        else
            set_color red; echo $file; set_color normal; echo is binary
        end
    else
        if test -d $file
            eza --icons --color=always -l -sold $file; or ls -al $file
        end
    end
end
